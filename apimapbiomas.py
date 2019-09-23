#!/usr/bin/python3
# # -*- coding: utf-8 -*-
"""
/***************************************************************************
Name                 : Qt API for Alert MapBiomas
Description          : API for MapBiomas
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

import json

from qgis.PyQt.QtCore import (
    QObject,
    pyqtSlot,
    QUrl
)
from qgis.PyQt.QtNetwork import QNetworkReply

from qgis.core import (
    QgsGeometry, QgsPointXY
)

from .accesssite import AccessSite

class API_Mapbiomas(QObject):
    urlThumbnail = 'https://storage.googleapis.com/mapbiomas/alerta/cache/validated_alert_{alert_id}_{before_after}_.png'
    urlGeoserver = 'http://geoserver-mapbiomas.terras.agr.br/geoserver/alerts-platform/ows'
    def __init__(self):
        super().__init__()
        self.access = AccessSite()
        self.fields = [ 
            'alert_id', 'validation_date',
            'before_image_date', 'before_image_id',
            'after_image_date', 'after_image_id',
            'geom_area_ha'
        ]
        self.fieldsDef = {
            'alert_id': 'int(-1)',
            'validation_date': 'string(15)',
            'before_image_date': 'string(15)',
            'before_image_id': 'string(50)',
            'after_image_date': 'string(15)',
            'after_image_id': 'string(50)',
            'geom_area_ha': 'double'
        }

    def _addFeaturesLinkResponse(self, response):
        def getFeaturesResponse(data):
            def getGeometry(geometry):
                def getPolygonPoints(coordinates):
                    polylines = []
                    for line in coordinates:
                        polyline = [ QgsPointXY( p[0], p[1] ) for p in line ]
                        polylines.append( polyline )
                    return polylines

                if geometry['type'] == 'Polygon':
                    polygon = getPolygonPoints( geometry['coordinates'] )
                    return QgsGeometry.fromMultiPolygonXY( [ polygon ] )
                elif geometry['type'] == 'MultiPolygon':
                    polygons= []
                    for polygon in geometry['coordinates']:
                        polygons.append( getPolygonPoints( polygon ) )
                    return QgsGeometry.fromMultiPolygonXY( polygons )

                else:
                    None

            features = []
            for feat in data['features']:
                if self.access.isKill:
                    return features
                geom = getGeometry( feat['geometry'] )
                del feat['geometry']
                alert_id = feat['properties']['alert_id']
                metadata = json.loads( feat['properties']['metadata'] )
                item = {
                    'alert_id': alert_id,
                    'validation_date': metadata['validation_date'],
                    'before_image_date': metadata['before_image_date'],
                    'before_image_id': metadata['before_image_id'],
                    'after_image_date': metadata['after_image_date'],
                    'after_image_id': metadata['after_image_id'],
                    'geom_area_ha': metadata['geom_area_ha'],
                    'geometry': geom
                }
                features.append( item )
            return features

        if response['isOk']:
            data = self.access.loadJsonData( response )
            response['features'] = getFeaturesResponse( data )
            data.clear()
            if self.access.isKill:
                del response['features']
                response['isOk'] = False
                response['message'] = 'Canceled by user'

        return response

    def isHostLive(self, setFinished):
        self.access.isHostLive( self.urlGeoserver, setFinished )

    def getAlerts(self, url, setFinished):
        p = {
            'url': QUrl( url ),
        }
        self.access.requestUrl( p, self._addFeaturesLinkResponse, setFinished )

    def getThumbnail(self, url, setFinished):
        self.access.getThumbnail( url, setFinished )

    @pyqtSlot()
    def kill(self):
        self.access.isKill = True
        self.access.abortReply.emit()
    
    @staticmethod
    def getUrlAlerts(wktGeom):
        params = {
            'service': 'WFS',
            'version': '1.0.0',
            'request': 'GetFeature',
            'typeName': 'alerts-platform:validated_alerts',
            'outputFormat': 'application/json',
            'cql_filter': "INTERSECTS(geom,{})".format( wktGeom )
        }
        params = '&'.join( [ "{k}={v}".format( k=k, v=params[ k ] ) for k in params.keys() ] )
        return "{url}?{params}".format( url=API_Mapbiomas.urlGeoserver, params=params )

    @staticmethod
    def getUrlThumbnails(alert_id):
        return {
            'before': API_Mapbiomas.urlThumbnail.format( alert_id=alert_id, before_after='before' ),
            'after': API_Mapbiomas.urlThumbnail.format( alert_id=alert_id, before_after='after' )
        }
