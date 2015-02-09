TEMPLATE = lib
CONFIG += warn_on plugin
QT += enginio
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = Enginio.pyd
    target.files = Enginio.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = Enginio.so
    target.files = Enginio.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/Enginio
sip.files = ..\sip\Enginio\enginio.sip ..\sip\Enginio\enginioclient.sip ..\sip\Enginio\enginioclientconnection.sip ..\sip\Enginio\enginioidentity.sip ..\sip\Enginio\Enginiomod.sip ..\sip\Enginio\enginiomodel.sip ..\sip\Enginio\enginiooauth2authentication.sip ..\sip\Enginio\enginioreply.sip
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

TARGET = Enginio
HEADERS = sipAPIEnginio.h
SOURCES = sipEnginiocmodule.cpp sipEnginioEnginio.cpp sipEnginioEnginioClient.cpp sipEnginioEnginioClientConnection.cpp sipEnginioEnginioIdentity.cpp sipEnginioEnginioModel.cpp sipEnginioEnginioOAuth2Authentication.cpp sipEnginioEnginioReply.cpp
