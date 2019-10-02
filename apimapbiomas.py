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
    urlGeoserver = 'http://geoserver-mapbiomas.terras.agr.br/geoserver/alerts-platform/ows'
    urlReport = 'http://plataforma.alerta.mapbiomas.org/reports'
    def __init__(self):
        super().__init__()
        self.access = AccessSite()
        self.fields = {
            'alerta_id': {'definition': 'int(-1)'},
            'dt_validacao':  {'definition': 'string(10)'},
            'fontes': {'definition': 'string(100)'},
            'dt_antes': {'definition': 'string(10)'},
            'img_antes': {'definition': 'string(150)'},
            'dt_depois': {'definition': 'string(10)'},
            'img_depois': {'definition': 'string(150)'},
            'cars_ids': {'definition': 'string(150)'},
            'cars_qtd': {'definition': 'int(-1)'},
            'area_ha': {'definition': 'double'}
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
                properties = feat['properties']
                item = {}
                for k in self.fields.keys():
                    item[ k ] = properties[ k ]
                if not item['cars_ids'] is None:
                    item['cars_ids'] = item['cars_ids'].replace(';', '\n')
                else:
                    item['cars_ids'] = ''
                item['geometry'] = geom
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
            'typeName': 'alerts-platform:viw_relatorio_validacao',
            'outputFormat': 'application/json',
            'cql_filter': "INTERSECTS(geom,{})".format( wktGeom )
        }
        params = '&'.join( [ "{k}={v}".format( k=k, v=params[ k ] ) for k in params.keys() ] )
        return "{url}?{params}".format( url=API_Mapbiomas.urlGeoserver, params=params )
