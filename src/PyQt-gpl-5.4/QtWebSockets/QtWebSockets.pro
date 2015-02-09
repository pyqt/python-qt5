TEMPLATE = lib
CONFIG += warn_on plugin
QT += websockets
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = QtWebSockets.pyd
    target.files = QtWebSockets.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = QtWebSockets.so
    target.files = QtWebSockets.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/QtWebSockets
sip.files = ..\sip\QtWebSockets\qmaskgenerator.sip ..\sip\QtWebSockets\QtWebSocketsmod.sip ..\sip\QtWebSockets\qwebsocket.sip ..\sip\QtWebSockets\qwebsocketcorsauthenticator.sip ..\sip\QtWebSockets\qwebsocketprotocol.sip ..\sip\QtWebSockets\qwebsocketserver.sip
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

TARGET = QtWebSockets
HEADERS = sipAPIQtWebSockets.h
SOURCES = sipQtWebSocketscmodule.cpp sipQtWebSocketsQList0100QWebSocketProtocolVersion.cpp sipQtWebSocketsQMaskGenerator.cpp sipQtWebSocketsQWebSocket.cpp sipQtWebSocketsQWebSocketCorsAuthenticator.cpp sipQtWebSocketsQWebSocketProtocol.cpp sipQtWebSocketsQWebSocketServer.cpp
