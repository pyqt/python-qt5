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


import sys
import math, random

from PyQt5.QtCore import (QPoint, QPointF, QRect, QRectF, QSize, Qt, QTime,
        QTimer)
from PyQt5.QtGui import (QBrush, QColor, QFontMetrics, QImage, QPainter,
        QRadialGradient)
from PyQt5.QtWidgets import QApplication, QMessageBox
from PyQt5.QtOpenGL import QGL, QGLFormat, QGLWidget

try:
    from OpenGL.GL import *
except ImportError:
    app = QApplication(sys.argv)
    QMessageBox.critical(None, "OpenGL overpainting",
            "PyOpenGL must be installed to run this example.")
    sys.exit(1)


class Bubble(object):
    def __init__(self, position, radius, velocity):
        self.position = position
        self.vel = velocity
        self.radius = radius

        self.innerColor = self.randomColor()
        self.outerColor = self.randomColor()
        self.updateBrush()

    def updateBrush(self):
        gradient = QRadialGradient(QPointF(self.radius, self.radius), self.radius, QPointF(self.radius*0.5, self.radius*0.5))

        gradient.setColorAt(0, QColor(255, 255, 255, 255))
        gradient.setColorAt(0.25, self.innerColor)
        gradient.setColorAt(1, self.outerColor)
        self.brush = QBrush(gradient)

    def drawBubble(self, painter):
        painter.save()
        painter.translate(self.position.x() - self.radius,
                self.position.y() - self.radius)
        painter.setBrush(self.brush)
        painter.drawEllipse(0, 0, int(2*self.radius), int(2*self.radius))
        painter.restore()

    def randomColor(self):
        red = random.randrange(205, 256)
        green = random.randrange(205, 256)
        blue = random.randrange(205, 256)
        alpha = random.randrange(91, 192)

        return QColor(red, green, blue, alpha)

    def move(self, bbox):
        self.position += self.vel
        leftOverflow = self.position.x() - self.radius - bbox.left()
        rightOverflow = self.position.x() + self.radius - bbox.right()
        topOverflow = self.position.y() - self.radius - bbox.top()
        bottomOverflow = self.position.y() + self.radius - bbox.bottom()

        if leftOverflow < 0.0:
            self.position.setX(self.position.x() - 2 * leftOverflow)
            self.vel.setX(-self.vel.x())
        elif rightOverflow > 0.0:
            self.position.setX(self.position.x() - 2 * rightOverflow)
            self.vel.setX(-self.vel.x())

        if topOverflow < 0.0:
            self.position.setY(self.position.y() - 2 * topOverflow)
            self.vel.setY(-self.vel.y())
        elif bottomOverflow > 0.0:
            self.position.setY(self.position.y() - 2 * bottomOverflow)
            self.vel.setY(-self.vel.y())

    def rect(self):
        return QRectF(self.position.x() - self.radius,
                self.position.y() - self.radius, 2 * self.radius,
                2 * self.radius)


