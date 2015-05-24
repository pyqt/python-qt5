#!/usr/bin/env python


#############################################################################
##
## Copyright (C) 2013 Riverbank Computing Limited.
## Copyright (C) 2010 Nokia Corporation and/or its subsidiary(-ies).
## All rights reserved.
##
## This file is part of the examples of PyQt.
##
## $QT_BEGIN_LICENSE:BSD$
## You may use this file under the terms of the BSD license as follows:
##
## "Redistribution and use in source and binary forms, with or without
## modification, are permitted provided that the following conditions are
## met:
##   * Redistributions of source code must retain the above copyright
##     notice, this list of conditions and the following disclaimer.
##   * Redistributions in binary form must reproduce the above copyright
##     notice, this list of conditions and the following disclaimer in
##     the documentation and/or other materials provided with the
##     distribution.
##   * Neither the name of Nokia Corporation and its Subsidiary(-ies) nor
##     the names of its contributors may be used to endorse or promote
##     products derived from this software without specific prior written
##     permission.
##
## THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
## "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
## LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
## A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
## OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
## SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
## LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
## DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
## THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
## (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
## OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
## $QT_END_LICENSE$
##
#############################################################################


import pickle

from PyQt5.QtCore import QFile, QIODevice, Qt, QTextStream
from PyQt5.QtWidgets import (QDialog, QFileDialog, QGridLayout, QHBoxLayout,
        QLabel, QLineEdit, QMessageBox, QPushButton, QTextEdit, QVBoxLayout,
        QWidget)


class SortedDict(dict):
    class Iterator(object):
        def __init__(self, sorted_dict):
            self._dict = sorted_dict
            self._keys = sorted(self._dict.keys())
            self._nr_items = len(self._keys)
            self._idx = 0

        def __iter__(self):
            return self

        def next(self):
            if self._idx >= self._nr_items:
                raise StopIteration

            key = self._keys[self._idx]
            value = self._dict[key]
            self._idx += 1

            return key, value

        __next__ = next

    def __iter__(self):
        return SortedDict.Iterator(self)

    iterkeys = __iter__


