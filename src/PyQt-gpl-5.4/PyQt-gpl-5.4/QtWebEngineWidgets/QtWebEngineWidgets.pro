TEMPLATE = lib
CONFIG += warn_on plugin
QT += webenginewidgets network widgets
CONFIG += release
CONFIG += c++11
CONFIG -= android_install

win32 {
    PY_MODULE = QtWebEngineWidgets.pyd
    target.files = QtWebEngineWidgets.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = QtWebEngineWidgets.so
    target.files = QtWebEngineWidgets.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/QtWebEngineWidgets
sip.files = ..\sip\QtWebEngineWidgets\QtWebEngineWidgetsmod.sip ..\sip\QtWebEngineWidgets\qwebenginecertificateerror.sip ..\sip\QtWebEngineWidgets\qwebenginehistory.sip ..\sip\QtWebEngineWidgets\qwebenginepage.sip ..\sip\QtWebEngineWidgets\qwebenginesettings.sip ..\sip\QtWebEngineWidgets\qwebengineview.sip
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

TARGET = QtWebEngineWidgets
HEADERS = sipAPIQtWebEngineWidgets.h
SOURCES = sipQtWebEngineWidgetscmodule.cpp sipQtWebEngineWidgetsQList0100QWebEngineHistoryItem.cpp sipQtWebEngineWidgetsQWebEngineCertificateError.cpp sipQtWebEngineWidgetsQWebEngineHistory.cpp sipQtWebEngineWidgetsQWebEngineHistoryItem.cpp sipQtWebEngineWidgetsQWebEnginePage.cpp sipQtWebEngineWidgetsQWebEnginePageFindFlags.cpp sipQtWebEngineWidgetsQWebEngineSettings.cpp sipQtWebEngineWidgetsQWebEngineView.cpp
