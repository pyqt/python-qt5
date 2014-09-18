CONFIG      += plugin release warn_on
QT          += qml

# Work around QTBUG-39300.
CONFIG -= android_install

TARGET      = pyqt5qmlplugin
TEMPLATE    = lib

INCLUDEPATH += C:\Python27\Include C:\Python27\Include
LIBS        += -LC:\Python27\libs -lpython27

SOURCES     = pluginloader.cpp
HEADERS     = pluginloader.h

# Install.
target.path = C:/Qt/5.3/msvc2013_64/plugins/PyQt5

python.path = C:/Qt/5.3/msvc2013_64/plugins/PyQt5
python.files = python

INSTALLS    += target python

INCLUDEPATH += C:\Users\marcus\Downloads\PyQt-gpl-5.3.2\qmlscene
VPATH = C:\Users\marcus\Downloads\PyQt-gpl-5.3.2\qmlscene