class AddressBook(QWidget):
    NavigationMode, AddingMode, EditingMode = range(3)

    def __init__(self, parent=None):
        super(AddressBook, self).__init__(parent)

        self.contacts = SortedDict()
        self.oldName = ''
        self.oldAddress = ''
        self.currentMode = self.NavigationMode

        nameLabel = QLabel("Name:")
        self.nameLine = QLineEdit()
        self.nameLine.setReadOnly(True)

        addressLabel = QLabel("Address:")
        self.addressText = QTextEdit()
        self.addressText.setReadOnly(True)

        self.addButton = QPushButton("&Add")
        self.addButton.show()
        self.editButton = QPushButton("&Edit")
        self.editButton.setEnabled(False)
        self.removeButton = QPushButton("&Remove")
        self.removeButton.setEnabled(False)
        self.findButton = QPushButton("&Find")
        self.findButton.setEnabled(False)
        self.submitButton = QPushButton("&Submit")
        self.submitButton.hide()
        self.cancelButton = QPushButton("&Cancel")
        self.cancelButton.hide()

        self.nextButton = QPushButton("&Next")
        self.nextButton.setEnabled(False)
        self.previousButton = QPushButton("&Previous")
        self.previousButton.setEnabled(False)

        self.loadButton = QPushButton("&Load...")
        self.loadButton.setToolTip("Load contacts from a file")
        self.saveButton = QPushButton("Sa&ve...")
        self.saveButton.setToolTip("Save contacts to a file")
        self.saveButton.setEnabled(False)

        self.exportButton = QPushButton("Ex&port")
        self.exportButton.setToolTip("Export as vCard")
        self.exportButton.setEnabled(False)

        self.dialog = FindDialog()

        self.addButton.clicked.connect(self.addContact)
        self.submitButton.clicked.connect(self.submitContact)
        self.editButton.clicked.connect(self.editContact)
        self.removeButton.clicked.connect(self.removeContact)
        self.findButton.clicked.connect(self.findContact)
        self.cancelButton.clicked.connect(self.cancel)
        self.nextButton.clicked.connect(self.next)
        self.previousButton.clicked.connect(self.previous)
        self.loadButton.clicked.connect(self.loadFromFile)
        self.saveButton.clicked.connect(self.saveToFile)
        self.exportButton.clicked.connect(self.exportAsVCard)

        buttonLayout1 = QVBoxLayout()
        buttonLayout1.addWidget(self.addButton)
        buttonLayout1.addWidget(self.editButton)
        buttonLayout1.addWidget(self.removeButton)
        buttonLayout1.addWidget(self.findButton)
        buttonLayout1.addWidget(self.submitButton)
        buttonLayout1.addWidget(self.cancelButton)
        buttonLayout1.addWidget(self.loadButton)
        buttonLayout1.addWidget(self.saveButton)
        buttonLayout1.addWidget(self.exportButton)
        buttonLayout1.addStretch()

        buttonLayout2 = QHBoxLayout()
        buttonLayout2.addWidget(self.previousButton)
        buttonLayout2.addWidget(self.nextButton)

        mainLayout = QGridLayout()
        mainLayout.addWidget(nameLabel, 0, 0)
        mainLayout.addWidget(self.nameLine, 0, 1)
        mainLayout.addWidget(addressLabel, 1, 0, Qt.AlignTop)
        mainLayout.addWidget(self.addressText, 1, 1)
        mainLayout.addLayout(buttonLayout1, 1, 2)
        mainLayout.addLayout(buttonLayout2, 2, 1)

        self.setLayout(mainLayout)
        self.setWindowTitle("Simple Address Book")

    def addContact(self):
        self.oldName = self.nameLine.text()
        self.oldAddress = self.addressText.toPlainText()

        self.nameLine.clear()
        self.addressText.clear()

        self.updateInterface(self.AddingMode)

    def editContact(self):
        self.oldName = self.nameLine.text()
        self.oldAddress = self.addressText.toPlainText()

        self.updateInterface(self.EditingMode)

    def submitContact(self):
        name = self.nameLine.text()
        address = self.addressText.toPlainText()

        if name == "" or address == "":
            QMessageBox.information(self, "Empty Field",
                    "Please enter a name and address.")
            return

        if self.currentMode == self.AddingMode:
            if name not in self.contacts:
                self.contacts[name] = address
                QMessageBox.information(self, "Add Successful",
                        "\"%s\" has been added to your address book." % name)
            else:
                QMessageBox.information(self, "Add Unsuccessful",
                        "Sorry, \"%s\" is already in your address book." % name)
                return

        elif self.currentMode == self.EditingMode:
            if self.oldName != name:
                if name not in self.contacts:
                    QMessageBox.information(self, "Edit Successful",
                            "\"%s\" has been edited in your address book." % self.oldName)
                    del self.contacts[self.oldName]
                    self.contacts[name] = address
                else:
                    QMessageBox.information(self, "Edit Unsuccessful",
                            "Sorry, \"%s\" is already in your address book." % name)
                    return
            elif self.oldAddress != address:
                QMessageBox.information(self, "Edit Successful",
                        "\"%s\" has been edited in your address book." % name)
                self.contacts[name] = address

        self.updateInterface(self.NavigationMode)

    def cancel(self):
        self.nameLine.setText(self.oldName)
        self.addressText.setText(self.oldAddress)
        self.updateInterface(self.NavigationMode)

    def removeContact(self):
        name = self.nameLine.text()
        address = self.addressText.toPlainText()

        if name in self.contacts:
            button = QMessageBox.question(self, "Confirm Remove",
                    "Are you sure you want to remove \"%s\"?" % name,
                    QMessageBox.Yes | QMessageBox.No)

            if button == QMessageBox.Yes:
                self.previous()
                del self.contacts[name]

                QMessageBox.information(self, "Remove Successful",
                        "\"%s\" has been removed from your address book." % name)

        self.updateInterface(self.NavigationMode)

    def next(self):
        name = self.nameLine.text()
        it = iter(self.contacts)

        try:
            while True:
                this_name, _ = it.next()

                if this_name == name:
                    next_name, next_address = it.next()
                    break
        except StopIteration:
            next_name, next_address = iter(self.contacts).next()

        self.nameLine.setText(next_name)
        self.addressText.setText(next_address)

    def previous(self):
        name = self.nameLine.text()

        prev_name = prev_address = None
        for this_name, this_address in self.contacts:
            if this_name == name:
                break

            prev_name = this_name
            prev_address = this_address
        else:
            self.nameLine.clear()
            self.addressText.clear()
            return

        if prev_name is None:
            for prev_name, prev_address in self.contacts:
                pass

        self.nameLine.setText(prev_name)
        self.addressText.setText(prev_address)

    def findContact(self):
        self.dialog.show()

        if self.dialog.exec_() == QDialog.Accepted:
            contactName = self.dialog.getFindText()

            if contactName in self.contacts:
                self.nameLine.setText(contactName)
                self.addressText.setText(self.contacts[contactName])
            else:
                QMessageBox.information(self, "Contact Not Found",
                        "Sorry, \"%s\" is not in your address book." % contactName)
                return

        self.updateInterface(self.NavigationMode)

    def updateInterface(self, mode):
        self.currentMode = mode

        if self.currentMode in (self.AddingMode, self.EditingMode):
            self.nameLine.setReadOnly(False)
            self.nameLine.setFocus(Qt.OtherFocusReason)
            self.addressText.setReadOnly(False)

            self.addButton.setEnabled(False)
            self.editButton.setEnabled(False)
            self.removeButton.setEnabled(False)

            self.nextButton.setEnabled(False)
            self.previousButton.setEnabled(False)

            self.submitButton.show()
            self.cancelButton.show()

            self.loadButton.setEnabled(False)
            self.saveButton.setEnabled(False)
            self.exportButton.setEnabled(False)

        elif self.currentMode == self.NavigationMode:
            if not self.contacts:
                self.nameLine.clear()
                self.addressText.clear()

            self.nameLine.setReadOnly(True)
            self.addressText.setReadOnly(True)
            self.addButton.setEnabled(True)

            number = len(self.contacts)
            self.editButton.setEnabled(number >= 1)
            self.removeButton.setEnabled(number >= 1)
            self.findButton.setEnabled(number > 2)
            self.nextButton.setEnabled(number > 1)
            self.previousButton.setEnabled(number >1 )

            self.submitButton.hide()
            self.cancelButton.hide()

            self.exportButton.setEnabled(number >= 1)

            self.loadButton.setEnabled(True)
            self.saveButton.setEnabled(number >= 1)

    def saveToFile(self):
        fileName, _ = QFileDialog.getSaveFileName(self, "Save Address Book",
                '', "Address Book (*.abk);;All Files (*)")

        if not fileName:
            return

        try:
            out_file = open(str(fileName), 'wb')
        except IOError:
            QMessageBox.information(self, "Unable to open file",
                    "There was an error opening \"%s\"" % fileName)
            return

        pickle.dump(self.contacts, out_file)
        out_file.close()

    def loadFromFile(self):
        fileName, _ = QFileDialog.getOpenFileName(self, "Open Address Book",
                '', "Address Book (*.abk);;All Files (*)")

        if not fileName:
            return

        try:
            in_file = open(str(fileName), 'rb')
        except IOError:
            QMessageBox.information(self, "Unable to open file",
                    "There was an error opening \"%s\"" % fileName)
            return

        self.contacts = pickle.load(in_file)
        in_file.close()

        if len(self.contacts) == 0:
            QMessageBox.information(self, "No contacts in file",
                    "The file you are attempting to open contains no "
                    "contacts.")
        else:
            for name, address in self.contacts:
                self.nameLine.setText(name)
                self.addressText.setText(address)

        self.updateInterface(self.NavigationMode)

    def exportAsVCard(self):
        name = str(self.nameLine.text())
        address = self.addressText.toPlainText()

        nameList = name.split()

        if len(nameList) > 1:
            firstName = nameList[0]
            lastName = nameList[-1]
        else:
            firstName = name
            lastName = ''

        fileName, _ = QFileDialog.getSaveFileName(self, "Export Contact", '',
                "vCard Files (*.vcf);;All Files (*)")

        if not fileName:
            return

        out_file = QFile(fileName)

        if not out_file.open(QIODevice.WriteOnly):
            QMessageBox.information(self, "Unable to open file",
                    out_file.errorString())
            return

        out_s = QTextStream(out_file)

        out_s << 'BEGIN:VCARD' << '\n'
        out_s << 'VERSION:2.1' << '\n'
        out_s << 'N:' << lastName << ';' << firstName << '\n'
        out_s << 'FN:' << ' '.join(nameList) << '\n'

        address.replace(';', '\\;')
        address.replace('\n', ';')
        address.replace(',', ' ')

        out_s << 'ADR;HOME:;' << address << '\n'
        out_s << 'END:VCARD' << '\n'

        QMessageBox.information(self, "Export Successful",
                "\"%s\" has been exported as a vCard." % name)


class FindDialog(QDialog):
    def __init__(self, parent=None):
        super(FindDialog, self).__init__(parent)

        findLabel = QLabel("Enter the name of a contact:")
        self.lineEdit = QLineEdit()

        self.findButton = QPushButton("&Find")
        self.findText = ''

        layout = QHBoxLayout()
        layout.addWidget(findLabel)
        layout.addWidget(self.lineEdit)
        layout.addWidget(self.findButton)

        self.setLayout(layout)
        self.setWindowTitle("Find a Contact")

        self.findButton.clicked.connect(self.findClicked)
        self.findButton.clicked.connect(self.accept)

    def findClicked(self):
        text = self.lineEdit.text()

        if not text:
            QMessageBox.information(self, "Empty Field",
                    "Please enter a name.")
            return

        self.findText = text
        self.lineEdit.clear()
        self.hide()

    def getFindText(self):
        return self.findText


if __name__ == '__main__':
    import sys

    from PyQt5.QtWidgets import QApplication

    app = QApplication(sys.argv)

    addressBook = AddressBook()
    addressBook.show()

    sys.exit(app.exec_())
