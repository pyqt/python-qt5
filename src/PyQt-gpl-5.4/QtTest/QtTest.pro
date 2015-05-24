TEMPLATE = lib
CONFIG += warn_on plugin
QT += testlib widgets
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = QtTest.pyd
    target.files = QtTest.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = QtTest.so
    target.files = QtTest.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/QtTest
sip.files = ..\sip\QtTest\qsignalspy.sip ..\sip\QtTest\qtestcase.sip ..\sip\QtTest\qtestkeyboard.sip ..\sip\QtTest\qtestmouse.sip ..\sip\QtTest\qtestsystem.sip ..\sip\QtTest\qtesttouch.sip ..\sip\QtTest\QtTestmod.sip
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

TARGET = QtTest
HEADERS = sipAPIQtTest.h
SOURCES = sipQtTestcmodule.cpp sipQtTestQSignalSpy.cpp sipQtTestQTest.cpp sipQtTestQTestQTouchEventSequence.cpp
