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
import json, os

from qgis.PyQt.QtCore import (
    Qt,
    QObject, pyqtSlot, pyqtSignal,
    QUrl,
    QDate
)
from qgis.PyQt.QtWidgets import (
    QWidget, QPushButton,
    QLabel, QDateEdit, QSpinBox, QSpacerItem, QSizePolicy,
    QVBoxLayout, QHBoxLayout,
    QApplication, # widgets = QApplication.instance().allWidgets()
    QStyle
)
from qgis.PyQt.QtGui import (
    QColor, QPixmap, QIcon,
    QDesktopServices # QDesktopServices.openUrl( QUrl( url ) )
)
from qgis.PyQt.QtNetwork import QNetworkRequest
 
from qgis.core import (
    Qgis, QgsApplication, QgsProject,
    QgsCoordinateReferenceSystem, QgsCoordinateTransform,
    QgsVectorLayer, QgsFeature,
    QgsBlockingNetworkRequest,
    QgsTask,

)
from qgis.gui import QgsGui, QgsMessageBar, QgsLayerTreeEmbeddedWidgetProvider
from qgis import utils as QgsUtils

from .mapbiomasalert_layer_api import DbAlerts, API_MapbiomasAlert
from .form import setForm as FORM_setForm


class MapBiomasAlertWidget(QWidget):
    def __init__(self, layer):
        def getIcons():
            fIcon = self.style().standardIcon
            return {
                'apply': fIcon( QStyle.SP_DialogApplyButton ),
                'cancel': fIcon( QStyle.SP_DialogCancelButton )
            }

        def setupUI():
            def createDateEdit(name, layout, displayFormat, hasCalendar):
                layout.addWidget( QLabel( name ) )
                w = QDateEdit( self )
                w.setCalendarPopup( True )
                w.setDisplayFormat( displayFormat )
                w.setCalendarPopup( hasCalendar )
                layout.addWidget( w )
                return w

            def createLayoutSearch():
                layout = QHBoxLayout()
                # Dates
                lyt = QHBoxLayout()
                self.__dict__['fromDate'] = createDateEdit( 'From', lyt, 'yyyy-MM-dd', True )
                self.__dict__['toDate'] = createDateEdit( 'To', lyt, 'yyyy-MM-dd', True )
                layout.addLayout( lyt )
                # Days
                w = QSpinBox( self )
                self.__dict__['numDays'] = w
                w.setSingleStep( 1 )
                w.setSuffix(' Days')
                w.setRange( 1, 360000 )
                layout.addWidget( w )
                # Search
                w = QPushButton( self.textSearch['apply'], self )
                self.__dict__['search'] = w
                w.setIcon( self.icons['apply'] )
                w.clicked.connect( self._onSearch )
                layout.addWidget( w )
                #
                return layout

            # Layout
            lyt = QVBoxLayout()
            lytSearch = createLayoutSearch() # fromDate, toDate, numDays, search
            lyt.addLayout( lytSearch )
            self.status = QLabel('', self)
            lyt.addWidget( self.status )
            self.setLayout( lyt )

        def populateDates():
            def setSpin(date1, date2):
                self.numDays.valueChanged.disconnect( changedNumDay )
                days = date1.daysTo( date2 )
                self.numDays.setValue( days )
                self.numDays.valueChanged.connect( changedNumDay )

            @pyqtSlot(QDate)
            def changedFromDate(date):
                self.toDate.setMinimumDate( date.addDays(+1) )
                setSpin( date, self.toDate.date() )

            @pyqtSlot(QDate)
            def changedToDate(date):
                self.fromDate.setMaximumDate( date.addDays(-1) )
                setSpin( self.fromDate.date(), date )

            @pyqtSlot(int)
            def changedNumDay(days):
                newDate = self.toDate.date().addDays( -1 * days )
                self.fromDate.dateChanged.disconnect( changedFromDate )
                self.fromDate.setDate( newDate )
                self.toDate.setMinimumDate( newDate.addDays(+1) )
                self.fromDate.dateChanged.connect( changedFromDate )

            #d2 = QDate.currentDate()
            d2 = QDate(2020, 4, 1)
            d1 = d2.addMonths( -1 )
            self.fromDate.setDate( d1 )
            self.fromDate.setMaximumDate( d2.addDays( -1 ) )
            self.toDate.setDate( d2 )
            self.toDate.setMinimumDate( d1.addDays( +1 ) )
            self.numDays.setValue( d1.daysTo( d2 ) )

            self.fromDate.dateChanged.connect( changedFromDate )
            self.toDate.dateChanged.connect( changedToDate )
            self.numDays.valueChanged.connect( changedNumDay )

        super().__init__()
        self.msgBar = QgsUtils.iface.messageBar()
        self.alert = DbAlerts( layer )
        self.api = API_MapbiomasAlert()
        self.api.message.connect( self.msgBar.pushMessage )
        self.api.alerts.connect( self.alert.addFeatures )
        self.api.finishedAlert.connect( self.finishedAlert )
        self.icons = getIcons()
        self.textSearch = { 'apply': 'Search', 'cancel': 'Cancel'}
        setupUI()
        populateDates()
        self.api.message.connect( self.msgBar.pushMessage )
        self.api.status.connect( self.status.setText )

    @pyqtSlot(bool)
    def _onSearch(self, checked):
        if self.api.taskAlerts:
            self.api.cancelAlerts()
            self.search.setIcon( self.icons['apply'] )
            return
        self.search.setIcon( self.icons['cancel'] )
        fromDate = self.fromDate.date().toString( Qt.ISODate )
        toDate = self.toDate.date().toString( Qt.ISODate )
        self.alert.setLayer( fromDate, toDate )
        self.api.getAlerts( self.alert, fromDate, toDate )

    @pyqtSlot()
    def finishedAlert(self):
        self.search.setIcon( self.icons['apply'] )


