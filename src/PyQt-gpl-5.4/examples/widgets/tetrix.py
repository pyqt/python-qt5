#!/usr/bin/env python


#############################################################################
##
## Copyright (C) 2014 Riverbank Computing Limited.
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


import copy
import random

from PyQt5.QtCore import pyqtSignal, QBasicTimer, QSize, Qt
from PyQt5.QtGui import QColor, QPainter, QPixmap
from PyQt5.QtWidgets import (QApplication, QFrame, QGridLayout, QLabel,
        QLCDNumber, QPushButton, QWidget)


NoShape, ZShape, SShape, LineShape, TShape, SquareShape, LShape, MirroredLShape = range(8)


class TetrixWindow(QWidget):
    def __init__(self):
        super(TetrixWindow, self).__init__()

        self.board = TetrixBoard()

        nextPieceLabel = QLabel()
        nextPieceLabel.setFrameStyle(QFrame.Box | QFrame.Raised)
        nextPieceLabel.setAlignment(Qt.AlignCenter)
        self.board.setNextPieceLabel(nextPieceLabel)

        scoreLcd = QLCDNumber(5)
        scoreLcd.setSegmentStyle(QLCDNumber.Filled)
        levelLcd = QLCDNumber(2)
        levelLcd.setSegmentStyle(QLCDNumber.Filled)
        linesLcd = QLCDNumber(5)
        linesLcd.setSegmentStyle(QLCDNumber.Filled)

        startButton = QPushButton("&Start")
        startButton.setFocusPolicy(Qt.NoFocus)
        quitButton = QPushButton("&Quit")
        quitButton.setFocusPolicy(Qt.NoFocus)
        pauseButton = QPushButton("&Pause")
        pauseButton.setFocusPolicy(Qt.NoFocus)

        startButton.clicked.connect(self.board.start)
        pauseButton.clicked.connect(self.board.pause)
        quitButton.clicked.connect(QApplication.instance().quit)
        self.board.scoreChanged.connect(scoreLcd.display)
        self.board.levelChanged.connect(levelLcd.display)
        self.board.linesRemovedChanged.connect(linesLcd.display)

        layout = QGridLayout()
        layout.addWidget(self.createLabel("NEXT"), 0, 0)
        layout.addWidget(nextPieceLabel, 1, 0)
        layout.addWidget(self.createLabel("LEVEL"), 2, 0)
        layout.addWidget(levelLcd, 3, 0)
        layout.addWidget(startButton, 4, 0)
        layout.addWidget(self.board, 0, 1, 6, 1)
        layout.addWidget(self.createLabel("SCORE"), 0, 2)
        layout.addWidget(scoreLcd, 1, 2)
        layout.addWidget(self.createLabel("LINES REMOVED"), 2, 2)
        layout.addWidget(linesLcd, 3, 2)
        layout.addWidget(quitButton, 4, 2)
        layout.addWidget(pauseButton, 5, 2)
        self.setLayout(layout)

        self.setWindowTitle("Tetrix")
        self.resize(550, 370)

    def createLabel(self, text):
        lbl = QLabel(text)
        lbl.setAlignment(Qt.AlignHCenter | Qt.AlignBottom)
        return lbl


