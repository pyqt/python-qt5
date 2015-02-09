TEMPLATE = subdirs
CONFIG += ordered
SUBDIRS = QtCore QtGui QtHelp QtMultimedia QtMultimediaWidgets QtNetwork QtOpenGL QtPrintSupport QtQml QtQuick QtSql QtSvg QtTest QtWebKit QtWebKitWidgets QtWidgets QtXml QtXmlPatterns QtDesigner QAxContainer _QOpenGLFunctions_2_0 QtSensors QtSerialPort QtBluetooth QtPositioning QtWinExtras QtQuickWidgets QtWebSockets Enginio QtWebChannel QtWebEngineWidgets Qt pylupdate pyrcc designer qmlscene

init_py.files = C:\Users\marcus\Downloads\PyQt-gpl-5.4\PyQt-gpl-5.4\__init__.py
init_py.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += init_py

uic_package.files = C:\Users\marcus\Downloads\PyQt-gpl-5.4\PyQt-gpl-5.4\pyuic\uic
uic_package.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += uic_package

pyuic5.files = pyuic5.bat
pyuic5.path = C:\Python27
INSTALLS += pyuic5
