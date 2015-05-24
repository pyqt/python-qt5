TEMPLATE = lib
CONFIG += warn_on plugin
QT += quickwidgets
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = QtQuickWidgets.pyd
    target.files = QtQuickWidgets.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = QtQuickWidgets.so
    target.files = QtQuickWidgets.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/QtQuickWidgets
sip.files = ..\sip\QtQuickWidgets\qquickwidget.sip ..\sip\QtQuickWidgets\QtQuickWidgetsmod.sip
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

TARGET = QtQuickWidgets
HEADERS = sipAPIQtQuickWidgets.h
SOURCES = sipQtQuickWidgetscmodule.cpp sipQtQuickWidgetsQQuickWidget.cpp
