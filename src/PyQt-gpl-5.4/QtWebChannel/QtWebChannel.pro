TEMPLATE = lib
CONFIG += warn_on plugin
QT += webchannel network
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = QtWebChannel.pyd
    target.files = QtWebChannel.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = QtWebChannel.so
    target.files = QtWebChannel.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/QtWebChannel
sip.files = ..\sip\QtWebChannel\QtWebChannelmod.sip ..\sip\QtWebChannel\qwebchannel.sip ..\sip\QtWebChannel\qwebchannelabstracttransport.sip
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

TARGET = QtWebChannel
HEADERS = sipAPIQtWebChannel.h
SOURCES = sipQtWebChannelcmodule.cpp sipQtWebChannelQHash0100QString0101QObject.cpp sipQtWebChannelQWebChannel.cpp sipQtWebChannelQWebChannelAbstractTransport.cpp
