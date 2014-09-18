TEMPLATE = lib
CONFIG += warn_on plugin
QT += serialport
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = QtSerialPort.pyd
    target.files = QtSerialPort.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = QtSerialPort.so
    target.files = QtSerialPort.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/QtSerialPort
sip.files = ..\sip\QtSerialPort\qserialport.sip ..\sip\QtSerialPort\qserialportinfo.sip ..\sip\QtSerialPort\QtSerialPortmod.sip
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

TARGET = QtSerialPort
HEADERS = sipAPIQtSerialPort.h
SOURCES = sipQtSerialPortcmodule.cpp sipQtSerialPortQList0100QSerialPortInfo.cpp sipQtSerialPortQSerialPort.cpp sipQtSerialPortQSerialPortDirections.cpp sipQtSerialPortQSerialPortInfo.cpp sipQtSerialPortQSerialPortPinoutSignals.cpp
