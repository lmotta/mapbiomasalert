# -*- coding: utf-8 -*-
"""
/***************************************************************************
Name                 : Map Canvas Effects
Description          : Tools for show the geometry of feature
Date                 : January, 2019
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
__date__ = '2019-01-31'
__copyright__ = '(C) 2019, Luiz Motta'
__revision__ = '$Format:%H$'

from qgis.PyQt.QtCore import QTimer
from qgis.PyQt.QtGui import QColor

from qgis import utils as QgsUtils
from qgis.core import QgsProject, QgsCoordinateTransform, QgsFeature
from qgis.gui import QgsHighlight, QgsRubberBand


class  MapCanvasGeometry():
    def __init__(self):
        self.project = QgsProject().instance()
        self.canvas = QgsUtils.iface.mapCanvas()
        self.timer = QTimer( self.canvas )
        self.canvasItem = None
        self.layer = None

    def _setCanvasItem(self):
        self.canvasItem.setColor(     QColor(255, 0, 0, 255))
        self.canvasItem.setFillColor( QColor(119,136,153, 100))
        self.canvasItem.setWidth(2)

    def _flash(self, milliseconds):
        def finished():
            self.timer.stop()
            self.timer.timeout.disconnect( finished )
            if self.layer is None:
                self.canvasItem.reset( self.geometryType )
            del self.canvasItem
            self.layer = None
            self.canvasItem = None
            self.geometryType = None

        self.timer.timeout.connect( finished )
        self.timer.start( milliseconds )

    def highlight(self, geometry, layer=None):
        if layer is None:
            self.geometryType = geometry.type()
            self.canvasItem = QgsRubberBand( self.canvas, self.geometryType )
            self._setCanvasItem()
            self.canvasItem.addGeometry( geometry )
        else:
            self.canvasItem = QgsHighlight( self.canvas, geometry, layer )
            self._setCanvasItem()
        self.layer = layer
        self._flash( 500 )

    def zoom(self, geometry, layer=None):
        bbox = geometry.boundingBox()
        if not layer is None:
            crsLayer = layer.crs()
            crsCanvas = self.project.crs()
            if not crsLayer == crsCanvas:
                ct = QgsCoordinateTransform( layer.crs(), self.project.crs(), self.project )
                bbox = ct.transform( geometry.boundingBox() )
        self.canvas.setExtent( bbox )
        self.canvas.zoomByFactor( 1.05 )
        self.canvas.refresh()
        self.highlight( geometry, layer )
