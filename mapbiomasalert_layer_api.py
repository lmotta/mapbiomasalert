#!/usr/bin/python3
# # -*- coding: utf-8 -*-
"""
/***************************************************************************
Name                 : MapBiomas Alert
Description          : Class for work with MapBiomas Alert
Date                 : April, 2019
copyright            : (C) 2019 by Luiz Motta
email                : motta.luiz@gmail.com

 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/
"""

import json, binascii, os

from qgis.PyQt.QtCore import (
    QObject, QUrl,
    pyqtSlot, pyqtSignal
)
from qgis.PyQt.QtNetwork import QNetworkRequest
from qgis.PyQt.QtGui import QPixmap

from qgis.core import (
    Qgis, QgsProject, QgsApplication,
    QgsVectorLayer, QgsFeature, QgsGeometry,
    QgsCoordinateReferenceSystem, QgsCoordinateTransform,
    QgsBlockingNetworkRequest,
    QgsTask
)



class Geometry_WKB():
    # Adaptation from https://github.com/elpaso/quickwkt/blob/master/QuickWKT.py
    SRID_FLAG = 0x20000000
    @staticmethod
    def decodeBinary(geom_hex):
        value = binascii.a2b_hex(geom_hex)
        value = value[::-1]
        value = binascii.b2a_hex(value)
        return value.decode("UTF-8")

    @staticmethod
    def encodeBinary(geom_hex):
            wkb = binascii.a2b_hex("{:08x}".format( geom_hex ) )
            wkb = wkb[::-1]
            wkb = binascii.b2a_hex(wkb)
            return wkb.decode("UTF-8")

    @staticmethod
    def getQgsGeometry_SRID(geom_hex):
        """ geomHex: ST_AsHexEWKB(geom) or ST_AsHexWKB(geom) """
        srid = None
        geomType = int("0x" + Geometry_WKB.decodeBinary(geom_hex[2:10]), 0)
        if geomType & Geometry_WKB.SRID_FLAG:
            srid = int("0x" + Geometry_WKB.decodeBinary(geom_hex[10:18]), 0)
            # String the srid from the wkb string
            geom_hex = geom_hex[:2] + Geometry_WKB.encodeBinary(geomType ^ Geometry_WKB.SRID_FLAG) + geom_hex[18:]

        geom = QgsGeometry()
        geom.fromWkb(binascii.a2b_hex(geom_hex))
        
        return ( geom, srid )


class API_MapbiomasAlert(QObject):
    URL = QUrl('https://plataforma.alerta.mapbiomas.org/api/graphql')
    Q_TOKEN = """
    {
        "query": "mutation($email: String!, $password: String!)
            { 
                    createToken(email: $email, password: $password) { token }
            }",
        "variables": {
            "email": "_email_",
            "password": "_password_"
        }
    }
    """
    Q_ALLPUBLISHEDALERTS = """
    {
        "query": "
        query
        (
        $startDetectedAt: String
        $endDetectedAt: String
        $startPublishedAt: String
        $endPublishedAt: String
        $territoryIds: [Int!]
        $limit: Int
        $offset: Int
        )
        {
        allPublishedAlerts 
        (
            startDetectedAt: $startDetectedAt
            endDetectedAt: $endDetectedAt
            startPublishedAt: $startPublishedAt
            endPublishedAt: $endPublishedAt
            territoryIds: $territoryIds
            limit: $limit
            offset: $offset
        )
            { _fields_  }
        }",
        "variables": {
            "limit": _limit_, "offset": _offset_ ,
            "startDetectedAt": "_startDetectedAt_", "endDetectedAt": "_endDetectedAt_",
            "territoryIds": [ 17245 ]
        }
    }
    """
    Q_IMAGES = """
    {
        "query": "
        query(
            $alertId: Int!
        )
        {
        alertReport( alertId: $alertId )
        { images { before { url, satellite, acquiredAt } after  { url, satellite, acquiredAt } } }
        }",
        "variables": { "alertId": _alertId_ }
    }
    """
    LIMIT = 50
    message = pyqtSignal(str, Qgis.MessageLevel)
    status = pyqtSignal(str)
    alerts = pyqtSignal(list)
    images = pyqtSignal(dict)
    def __init__(self):
        super().__init__()
        self.taskManager = QgsApplication.taskManager()
        self.request = QgsBlockingNetworkRequest()
        self.nr = QNetworkRequest ( self.URL )
        self.nr.setHeader( QNetworkRequest.ContentTypeHeader, 'application/json')
        self.isOk = False

    def _request(self, data):
        data = data.replace('\n', '').encode('utf-8')
        err = self.request.post( self.nr, data )
        if not err == QgsBlockingNetworkRequest.NoError:
            return None
        ba = self.request.reply().content() # QByteArray
        content = bytes( ba ).decode()
        return json.loads( content )

    def _replaceQuery(self, values, query):
        q = query
        for v in values.keys():
            q = q.replace( f"_{v}_", str( values[ v] ) )
        return q

    def setToken(self, email, password):
        values = { 'email': email, 'password': password }
        data = self._replaceQuery( values, self.Q_TOKEN )
        response = self._request( data )
        if not response:
            self.message.emit( self.request.errorMessage(), Qgis.Warning )
            self.isOk = False
            return
        if not response['data']['createToken']:
            self.message.emit( 'Invalid email or password', Qgis.Warning )
            self.isOk = False
            return
        token = response['data']['createToken']['token']
        value = f"Bearer {token}"
        self.nr.setRawHeader( b'Authorization', value.encode('utf-8') )
        self.isOk = True

    def getAlerts(self, dbAlerts, startDetectedAt, endDetectedAt):
        def run(task):
            def request(values):
                data = self._replaceQuery( values, self.Q_ALLPUBLISHEDALERTS )
                response = self._request( data )
                if not response:
                    self.message.emit( self.request.errorMessage(), Qgis.Critical )
                    return -1
                values = response['data']['allPublishedAlerts']
                values = [ dbAlerts.transformItem( v ) for v in values ]
                self.alerts.emit( values )
                return len( values )

            def getFieldsName():
                fields = list( dbAlerts.FIELDSDEF.keys() )
                toField = fields.index('detectedAt') + 1
                fields = fields[:toField]
                return " ".join( fields ) + " cars { carCode } geometry { geom }"
            
            fieldsName =  getFieldsName()
            offset = 0
            while True:
                values = {
                    'startDetectedAt': startDetectedAt, 'endDetectedAt': endDetectedAt,
                    'limit': self.LIMIT, 'offset': offset, 'fields': fieldsName
                }
                total = request( values )
                if task.isCanceled():
                    self.message.emit('Canceled by user', Qgis.Warning)
                    return
                if total == -1:
                    return
                if total < self.LIMIT:
                    break
                offset += total
                self.status.emit(f"Receiving {offset}...")

            return { 'total': offset + total }

        def finished(exception, dataResult=None):
            if dataResult:
                self.status.emit(f"Finished {dataResult['total']} alerts")

        task = QgsTask.fromFunction('Alert Task', run, on_finished=finished )
        task.setDependentLayers( [ dbAlerts.layer ] )
        self.taskManager.addTask( task )
        # Debug
        #r = run( task )
        #finished(None, r)

    def getImages(self, alertId):
        def run(task):
            def getThumbnail(url):
                err = self.request.get( QNetworkRequest( QUrl( url ) ) )
                if not err == QgsBlockingNetworkRequest.NoError:
                    self.message.emit( self.request.errorMessage(), Qgis.Critical )
                    return None
                data = self.request.reply().content().data()
                pixmap = QPixmap()
                pixmap.loadFromData( data )
                return pixmap

            values = { 'alertId': alertId }
            data = self._replaceQuery( values, self.Q_IMAGES )
            response = self._request( data )
            if not response:
                self.message.emit( self.request.errorMessage(), Qgis.Critical )
                return None
            data = response['data']['alertReport']['images']
            for k in ( 'before', 'after'):
                data[ k ]['thumbnail'] = getThumbnail( data[k]['url'] )
            return data

        def finished(exception, dataResult=None):
            if dataResult:
                self.images.emit( dataResult )

        task = QgsTask.fromFunction('Alert/Get Images Task', run, on_finished=finished )
        self.taskManager.addTask( task )
        # Debug
        #r = run( task )
        #finished(None, r)


