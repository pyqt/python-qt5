TEMPLATE = lib
CONFIG += warn_on plugin
QT += webkitwidgets
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = QtWebKitWidgets.pyd
    target.files = QtWebKitWidgets.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = QtWebKitWidgets.so
    target.files = QtWebKitWidgets.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/QtWebKitWidgets
sip.files = ..\sip\QtWebKitWidgets\qgraphicswebview.sip ..\sip\QtWebKitWidgets\QtWebKitWidgetsmod.sip ..\sip\QtWebKitWidgets\qwebframe.sip ..\sip\QtWebKitWidgets\qwebinspector.sip ..\sip\QtWebKitWidgets\qwebpage.sip ..\sip\QtWebKitWidgets\qwebview.sip
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

TARGET = QtWebKitWidgets
HEADERS = sipAPIQtWebKitWidgets.h
SOURCES = sipQtWebKitWidgetscmodule.cpp sipQtWebKitWidgetsQGraphicsWebView.cpp sipQtWebKitWidgetsQList0101QWebFrame.cpp sipQtWebKitWidgetsQMultiMap0100QString0100QString.cpp sipQtWebKitWidgetsQWebFrame.cpp sipQtWebKitWidgetsQWebFrameRenderLayers.cpp sipQtWebKitWidgetsQWebHitTestResult.cpp sipQtWebKitWidgetsQWebInspector.cpp sipQtWebKitWidgetsQWebPage.cpp sipQtWebKitWidgetsQWebPageChooseMultipleFilesExtensionOption.cpp sipQtWebKitWidgetsQWebPageChooseMultipleFilesExtensionReturn.cpp sipQtWebKitWidgetsQWebPageErrorPageExtensionOption.cpp sipQtWebKitWidgetsQWebPageErrorPageExtensionReturn.cpp sipQtWebKitWidgetsQWebPageExtensionOption.cpp sipQtWebKitWidgetsQWebPageExtensionReturn.cpp sipQtWebKitWidgetsQWebPageFindFlags.cpp sipQtWebKitWidgetsQWebPageViewportAttributes.cpp sipQtWebKitWidgetsQWebView.cpp
