TEMPLATE = lib
CONFIG += warn_on plugin
QT += opengl
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = QtOpenGL.pyd
    target.files = QtOpenGL.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = QtOpenGL.so
    target.files = QtOpenGL.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/QtOpenGL
sip.files = ..\sip\QtOpenGL\qgl.sip ..\sip\QtOpenGL\QtOpenGLmod.sip
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

TARGET = QtOpenGL
HEADERS = sipAPIQtOpenGL.h
SOURCES = sipQtOpenGLcmodule.cpp sipQtOpenGLQGL.cpp sipQtOpenGLQGLContext.cpp sipQtOpenGLQGLContextBindOptions.cpp sipQtOpenGLQGLFormat.cpp sipQtOpenGLQGLFormatOpenGLVersionFlags.cpp sipQtOpenGLQGLFormatOptions.cpp sipQtOpenGLQGLWidget.cpp
