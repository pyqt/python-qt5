TEMPLATE = lib
CONFIG += warn_on plugin
QT += bluetooth
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = QtBluetooth.pyd
    target.files = QtBluetooth.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = QtBluetooth.so
    target.files = QtBluetooth.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/QtBluetooth
sip.files = ..\sip\QtBluetooth\qbluetooth.sip ..\sip\QtBluetooth\qbluetoothaddress.sip ..\sip\QtBluetooth\qbluetoothdevicediscoveryagent.sip ..\sip\QtBluetooth\qbluetoothdeviceinfo.sip ..\sip\QtBluetooth\qbluetoothhostinfo.sip ..\sip\QtBluetooth\qbluetoothlocaldevice.sip ..\sip\QtBluetooth\qbluetoothserver.sip ..\sip\QtBluetooth\qbluetoothservicediscoveryagent.sip ..\sip\QtBluetooth\qbluetoothserviceinfo.sip ..\sip\QtBluetooth\qbluetoothsocket.sip ..\sip\QtBluetooth\qbluetoothtransfermanager.sip ..\sip\QtBluetooth\qbluetoothtransferreply.sip ..\sip\QtBluetooth\qbluetoothtransferrequest.sip ..\sip\QtBluetooth\qbluetoothuuid.sip ..\sip\QtBluetooth\qpybluetooth_qlist.sip ..\sip\QtBluetooth\qpybluetooth_quint128.sip ..\sip\QtBluetooth\QtBluetoothmod.sip
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

TARGET = QtBluetooth
HEADERS = sipAPIQtBluetooth.h
SOURCES = sipQtBluetoothcmodule.cpp sipQtBluetoothQBluetooth.cpp sipQtBluetoothQBluetoothAddress.cpp sipQtBluetoothQBluetoothDeviceDiscoveryAgent.cpp sipQtBluetoothQBluetoothDeviceInfo.cpp sipQtBluetoothQBluetoothDeviceInfoServiceClasses.cpp sipQtBluetoothQBluetoothHostInfo.cpp sipQtBluetoothQBluetoothLocalDevice.cpp sipQtBluetoothQBluetoothSecurityFlags.cpp sipQtBluetoothQBluetoothServer.cpp sipQtBluetoothQBluetoothServiceDiscoveryAgent.cpp sipQtBluetoothQBluetoothServiceInfo.cpp sipQtBluetoothQBluetoothServiceInfoSequence.cpp sipQtBluetoothQBluetoothSocket.cpp sipQtBluetoothQBluetoothTransferManager.cpp sipQtBluetoothQBluetoothTransferReply.cpp sipQtBluetoothQBluetoothTransferRequest.cpp sipQtBluetoothQBluetoothUuid.cpp sipQtBluetoothQList0100QBluetoothAddress.cpp sipQtBluetoothQList0100QBluetoothDeviceInfo.cpp sipQtBluetoothQList0100QBluetoothHostInfo.cpp sipQtBluetoothQList0100QBluetoothServiceInfo.cpp sipQtBluetoothQList0100QBluetoothUuid.cpp sipQtBluetoothQList1600.cpp sipQtBluetoothquint128.cpp
