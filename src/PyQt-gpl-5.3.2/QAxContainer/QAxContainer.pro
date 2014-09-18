TEMPLATE = lib
CONFIG += warn_on plugin
QT += axcontainer
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = QAxContainer.pyd
    target.files = QAxContainer.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = QAxContainer.so
    target.files = QAxContainer.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/QAxContainer
sip.files = ..\sip\QAxContainer\qaxbase.sip ..\sip\QAxContainer\QAxContainermod.sip ..\sip\QAxContainer\qaxobject.sip ..\sip\QAxContainer\qaxwidget.sip
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

TARGET = QAxContainer
HEADERS = sipAPIQAxContainer.h
SOURCES = sipQAxContainercmodule.cpp sipQAxContainerQAxBase.cpp sipQAxContainerQAxObject.cpp sipQAxContainerQAxWidget.cpp
