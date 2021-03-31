# -*- coding: utf-8 -*-
"""
/***************************************************************************
Name                 : MapBiomas Alert
Description          : MapBiomas Alert
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

__author__ = 'Luiz Motta'
__date__ = '2019-04-19'
__copyright__ = '(C) 2019, Luiz Motta'
__revision__ = '$Format:%H$'


import os

from qgis.PyQt.QtCore import QObject, Qt, pyqtSlot
from qgis.PyQt.QtGui import QIcon
from qgis.PyQt.QtWidgets import QAction

from .mapbiomasalert import MapBiomasAlert

def classFactory(iface):
  return MBAlertPlugin( iface )

class MBAlertPlugin(QObject):
    def __init__(self, iface):
        super().__init__()
        self.iface = iface
        self.name = u"MapBiomas Alert "
        self.mbalert = MapBiomasAlert( self.iface )

    def initGui(self):
        name = 'MapBiomas Alert '
        about = 'MapBiomas Alert '
        icon = QIcon( os.path.join( os.path.dirname(__file__), 'mapbiomas_alert.png' ) )
        self.action = QAction( icon, name, self.iface.mainWindow() )
        self.action.setObjectName( name.replace(' ', '') )
        self.action.setWhatsThis( about )
        self.action.setStatusTip( about )
        self.action.triggered.connect( self.run )

        self.iface.addToolBarIcon( self.action )
        self.iface.addPluginToMenu( self.name, self.action )

        self.mbalert.register()

    def unload(self):
        self.iface.removeToolBarIcon( self.action )
        self.iface.removePluginRasterMenu( self.name, self.action )
        del self.action
        del self.mbalert

    @pyqtSlot(bool)
    def run(self, checked):
        self.mbalert.run()
