CONFIG      += plugin release warn_on
QT          += designer

# Work around QTBUG-39300.
CONFIG -= android_install

TARGET      = pyqt5
TEMPLATE    = lib

INCLUDEPATH += C:\Python27\Include
LIBS        += -LC:\Python27\libs -lpython27
DEFINES     += PYTHON_LIB=\\\"python27\\\"

SOURCES     = pluginloader.cpp
HEADERS     = pluginloader.h

# Install.
target.path = C:/Qt/5.4/msvc2013_64/plugins/designer

python.path = C:/Qt/5.4/msvc2013_64/plugins/designer
python.files = python

INSTALLS    += target python

INCLUDEPATH += C:\Users\marcus\Downloads\PyQt-gpl-5.4\PyQt-gpl-5.4\designer
VPATH = C:\Users\marcus\Downloads\PyQt-gpl-5.4\PyQt-gpl-5.4\designer