class TetrixBoard(QFrame):
    BoardWidth = 10
    BoardHeight = 22

    scoreChanged = pyqtSignal(int)

    levelChanged = pyqtSignal(int)

    linesRemovedChanged = pyqtSignal(int)

    def __init__(self, parent=None):
        super(TetrixBoard, self).__init__(parent)

        self.timer = QBasicTimer()
        self.nextPieceLabel = None
        self.isWaitingAfterLine = False
        self.curPiece = TetrixPiece()
        self.nextPiece = TetrixPiece()
        self.curX = 0
        self.curY = 0
        self.numLinesRemoved = 0
        self.numPiecesDropped = 0
        self.score = 0
        self.level = 0
        self.board = None

        self.setFrameStyle(QFrame.Panel | QFrame.Sunken)
        self.setFocusPolicy(Qt.StrongFocus)
        self.isStarted = False
        self.isPaused = False
        self.clearBoard()

        self.nextPiece.setRandomShape()

    def shapeAt(self, x, y):
        return self.board[(y * TetrixBoard.BoardWidth) + x]

    def setShapeAt(self, x, y, shape):
        self.board[(y * TetrixBoard.BoardWidth) + x] = shape   

    def timeoutTime(self):
        return 1000 / (1 + self.level)

    def squareWidth(self):
        return self.contentsRect().width() / TetrixBoard.BoardWidth

    def squareHeight(self):
        return self.contentsRect().height() / TetrixBoard.BoardHeight

    def setNextPieceLabel(self, label):
        self.nextPieceLabel = label

    def sizeHint(self):
        return QSize(TetrixBoard.BoardWidth * 15 + self.frameWidth() * 2,
                TetrixBoard.BoardHeight * 15 + self.frameWidth() * 2)

    def minimumSizeHint(self):
        return QSize(TetrixBoard.BoardWidth * 5 + self.frameWidth() * 2,
                TetrixBoard.BoardHeight * 5 + self.frameWidth() * 2)

    def start(self):
        if self.isPaused:
            return

        self.isStarted = True
        self.isWaitingAfterLine = False
        self.numLinesRemoved = 0
        self.numPiecesDropped = 0
        self.score = 0
        self.level = 1
        self.clearBoard()

        self.linesRemovedChanged.emit(self.numLinesRemoved)
        self.scoreChanged.emit(self.score)
        self.levelChanged.emit(self.level)

        self.newPiece()
        self.timer.start(self.timeoutTime(), self)

    def pause(self):
        if not self.isStarted:
            return

        self.isPaused = not self.isPaused
        if self.isPaused:
            self.timer.stop()
        else:
            self.timer.start(self.timeoutTime(), self)

        self.update()

    def paintEvent(self, event):
        super(TetrixBoard, self).paintEvent(event)

        painter = QPainter(self)
        rect = self.contentsRect()

        if self.isPaused:
            painter.drawText(rect, Qt.AlignCenter, "Pause")
            return

        boardTop = rect.bottom() - TetrixBoard.BoardHeight * self.squareHeight()

        for i in range(TetrixBoard.BoardHeight):
            for j in range(TetrixBoard.BoardWidth):
                shape = self.shapeAt(j, TetrixBoard.BoardHeight - i - 1)
                if shape != NoShape:
                    self.drawSquare(painter,
                            rect.left() + j * self.squareWidth(),
                            boardTop + i * self.squareHeight(), shape)

        if self.curPiece.shape() != NoShape:
            for i in range(4):
                x = self.curX + self.curPiece.x(i)
                y = self.curY - self.curPiece.y(i)
                self.drawSquare(painter, rect.left() + x * self.squareWidth(),
                        boardTop + (TetrixBoard.BoardHeight - y - 1) * self.squareHeight(),
                        self.curPiece.shape())

    def keyPressEvent(self, event):
        if not self.isStarted or self.isPaused or self.curPiece.shape() == NoShape:
            super(TetrixBoard, self).keyPressEvent(event)
            return

        key = event.key()
        if key == Qt.Key_Left:
            self.tryMove(self.curPiece, self.curX - 1, self.curY)
        elif key == Qt.Key_Right:
            self.tryMove(self.curPiece, self.curX + 1, self.curY)
        elif key == Qt.Key_Down:
            self.tryMove(self.curPiece.rotatedRight(), self.curX, self.curY)
        elif key == Qt.Key_Up:
            self.tryMove(self.curPiece.rotatedLeft(), self.curX, self.curY)
        elif key == Qt.Key_Space:
            self.dropDown()
        elif key == Qt.Key_D:
            self.oneLineDown()
        else:
            super(TetrixBoard, self).keyPressEvent(event)

    def timerEvent(self, event):
        if event.timerId() == self.timer.timerId():
            if self.isWaitingAfterLine:
                self.isWaitingAfterLine = False
                self.newPiece()
                self.timer.start(self.timeoutTime(), self)
            else:
                self.oneLineDown()
        else:
            super(TetrixBoard, self).timerEvent(event)

    def clearBoard(self):
        self.board = [NoShape for i in range(TetrixBoard.BoardHeight * TetrixBoard.BoardWidth)]

    def dropDown(self):
        dropHeight = 0
        newY = self.curY
        while newY > 0:
            if not self.tryMove(self.curPiece, self.curX, newY - 1):
                break
            newY -= 1
            dropHeight += 1

        self.pieceDropped(dropHeight)

    def oneLineDown(self):
        if not self.tryMove(self.curPiece, self.curX, self.curY - 1):
            self.pieceDropped(0)

    def pieceDropped(self, dropHeight):
        for i in range(4):
            x = self.curX + self.curPiece.x(i)
            y = self.curY - self.curPiece.y(i)
            self.setShapeAt(x, y, self.curPiece.shape())

        self.numPiecesDropped += 1
        if self.numPiecesDropped % 25 == 0:
            self.level += 1
            self.timer.start(self.timeoutTime(), self)
            self.levelChanged.emit(self.level)

        self.score += dropHeight + 7
        self.scoreChanged.emit(self.score)
        self.removeFullLines()

        if not self.isWaitingAfterLine:
            self.newPiece()

    def removeFullLines(self):
        numFullLines = 0

        for i in range(TetrixBoard.BoardHeight - 1, -1, -1):
            lineIsFull = True

            for j in range(TetrixBoard.BoardWidth):
                if self.shapeAt(j, i) == NoShape:
                    lineIsFull = False
                    break

            if lineIsFull:
                numFullLines += 1
                for k in range(TetrixBoard.BoardHeight - 1):
                    for j in range(TetrixBoard.BoardWidth):
                        self.setShapeAt(j, k, self.shapeAt(j, k + 1))

                for j in range(TetrixBoard.BoardWidth):
                    self.setShapeAt(j, TetrixBoard.BoardHeight - 1, NoShape)

        if numFullLines > 0:
            self.numLinesRemoved += numFullLines
            self.score += 10 * numFullLines
            self.linesRemovedChanged.emit(self.numLinesRemoved)
            self.scoreChanged.emit(self.score)

            self.timer.start(500, self)
            self.isWaitingAfterLine = True
            self.curPiece.setShape(NoShape)
            self.update()

    def newPiece(self):
        self.curPiece = copy.deepcopy(self.nextPiece)
        self.nextPiece.setRandomShape()
        self.showNextPiece()
        self.curX = TetrixBoard.BoardWidth // 2 + 1
        self.curY = TetrixBoard.BoardHeight - 1 + self.curPiece.minY()

        if not self.tryMove(self.curPiece, self.curX, self.curY):
            self.curPiece.setShape(NoShape)
            self.timer.stop()
            self.isStarted = False

    def showNextPiece(self):
        if self.nextPieceLabel is None:
            return

        dx = self.nextPiece.maxX() - self.nextPiece.minX() + 1
        dy = self.nextPiece.maxY() - self.nextPiece.minY() + 1

        pixmap = QPixmap(dx * self.squareWidth(), dy * self.squareHeight())
        painter = QPainter(pixmap)
        painter.fillRect(pixmap.rect(), self.nextPieceLabel.palette().window())

        for i in range(4):
            x = self.nextPiece.x(i) - self.nextPiece.minX()
            y = self.nextPiece.y(i) - self.nextPiece.minY()
            self.drawSquare(painter, x * self.squareWidth(),
                    y * self.squareHeight(), self.nextPiece.shape())

        painter.end()

        self.nextPieceLabel.setPixmap(pixmap)

    def tryMove(self, newPiece, newX, newY):
        for i in range(4):
            x = newX + newPiece.x(i)
            y = newY - newPiece.y(i)
            if x < 0 or x >= TetrixBoard.BoardWidth or y < 0 or y >= TetrixBoard.BoardHeight:
                return False
            if self.shapeAt(x, y) != NoShape:
                return False

        self.curPiece = newPiece
        self.curX = newX
        self.curY = newY
        self.update()
        return True

    def drawSquare(self, painter, x, y, shape):
        colorTable = [0x000000, 0xCC6666, 0x66CC66, 0x6666CC,
                      0xCCCC66, 0xCC66CC, 0x66CCCC, 0xDAAA00]

        color = QColor(colorTable[shape])
        painter.fillRect(x + 1, y + 1, self.squareWidth() - 2,
                self.squareHeight() - 2, color)

        painter.setPen(color.lighter())
        painter.drawLine(x, y + self.squareHeight() - 1, x, y)
        painter.drawLine(x, y, x + self.squareWidth() - 1, y)

        painter.setPen(color.darker())
        painter.drawLine(x + 1, y + self.squareHeight() - 1,
                x + self.squareWidth() - 1, y + self.squareHeight() - 1)
        painter.drawLine(x + self.squareWidth() - 1,
                y + self.squareHeight() - 1, x + self.squareWidth() - 1, y + 1)


