TEMPLATE = lib
CONFIG += warn_on plugin
QT += svg
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = QtSvg.pyd
    target.files = QtSvg.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = QtSvg.so
    target.files = QtSvg.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/QtSvg
sip.files = ..\sip\QtSvg\qgraphicssvgitem.sip ..\sip\QtSvg\qsvggenerator.sip ..\sip\QtSvg\qsvgrenderer.sip ..\sip\QtSvg\qsvgwidget.sip ..\sip\QtSvg\QtSvgmod.sip
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

TARGET = QtSvg
HEADERS = sipAPIQtSvg.h
SOURCES = sipQtSvgcmodule.cpp sipQtSvgQGraphicsSvgItem.cpp sipQtSvgQSvgGenerator.cpp sipQtSvgQSvgRenderer.cpp sipQtSvgQSvgWidget.cpp
