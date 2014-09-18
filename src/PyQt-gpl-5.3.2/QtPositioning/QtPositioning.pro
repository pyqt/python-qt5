TEMPLATE = lib
CONFIG += warn_on plugin
QT += positioning
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = QtPositioning.pyd
    target.files = QtPositioning.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = QtPositioning.so
    target.files = QtPositioning.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/QtPositioning
sip.files = ..\sip\QtPositioning\qgeoaddress.sip ..\sip\QtPositioning\qgeoareamonitorinfo.sip ..\sip\QtPositioning\qgeoareamonitorsource.sip ..\sip\QtPositioning\qgeocircle.sip ..\sip\QtPositioning\qgeocoordinate.sip ..\sip\QtPositioning\qgeolocation.sip ..\sip\QtPositioning\qgeopositioninfo.sip ..\sip\QtPositioning\qgeopositioninfosource.sip ..\sip\QtPositioning\qgeorectangle.sip ..\sip\QtPositioning\qgeosatelliteinfo.sip ..\sip\QtPositioning\qgeosatelliteinfosource.sip ..\sip\QtPositioning\qgeoshape.sip ..\sip\QtPositioning\qnmeapositioninfosource.sip ..\sip\QtPositioning\QtPositioningmod.sip
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

TARGET = QtPositioning
HEADERS = sipAPIQtPositioning.h
SOURCES = sipQtPositioningcmodule.cpp sipQtPositioningQGeoAddress.cpp sipQtPositioningQGeoAreaMonitorInfo.cpp sipQtPositioningQGeoAreaMonitorSource.cpp sipQtPositioningQGeoAreaMonitorSourceAreaMonitorFeatures.cpp sipQtPositioningQGeoCircle.cpp sipQtPositioningQGeoCoordinate.cpp sipQtPositioningQGeoLocation.cpp sipQtPositioningQGeoPositionInfo.cpp sipQtPositioningQGeoPositionInfoSource.cpp sipQtPositioningQGeoPositionInfoSourcePositioningMethods.cpp sipQtPositioningQGeoRectangle.cpp sipQtPositioningQGeoSatelliteInfo.cpp sipQtPositioningQGeoSatelliteInfoSource.cpp sipQtPositioningQGeoShape.cpp sipQtPositioningQList0100QGeoAreaMonitorInfo.cpp sipQtPositioningQList0100QGeoCoordinate.cpp sipQtPositioningQList0100QGeoSatelliteInfo.cpp sipQtPositioningQNmeaPositionInfoSource.cpp