class LayerMapBiomasAlertWidgetProvider(QgsLayerTreeEmbeddedWidgetProvider):
    def __init__(self):
        super().__init__()

    def id(self):
        return self.__class__.__name__

    def name(self):
        return "Layer MapBiomas Alert"

    def createWidget(self, layer, widgetIndex):
        return MapBiomasAlertWidget( layer )

    def supportsLayer(self, layer):
        return bool( layer.customProperty( MapBiomasAlert.MODULE, 0) )


class MapBiomasAlert(QObject):
    MODULE = 'MapBiomasAlert'
    def __init__(self, iface):
        super().__init__()        
        self.project = QgsProject.instance()
        self.msgBar = iface.messageBar()
        self.widgetProvider = None
        self.layer = None
        self.styleFile = os.path.join( os.path.dirname( __file__ ), 'mapbiomas_alert.qml' )

    def register(self):
        self.widgetProvider = LayerMapBiomasAlertWidgetProvider()
        registry = QgsGui.layerTreeEmbeddedWidgetRegistry()
        if bool( registry.provider( self.widgetProvider.id() ) ):
            registry.removeProvider( self.widgetProvider.id() )
        registry.addProvider( self.widgetProvider )

    def addLayerRegisterProperty(self, layer):
        totalEW = int( layer.customProperty('embeddedWidgets/count', 0) )
        layer.setCustomProperty('embeddedWidgets/count', totalEW + 1 )
        layer.setCustomProperty(f"embeddedWidgets/{totalEW}/id", self.widgetProvider.id() )
        layer.setCustomProperty( self.MODULE, 1)
        layer.loadNamedStyle( self.styleFile )
        FORM_setForm( layer )
        self.project.addMapLayer( layer )

    def run(self):
        api = API_MapbiomasAlert()
        # api.setToken('luiz.motta@ibama.gov.br', 'Lmotta@21')
        # NEED register(call out)
        layer = DbAlerts.createLayer()
        self.addLayerRegisterProperty( layer )
        
