#!/usr/bin/python3
# # -*- coding: utf-8 -*-
"""
/***************************************************************************
Name                 : Load Form
Description          : Script for populate From from UI file
Date                 : March, 2019
copyright            : (C) 2019 by Luiz Motta
email                : motta.luiz@gmail.com

 ***************************************************************************/
Updated: 2020-11-24

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/
"""
import os

from qgis.PyQt.QtWidgets import QLabel, QLineEdit
from qgis.PyQt.QtGui import QPixmap

from qgis.core import Qgis, QgsEditFormConfig

import qgis.utils as QgsUtils


def getApi(pluginName):
    """
    Function from Plugin for get API

    :params pluginName: Name of plugin
    """
    plugins = {}
    for name, obj in QgsUtils.plugins.items():
        plugins[ name ] = obj
    if not pluginName in plugins:
        return { 'isOk': False, 'message': f"Missing {pluginName} Plugin." }
    return { 'isOk': True, 'api': plugins[ pluginName ].api }


widgets = None
api = None

def setForm(layer):
    """
    Set layer with Form

    :param layer: QgsVectorLayer
    """
    config = QgsEditFormConfig()
    vfile = os.path.join( os.path.dirname( __file__ ), 'form.ui' )
    config.setUiForm( vfile)
    config.setInitCodeSource( QgsEditFormConfig.CodeSourceFile )
    config.setInitFunction('loadForm')
    vfile = os.path.join( os.path.dirname( __file__ ), 'form.py' )
    config.setInitFilePath( vfile)
    layer.setEditFormConfig(config)        

def populateForm(feature):
    """
    :param widgets: List of widgets
    :feature: Feature from open table(Form) in QGIS
    """
    def message(message='', level=Qgis.Info):
        color = 'black' if level == Qgis.Info else 'red'
        widgets['lblMessage'].setStyleSheet(f"color: {color}")
        widgets['lblMessage'].setText( message )

    def populateImages(images):
        def getFieldsImage(k):
            data = images[ k ]
            return {
                'image': f"{data['satellite']} ({data['acquiredAt']})",
                'url': data['url'],
                'thumbnail': data['thumbnail']
            }
        
        for k in ('After', 'Before'):
            d = getFieldsImage( k.lower() )
            widgets[f"le{k}"].setText( d['image'] )
            widgets[f"le{k}"].setCursorPosition(0)
            widgets[f"lblImage{k}"].setPixmap( d['thumbnail'] )
            widgets[f"leUrl{k}"].setText( d['url'] )
            widgets[f"leUrl{k}"].setCursorPosition(0)
        message('')

    global widgets
    global api
    # tabAlert
    msg = f"Alert: {feature['alertCode']} ({feature['detectedAt']}) | {feature['areaHa']} ha"
    widgets['leAlert'].setText( msg )
    widgets['leAlert'].setCursorPosition(0)
    # . Source
    values = feature['source']
    c_values = 0 if len( values ) == 0 else len( values.split(',') )
    msg = f"Sources({c_values}): {values}"
    widgets['leSource'].setText( msg )
    widgets['leSource'].setCursorPosition(0)
    # . CAR
    values = feature['carCode']
    c_values = 0 if len( values ) == 0 else len( values.split(',') )
    msg = f"CARs({c_values}): {values}"
    widgets['leCar'].setText( msg )
    widgets['leCar'].setCursorPosition(0)

    # tabImages
    message('Fetching images...')
    pixmap = QPixmap()
    for k in ('Before', 'After'):
        widgets[ f"le{k}" ].setText('')
        widgets[ f"lblImage{k}" ].setPixmap( pixmap )
        widgets[ f"leUrl{k}" ].setText('')

    if api is None:
        r = getApi('mapbiomasalert')
        if not r['isOk']:
            message( r['message'], Qgis.Critical )
            return
        api = r['api']
        api.message.connect( message )
        api.images.connect( populateImages )
    api.getImages( feature['alertCode'] )

def loadForm(dialog, layer, feature):
    if feature.fieldNameIndex('alertCode') == -1:
        return
    global widgets
    widgets = {
        'leAlert': dialog.findChild( QLineEdit, 'leAlert' ),
        'leSource': dialog.findChild( QLineEdit, 'leSource' ),
        'leCar': dialog.findChild( QLineEdit, 'leCar' ),
        'lblMessage': dialog.findChild( QLabel, 'lblMessage' ),
        'leBefore': dialog.findChild( QLineEdit, 'leBefore' ),
        'lblImageBefore': dialog.findChild( QLabel, 'lblImageBefore' ),
        'leUrlBefore': dialog.findChild( QLineEdit, 'leUrlBefore' ),
        'leAfter': dialog.findChild( QLineEdit, 'leAfter' ),
        'lblImageAfter': dialog.findChild( QLabel, 'lblImageAfter' ),
        'leUrlAfter': dialog.findChild( QLineEdit, 'leUrlAfter' ),
    }
    populateForm( feature )
