TEMPLATE = lib
CONFIG += warn_on plugin
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = _QOpenGLFunctions_2_0.pyd
    target.files = _QOpenGLFunctions_2_0.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = _QOpenGLFunctions_2_0.so
    target.files = _QOpenGLFunctions_2_0.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/_QOpenGLFunctions_2_0
sip.files = ..\sip\_QOpenGLFunctions_2_0\qopenglfunctions_2_0.sip ..\sip\_QOpenGLFunctions_2_0\_QOpenGLFunctions_2_0mod.sip
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

TARGET = _QOpenGLFunctions_2_0
HEADERS = sipAPI_QOpenGLFunctions_2_0.h
SOURCES = sip_QOpenGLFunctions_2_0cmodule.cpp sip_QOpenGLFunctions_2_0QOpenGLFunctions_2_0.cpp
