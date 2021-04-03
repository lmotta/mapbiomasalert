#!/usr/bin/python3
# # -*- coding: utf-8 -*-
"""
/***************************************************************************
Name                 : DialogEmailPassword
Description          : Class for Dialog with email and password
Date                 : April, 2021
copyright            : (C) 2021 by Luiz Motta
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
from qgis.PyQt.QtWidgets import (
    QDialog,
    QLabel, QLineEdit,
    QCheckBox, QRadioButton,
    QDialogButtonBox,
    QHBoxLayout, QVBoxLayout
)
from qgis.PyQt.QtGui import QRegularExpressionValidator

from qgis.PyQt.QtCore import (
    QRegExp, QRegularExpression,
)
from qgis.gui import QgsPasswordLineEdit

from qgis import utils as QgsUtils

class DialogEmailPassword(QDialog):
    TITLE = 'Config email/password'
    def __init__(self, hasRegister):
        def setupUI():
            def createLayoutPassword():
                layout = QHBoxLayout()
                # Email
                w = QLabel('Email/Password:', self )
                layout.addWidget( w )
                w = QLineEdit( self )
                self.__dict__['email'] = w
                w.setPlaceholderText('someone@somewhere.com')
                w.setToolTip('Email registered at https://plataforma.alerta.mapbiomas.org/login')
                rx = QRegularExpression( self.emailExpEdit, QRegularExpression.CaseInsensitiveOption )
                w.setValidator( QRegularExpressionValidator( rx ) )
                layout.addWidget( w )
                # Password
                w = QgsPasswordLineEdit( self )
                self.__dict__['password'] = w
                w.setToolTip('Password registered at http://www2.dgi.inpe.br/catalogo/explore')
                w.setEchoMode( QLineEdit.Password )
                layout.addWidget( w )
                # Save
                w = QCheckBox('Save(email/password)', self )
                self.__dict__['save_email_pwd'] = w
                w.setToolTip('Save in QGIS Config')
                layout.addWidget( w )
                return layout

            def createLayoutRegister():
                layout = QHBoxLayout()
                # Register
                w = QRadioButton('Copy Clipboard(email/password)', self )
                self.__dict__['clipboard'] = w
                layout.addWidget( w )
                w = QRadioButton('Clean(email/password)', self )
                self.__dict__['clean'] = w
                layout.addWidget( w )
                return layout

            lyt = QVBoxLayout()
            f = createLayoutPassword if not hasRegister else createLayoutRegister
            subLayout = f()
            lyt.addLayout( subLayout )
            # Ok and Cancel
            w = QDialogButtonBox( QDialogButtonBox.Ok | QDialogButtonBox.Cancel, self )
            w.accepted.connect( self.accept )
            w.rejected.connect( self.reject )
            lyt.addWidget( w )
            #
            self.setLayout( lyt )

        super().__init__( QgsUtils.iface.mainWindow() )
        self.setWindowTitle( self.TITLE )
        self.emailExpEdit = '\\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}\\b'
        self.emailExpMath = r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)"
        setupUI()

    def isValidEmail(self):
        rx = QRegExp( self.emailExpMath )
        return rx.exactMatch( self.email.text() )


hasRegister = False

dlg = DialogEmailPassword( hasRegister )
result = dlg.exec_()

print(result)
if hasRegister:
    print( dlg.clipboard.isChecked() )
    print( dlg.clean.isChecked() )
else:
    print( dlg.password.text() )
    print( dlg.email.text() )
    print( dlg.save_email_pwd.isChecked() )

a = 1