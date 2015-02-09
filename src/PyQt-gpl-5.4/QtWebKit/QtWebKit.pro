TEMPLATE = lib
CONFIG += warn_on plugin
QT += webkit network
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = QtWebKit.pyd
    target.files = QtWebKit.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = QtWebKit.so
    target.files = QtWebKit.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/QtWebKit
sip.files = ..\sip\QtWebKit\QtWebKitmod.sip ..\sip\QtWebKit\qwebdatabase.sip ..\sip\QtWebKit\qwebelement.sip ..\sip\QtWebKit\qwebhistory.sip ..\sip\QtWebKit\qwebhistoryinterface.sip ..\sip\QtWebKit\qwebkitglobal.sip ..\sip\QtWebKit\qwebpluginfactory.sip ..\sip\QtWebKit\qwebsecurityorigin.sip ..\sip\QtWebKit\qwebsettings.sip
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

TARGET = QtWebKit
HEADERS = sipAPIQtWebKit.h
SOURCES = sipQtWebKitcmodule.cpp sipQtWebKitQList0100QWebDatabase.cpp sipQtWebKitQList0100QWebElement.cpp sipQtWebKitQList0100QWebHistoryItem.cpp sipQtWebKitQList0100QWebPluginFactoryMimeType.cpp sipQtWebKitQList0100QWebPluginFactoryPlugin.cpp sipQtWebKitQList0100QWebSecurityOrigin.cpp sipQtWebKitQWebDatabase.cpp sipQtWebKitQWebElement.cpp sipQtWebKitQWebElementCollection.cpp sipQtWebKitQWebHistory.cpp sipQtWebKitQWebHistoryInterface.cpp sipQtWebKitQWebHistoryItem.cpp sipQtWebKitQWebPluginFactory.cpp sipQtWebKitQWebPluginFactoryExtensionOption.cpp sipQtWebKitQWebPluginFactoryExtensionReturn.cpp sipQtWebKitQWebPluginFactoryMimeType.cpp sipQtWebKitQWebPluginFactoryPlugin.cpp sipQtWebKitQWebSecurityOrigin.cpp sipQtWebKitQWebSettings.cpp