class TetrixPiece(object):
    coordsTable = (
        ((0, 0),     (0, 0),     (0, 0),     (0, 0)),
        ((0, -1),    (0, 0),     (-1, 0),    (-1, 1)),
        ((0, -1),    (0, 0),     (1, 0),     (1, 1)),
        ((0, -1),    (0, 0),     (0, 1),     (0, 2)),
        ((-1, 0),    (0, 0),     (1, 0),     (0, 1)),
        ((0, 0),     (1, 0),     (0, 1),     (1, 1)),
        ((-1, -1),   (0, -1),    (0, 0),     (0, 1)),
        ((1, -1),    (0, -1),    (0, 0),     (0, 1))
    )

    def __init__(self):
        self.coords = [[0, 0] for _ in range(4)]
        self.pieceShape = NoShape

        self.setShape(NoShape)

    def shape(self):
        return self.pieceShape

    def setShape(self, shape):
        table = TetrixPiece.coordsTable[shape]
        for i in range(4):
            for j in range(2):
                self.coords[i][j] = table[i][j]

        self.pieceShape = shape

    def setRandomShape(self):
        self.setShape(random.randint(1, 7))

    def x(self, index):
        return self.coords[index][0]

    def y(self, index):
        return self.coords[index][1]

    def setX(self, index, x):
        self.coords[index][0] = x

    def setY(self, index, y):
        self.coords[index][1] = y

    def minX(self):
        m = self.coords[0][0]
        for i in range(4):
            m = min(m, self.coords[i][0])

        return m

    def maxX(self):
        m = self.coords[0][0]
        for i in range(4):
            m = max(m, self.coords[i][0])

        return m

    def minY(self):
        m = self.coords[0][1]
        for i in range(4):
            m = min(m, self.coords[i][1])

        return m

    def maxY(self):
        m = self.coords[0][1]
        for i in range(4):
            m = max(m, self.coords[i][1])

        return m

    def rotatedLeft(self):
        if self.pieceShape == SquareShape:
            return self

        result = TetrixPiece()
        result.pieceShape = self.pieceShape
        for i in range(4):
            result.setX(i, self.y(i))
            result.setY(i, -self.x(i))

        return result

    def rotatedRight(self):
        if self.pieceShape == SquareShape:
            return self

        result = TetrixPiece()
        result.pieceShape = self.pieceShape
        for i in range(4):
            result.setX(i, -self.y(i))
            result.setY(i, self.x(i))

        return result


if __name__ == '__main__':

    import sys

    app = QApplication(sys.argv)
    window = TetrixWindow()
    window.show()
    random.seed(None)
    sys.exit(app.exec_())