class GLWidget(QGLWidget):
    def __init__(self, parent=None):
        super(GLWidget, self).__init__(QGLFormat(QGL.SampleBuffers), parent)

        midnight = QTime(0, 0, 0)
        random.seed(midnight.secsTo(QTime.currentTime()))

        self.object = 0
        self.xRot = 0
        self.yRot = 0
        self.zRot = 0
        self.image = QImage()
        self.bubbles = []
        self.lastPos = QPoint()

        self.trolltechGreen = QColor.fromCmykF(0.40, 0.0, 1.0, 0.0)
        self.trolltechPurple = QColor.fromCmykF(0.39, 0.39, 0.0, 0.0)

        self.animationTimer = QTimer()
        self.animationTimer.setSingleShot(False)
        self.animationTimer.timeout.connect(self.animate)
        self.animationTimer.start(25)

        self.setAutoFillBackground(False)
        self.setMinimumSize(200, 200)
        self.setWindowTitle("Overpainting a Scene")

    def __del__(self):
        self.makeCurrent()
        glDeleteLists(self.object, 1)

    def setXRotation(self, angle):
        angle = self.normalizeAngle(angle)
        if angle != self.xRot:
            self.xRot = angle

    def setYRotation(self, angle):
        angle = self.normalizeAngle(angle)
        if angle != self.yRot:
            self.yRot = angle

    def setZRotation(self, angle):
        angle = self.normalizeAngle(angle)
        if angle != self.zRot:
            self.zRot = angle

    def initializeGL(self):
        self.object = self.makeObject()

    def mousePressEvent(self, event):
        self.lastPos = event.pos()

    def mouseMoveEvent(self, event):
        dx = event.x() - self.lastPos.x()
        dy = event.y() - self.lastPos.y()

        if event.buttons() & Qt.LeftButton:
            self.setXRotation(self.xRot + 8 * dy)
            self.setYRotation(self.yRot + 8 * dx)
        elif event.buttons() & Qt.RightButton:
            self.setXRotation(self.xRot + 8 * dy)
            self.setZRotation(self.zRot + 8 * dx)

        self.lastPos = event.pos()

    def paintEvent(self, event):
        self.makeCurrent()

        glMatrixMode(GL_MODELVIEW)
        glPushMatrix()

        self.qglClearColor(self.trolltechPurple.darker())
        glShadeModel(GL_SMOOTH)
        glEnable(GL_DEPTH_TEST)
        #glEnable(GL_CULL_FACE)
        glEnable(GL_LIGHTING)
        glEnable(GL_LIGHT0)
        glEnable(GL_MULTISAMPLE)
        lightPosition = (0.5, 5.0, 7.0, 1.0)
        glLightfv(GL_LIGHT0, GL_POSITION, lightPosition)

        self.setupViewport(self.width(), self.height())

        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
        glLoadIdentity()
        glTranslated(0.0, 0.0, -10.0)
        glRotated(self.xRot / 16.0, 1.0, 0.0, 0.0)
        glRotated(self.yRot / 16.0, 0.0, 1.0, 0.0)
        glRotated(self.zRot / 16.0, 0.0, 0.0, 1.0)
        glCallList(self.object)

        glMatrixMode(GL_MODELVIEW)
        glPopMatrix()

        painter = QPainter(self)
        painter.setRenderHint(QPainter.Antialiasing)

        for bubble in self.bubbles:
            if bubble.rect().intersects(QRectF(event.rect())):
                bubble.drawBubble(painter)

        self.drawInstructions(painter)
        painter.end()

    def resizeGL(self, width, height):
        self.setupViewport(width, height)

    def showEvent(self, event):
        self.createBubbles(20 - len(self.bubbles))

    def sizeHint(self):
        return QSize(400, 400)

    def makeObject(self):
        list = glGenLists(1)
        glNewList(list, GL_COMPILE)

        glEnable(GL_NORMALIZE)
        glBegin(GL_QUADS)

        logoDiffuseColor = (self.trolltechGreen.red()/255.0,
                            self.trolltechGreen.green()/255.0,
                            self.trolltechGreen.blue()/255.0, 1.0)
        glMaterialfv(GL_FRONT, GL_DIFFUSE, logoDiffuseColor)

        x1 = +0.06
        y1 = -0.14
        x2 = +0.14
        y2 = -0.06
        x3 = +0.08
        y3 = +0.00
        x4 = +0.30
        y4 = +0.22

        self.quad(x1, y1, x2, y2, y2, x2, y1, x1)
        self.quad(x3, y3, x4, y4, y4, x4, y3, x3)

        self.extrude(x1, y1, x2, y2)
        self.extrude(x2, y2, y2, x2)
        self.extrude(y2, x2, y1, x1)
        self.extrude(y1, x1, x1, y1)
        self.extrude(x3, y3, x4, y4)
        self.extrude(x4, y4, y4, x4)
        self.extrude(y4, x4, y3, x3)

        NumSectors = 200

        for i in range(NumSectors):
            angle1 = (i * 2 * math.pi) / NumSectors
            x5 = 0.30 * math.sin(angle1)
            y5 = 0.30 * math.cos(angle1)
            x6 = 0.20 * math.sin(angle1)
            y6 = 0.20 * math.cos(angle1)

            angle2 = ((i + 1) * 2 * math.pi) / NumSectors
            x7 = 0.20 * math.sin(angle2)
            y7 = 0.20 * math.cos(angle2)
            x8 = 0.30 * math.sin(angle2)
            y8 = 0.30 * math.cos(angle2)

            self.quad(x5, y5, x6, y6, x7, y7, x8, y8)

            self.extrude(x6, y6, x7, y7)
            self.extrude(x8, y8, x5, y5)

        glEnd()

        glEndList()
        return list

    def quad(self, x1, y1, x2, y2, x3, y3, x4, y4):
        glNormal3d(0.0, 0.0, -1.0)
        glVertex3d(x1, y1, -0.05)
        glVertex3d(x2, y2, -0.05)
        glVertex3d(x3, y3, -0.05)
        glVertex3d(x4, y4, -0.05)

        glNormal3d(0.0, 0.0, 1.0)
        glVertex3d(x4, y4, +0.05)
        glVertex3d(x3, y3, +0.05)
        glVertex3d(x2, y2, +0.05)
        glVertex3d(x1, y1, +0.05)

    def extrude(self, x1, y1, x2, y2):
        self.qglColor(self.trolltechGreen.darker(250 + int(100 * x1)))

        glNormal3d((x1 + x2)/2.0, (y1 + y2)/2.0, 0.0)
        glVertex3d(x1, y1, +0.05)
        glVertex3d(x2, y2, +0.05)
        glVertex3d(x2, y2, -0.05)
        glVertex3d(x1, y1, -0.05)

    def normalizeAngle(self, angle):
        while angle < 0:
            angle += 360 * 16
        while angle > 360 * 16:
            angle -= 360 * 16
        return angle

    def createBubbles(self, number):
        for i in range(number):
            position = QPointF(self.width()*(0.1 + 0.8*random.random()),
                               self.height()*(0.1 + 0.8*random.random()))
            radius = min(self.width(), self.height())*(0.0125 + 0.0875*random.random())
            velocity = QPointF(self.width()*0.0125*(-0.5 + random.random()),
                               self.height()*0.0125*(-0.5 + random.random()))

            self.bubbles.append(Bubble(position, radius, velocity))

    def animate(self):
        for bubble in self.bubbles:
            bubble.move(self.rect())

        self.update()

    def setupViewport(self, width, height):
        side = min(width, height)
        glViewport((width - side) // 2, (height - side) // 2, side, side)

        glMatrixMode(GL_PROJECTION)
        glLoadIdentity()
        glOrtho(-0.5, +0.5, +0.5, -0.5, 4.0, 15.0)
        glMatrixMode(GL_MODELVIEW)

    def drawInstructions(self, painter):
        text = "Click and drag with the left mouse button to rotate the Qt " \
                "logo."
        metrics = QFontMetrics(self.font())
        border = max(4, metrics.leading())

        rect = metrics.boundingRect(0, 0, self.width() - 2*border,
                int(self.height()*0.125), Qt.AlignCenter | Qt.TextWordWrap,
                text)
        painter.setRenderHint(QPainter.TextAntialiasing)
        painter.fillRect(QRect(0, 0, self.width(), rect.height() + 2*border), QColor(0, 0, 0, 127))
        painter.setPen(Qt.white)
        painter.fillRect(QRect(0, 0, self.width(), rect.height() + 2*border), QColor(0, 0, 0, 127))
        painter.drawText((self.width() - rect.width())/2, border, rect.width(),
                rect.height(), Qt.AlignCenter | Qt.TextWordWrap, text)


if __name__ == '__main__':

    app = QApplication(sys.argv)
    window = GLWidget()
    window.show()
    sys.exit(app.exec_())