class DbAlerts(QObject):
    FIELDSDEF = {
        'alertCode': 'string(25)',
        'source': 'string(-1)',
        'areaHa': 'double',
        'detectedAt': 'date', # Need be the last field for API_MapBiomasAlert.getAlerts.run.getFieldsName
        'carCode': 'string(-1)',
    }
    CRS = QgsCoordinateReferenceSystem('EPSG:4674')
    def __init__(self, layer):
        super().__init__()
        self.layer = layer
        self.project = QgsProject.instance()
        self.project.layerWillBeRemoved.connect( self.removeLayer )
        #self.styleFile = os.path.join( os.path.dirname( __file__ ), 'alert.qml' )

    @staticmethod
    def transformItem(item):
        # Source
        item['source'] = ','.join( item['source'] )
        # Date
        detectedAt = item['detectedAt'].split('/')
        detectedAt.reverse()
        item['detectedAt'] = '-'.join( detectedAt )
        # carCode
        item['carCode'] = [ v['carCode'] for v in item['cars'] ]
        item['carCode'] = ','.join( item['carCode'] )
        del item['cars']
        # Geometry
        geom, srid = Geometry_WKB.getQgsGeometry_SRID( item['geometry']['geom'] )
        del item['geometry']
        item['geom'] = geom
        item['srid'] = srid
        
        return item

    @staticmethod
    def createLayer():
        name = 'Alert ..'
        l_fields = [ f"field={k}:{v}" for k,v in DbAlerts.FIELDSDEF.items() ]
        l_fields.insert( 0, f"Multipolygon?crs={DbAlerts.CRS.authid().lower()}" )
        l_fields.append( "index=yes" )
        uri = '&'.join( l_fields )
        return QgsVectorLayer( uri, name, 'memory' )

    def setLayer(self, startDetectedAt, endDetectedAt):
        name = f"Alert {startDetectedAt} .. {endDetectedAt}"
        self.layer.dataProvider().truncate()
        self.layer.setName( name )
        self.layer.updateExtents()
        self.layer.triggerRepaint()

    @pyqtSlot(list)
    def addFeatures(self, data):
        def add(item):
            # Geometry
            crs = QgsCoordinateReferenceSystem(f"EPSG:{item['srid']}")
            if not crs == self.CRS:
                ct = QgsCoordinateTransform( crs, self.CRS, self.project )
                item['geom'].transform( ct )
            # Add
            atts = [ item[k] for k in self.FIELDSDEF ]
            feat = QgsFeature()
            feat.setAttributes( atts )
            feat.setGeometry( item['geom'])
            provider.addFeature( feat )

        provider = self.layer.dataProvider()
        for item in data:
            add( item )
        self.layer.updateExtents()
        self.layer.triggerRepaint()

    @pyqtSlot(str)
    def removeLayer(self, layerId):
        if self.layer and layerId == self.layer.id():
            self.layer.dataProvider().truncate()
            self.layer = None
