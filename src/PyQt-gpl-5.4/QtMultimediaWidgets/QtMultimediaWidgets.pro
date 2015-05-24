TEMPLATE = lib
CONFIG += warn_on plugin
QT += multimediawidgets multimedia
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = QtMultimediaWidgets.pyd
    target.files = QtMultimediaWidgets.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = QtMultimediaWidgets.so
    target.files = QtMultimediaWidgets.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/QtMultimediaWidgets
sip.files = ..\sip\QtMultimediaWidgets\qcameraviewfinder.sip ..\sip\QtMultimediaWidgets\qgraphicsvideoitem.sip ..\sip\QtMultimediaWidgets\QtMultimediaWidgetsmod.sip ..\sip\QtMultimediaWidgets\qvideowidget.sip
INSTALLS += sip
INCLUDEPATH += .
INCLUDEPATH += C:\Python27\Include

win32 {
    QMAKE_POST_LINK = $(COPY_FILE) $(DESTDIR_TARGET) $$PY_MODULE
} else {
    QMAKE_POST_LINK = $(COPY_FILE) $(TARGET) $$PY_MODULE
}
macx {
    QMAKE_LFLAGS += "-undefined dynamic_lookup"
    QMAKE_LFLAGS += "-install_name $$absolute_path($$PY_MODULE, $$target.path)"
}

TARGET = QtMultimediaWidgets
HEADERS = sipAPIQtMultimediaWidgets.h
SOURCES = sipQtMultimediaWidgetscmodule.cpp sipQtMultimediaWidgetsQCameraViewfinder.cpp sipQtMultimediaWidgetsQGraphicsVideoItem.cpp sipQtMultimediaWidgetsQVideoWidget.cpp
