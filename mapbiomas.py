#!/usr/bin/python3
# # -*- coding: utf-8 -*-
"""
/***************************************************************************
Name                 : MapBiomas
Description          : Class for work with MapBiomas
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
import json, os

from qgis.PyQt.QtCore import QObject, pyqtSlot, pyqtSignal, QUrl
from qgis.PyQt.QtGui import QPixmap, QIcon, QDesktopServices
from qgis.PyQt.QtWidgets import QApplication,QDialog

from qgis.core import (
    Qgis, QgsProject,
    QgsCoordinateReferenceSystem, QgsCoordinateTransform,
    QgsVectorLayer, QgsFeature
)

from .apimapbiomas import API_Mapbiomas
from .mapcanvaseffects import MapCanvasGeometry

class AlertMapBiomas(QObject):
    cancelSearch = pyqtSignal()
    def __init__(self, iface, action):
        super().__init__()
        self.mb = MapBiomas(iface)
        self.action = action
        self.msgBar = iface.messageBar()
        self.iconApply = action.icon()
        self.iconCancel = QIcon( os.path.join( os.path.dirname(__file__), 'mapbiomas_alerta_cancel.png' ) )
        self.currentProcess = None
        self.isRunning = False
        self._connect()

    def __del__(self):
        if self.isRunning:
            self.cancelSearch.emit()
        self._connect(False)

    def _connect(self, isConnect = True):
        ss = [
            { 'signal': self.cancelSearch, 'slot': self.mb.onCancel },
            { 'signal': self.mb.currentProcess, 'slot': self.setCurrentProcess },
            { 'signal': self.mb.finishedProcess, 'slot': self.finishedSearch },
            { 'signal': self.mb.message, 'slot': self.message }
        ]
        if isConnect:
            self.hasConnect = True
            for item in ss:
                item['signal'].connect( item['slot'] )  
        else:
            self.hasConnect = False
            for item in ss:
                item['signal'].disconnect( item['slot'] )

    def _changeIcon(self, isCancel=True):
        icon = self.iconCancel if isCancel else self.iconApply
        self.action.setIcon( icon )

    def run(self):
        if self.isRunning:
            self.cancelSearch.emit()
            return
        self.isRunning = True
        self._changeIcon()
        self.mb.searchAlert()

    @pyqtSlot(str)
    def setCurrentProcess(self, name):
        self.currentProcess = name

    @pyqtSlot()
    def finishedSearch(self):
        self._changeIcon( False )
        self.isRunning = False

    @pyqtSlot(Qgis.MessageLevel, str)
    def message(self, level, message):
        if level == Qgis.Info:
            f = self.msgBar.pushInfo
        elif level == Qgis.Warning:
            f = self.msgBar.pushWarning
        elif level == Qgis.Critical:
            f = self.msgBar.pushCritical
        elif level == Qgis.Success:
            f = self.msgBar.pushSuccess
        else:
            return
        self.msgBar.popWidget()
        f( self.currentProcess, message )


class MapBiomas(QObject):
    killProcess = pyqtSignal()
    currentProcess = pyqtSignal(str)
    finishedProcess = pyqtSignal()
    message = pyqtSignal(Qgis.MessageLevel, str)
    def __init__(self, iface):
        super().__init__()
        self.iface = iface
        self.nameCatalog = 'mapbiomas_alert_valid'
        self.apiMB = API_Mapbiomas()
        self.killProcess.connect( self.apiMB.kill )
        self.canvas = iface.mapCanvas()
        self.project = QgsProject.instance()
        self.layerTreeRoot = self.project.layerTreeRoot()
        self.mapCanvasGeom = MapCanvasGeometry()
        self.pluginName = 'MapBiomas'
        self.crsCatalog = QgsCoordinateReferenceSystem('EPSG:4674')
        self.styleFile = 'mb_alert.qml'
        self.alert = None
        self.alert_id = None
        self.response = None
        self.isRunning = None

    def __del__(self):
        self.killProcess.disconnect( self.apiMB.kill )

    def _createCatalog(self):
        key_value = lambda k: "field={key}:{value}".format( key=k, value=self.apiMB.fields[ k ]['definition'] )
        l_fields = [ key_value( k ) for k in self.apiMB.fields.keys() ]
        l_fields.insert( 0, "Multipolygon?crs={}".format( self.crsCatalog.authid().lower() ) )
        l_fields.append('index=yes')
        uri = '&'.join( l_fields )
        self.alert = QgsVectorLayer( uri, self.nameCatalog, 'memory' )
        self.alert.loadNamedStyle( os.path.join( os.path.dirname( __file__ ), self.styleFile ) )
        self.alert_id = self.alert.id()

    def _responseFinished(self, response):
        self.response = response

    def actionsForm(self, nameAction, feature_id=None):
        """
        Run action defined in layer, provide by style file

        :param nameAction: Name of action
        :params feature_id: Feature ID
        :meta_json: Value of JSON(dictionary) from name_exp_json
        """
        # Actions functions
        def highlight(feature_id):
            geom = self.alert.getFeature( feature_id ).geometry()
            self.mapCanvasGeom.highlight( self.alert, geom )
            return { 'isOk': True }

        def zoom(feature_id):
            geom = self.alert.getFeature( feature_id ).geometry()
            self.mapCanvasGeom.zoom( self.alert, geom )
            return { 'isOk': True }

        def report(feature_id):
            feat =  self.alert.getFeature( feature_id )
            alerta_id = feat['alerta_id']
            cars_ids = feat['cars_ids']
            if len(cars_ids) == 0:
                url = "{}/{}".format( API_Mapbiomas.urlReport, alerta_id )
                QDesktopServices.openUrl( QUrl( url ) )
            else:
                for car_id in cars_ids.split('\n'):
                    url = "{}/{}/car/{}".format( API_Mapbiomas.urlReport, alerta_id, car_id )
                    QDesktopServices.openUrl( QUrl( url ) )
            return { 'isOk': True }

        actionsFunc = {
            'highlight': highlight,
            'zoom':      zoom,
            'report':    report
        }
        if not nameAction in actionsFunc.keys():
            return { 'isOk': False, 'message': "Missing action '{}'".format( nameAction ) }
        return actionsFunc[ nameAction ]( feature_id )

    def requestPopulateCatalog(self):
        def getWktExtent():
            crsCanvas = self.canvas.mapSettings().destinationCrs()
            ct = QgsCoordinateTransform( crsCanvas, self.crsCatalog, self.project )
            rectCanvas = self.canvas.extent() if crsCanvas == self.crsCatalog else ct.transform( self.canvas.extent() )
            return rectCanvas.asWktPolygon()
        
        def populate(features):
            provider = self.alert.dataProvider()
            for item in features:
                atts = [ item[k] for k in self.apiMB.fields ]
                feat = QgsFeature()
                feat.setAttributes( atts )
                geom = item['geometry']
                if not geom is None:
                    feat.setGeometry( geom )
                provider.addFeature( feat )
                del item

        def finished(response):
            self.response = response
            if not response['isOk']:
                self.message.emit( Qgis.Critical, response['message'])
                return
            if len( self.response['features'] ) == 0:
                self.message.emit( Qgis.Warning, "Inside this view don't have alerts")
                del response['features']
                return
            populate( response['features'] )
            del response['features']
            self.message.emit( Qgis.Success, 'Finished OK')

        def closeTableAttribute():
            layer_id = self.alert_id
            widgets = QApplication.instance().allWidgets()
            for tb in filter( lambda w: isinstance( w, QDialog ) and layer_id in w.objectName(),  widgets ):
                tb.close()

        self.currentProcess.emit('Populate Catalog')
        existsCatalog = not self.alert is None and not self.project.mapLayer( self.alert_id ) is None
        if not existsCatalog:
            self._createCatalog()
        else:
            name = "Receiving... - {}".format( self.nameCatalog )
            self.alert.setName( name )
            self.alert.dataProvider().truncate() # Delete all features
            closeTableAttribute()
        self.response = None
        self.calculateMetadata = True
        self.message.emit( Qgis.Info, 'Request features...')
        url = self.apiMB.getUrlAlerts( getWktExtent() )
        self.apiMB.getAlerts( url, finished )
        self.calculateMetadata = False
        if self.response['isOk']:
            if not existsCatalog:
                self.project.addMapLayer( self.alert, addToLegend=False )
                root = self.project.layerTreeRoot()
                root.insertLayer( 0, self.alert ).setCustomProperty("showFeatureCount", True)
            else:
                self.alert.setName( self.nameCatalog )
                self.alert.triggerRepaint()
        else:
            root = self.project.layerTreeRoot()
            if not root.findLayer( self.alert ) is None:
                root.removeLayer( self.alert )

    def searchAlert(self):
        self.currentProcess.emit('Check server')
        self.apiMB.isHostLive( self._responseFinished )
        if not self.response['isOk']:
            self.message.emit( Qgis.Critical, 'MapBioma server is out')
            self.finishedProcess.emit()
            return

        self.currentProcess.emit('Search alerts')
        if self.iface.mapCanvas().layerCount() == 0:
            msg = 'Need layer(s) in map'
            self.message.emit( Qgis.Warning, msg )
        else:
            self.apiMB.access.isKill = False
            self.requestPopulateCatalog()
        self.finishedProcess.emit()

    @pyqtSlot()
    def onCancel(self):
        self.killProcess.emit()
