#!/usr/bin/env python


#############################################################################
##
## Copyright (C) 2013 Riverbank Computing Limited
## Copyright (C) 2010 Darryl Wallace <wallacdj@gmail.com>.
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


from PyQt5.QtCore import (pyqtSignal, QAbstractListModel, QDir, QLibraryInfo,
        QModelIndex, Qt)
from PyQt5.QtWidgets import (QApplication, QGridLayout, QLabel, QLineEdit,
        QListView, QSizePolicy, QTextBrowser, QWidget)


class FileListModel(QAbstractListModel):
    numberPopulated = pyqtSignal(int)

    def __init__(self, parent=None):
        super(FileListModel, self).__init__(parent)

        self.fileCount = 0    
        self.fileList = []

    def rowCount(self, parent=QModelIndex()):
        return self.fileCount

    def data(self, index, role=Qt.DisplayRole):
        if not index.isValid():
            return None

        if index.row() >= len(self.fileList) or index.row() < 0:
            return None

        if role == Qt.DisplayRole:
            return self.fileList[index.row()]

        if role == Qt.BackgroundRole:
            batch = (index.row() // 100) % 2
            if batch == 0:
                return QApplication.palette().base()

            return QApplication.palette().alternateBase()

        return None

    def canFetchMore(self, index):
        return self.fileCount < len(self.fileList)

    def fetchMore(self, index):
        remainder = len(self.fileList) - self.fileCount
        itemsToFetch = min(100, remainder)

        self.beginInsertRows(QModelIndex(), self.fileCount,
                self.fileCount + itemsToFetch)

        self.fileCount += itemsToFetch

        self.endInsertRows()

        self.numberPopulated.emit(itemsToFetch)

    def setDirPath(self, path):
        dir = QDir(path)

        self.beginResetModel()
        self.fileList = dir.entryList()
        self.fileCount = 0
        self.endResetModel()


class Window(QWidget):
    def __init__(self, parent=None):
        super(Window, self).__init__(parent)

        model = FileListModel(self)
        model.setDirPath(QLibraryInfo.location(QLibraryInfo.PrefixPath))

        label = QLabel("Directory")
        lineEdit = QLineEdit()
        label.setBuddy(lineEdit)

        view = QListView()
        view.setModel(model)

        self.logViewer = QTextBrowser()
        self.logViewer.setSizePolicy(QSizePolicy(QSizePolicy.Preferred, QSizePolicy.Preferred))

        lineEdit.textChanged.connect(model.setDirPath)
        lineEdit.textChanged.connect(self.logViewer.clear)
        model.numberPopulated.connect(self.updateLog)

        layout = QGridLayout()
        layout.addWidget(label, 0, 0)
        layout.addWidget(lineEdit, 0, 1)
        layout.addWidget(view, 1, 0, 1, 2)
        layout.addWidget(self.logViewer, 2, 0, 1, 2)

        self.setLayout(layout)
        self.setWindowTitle("Fetch More Example")

    def updateLog(self, number):
        self.logViewer.append("%d items added." % number)


if __name__ == '__main__':

    import sys

    app = QApplication(sys.argv)

    window = Window()
    window.show()

    sys.exit(app.exec_())
