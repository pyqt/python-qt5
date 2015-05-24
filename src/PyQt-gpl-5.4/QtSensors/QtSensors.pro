TEMPLATE = lib
CONFIG += warn_on plugin
QT += sensors
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = QtSensors.pyd
    target.files = QtSensors.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = QtSensors.so
    target.files = QtSensors.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/QtSensors
sip.files = ..\sip\QtSensors\qaccelerometer.sip ..\sip\QtSensors\qaltimeter.sip ..\sip\QtSensors\qambientlightsensor.sip ..\sip\QtSensors\qambienttemperaturesensor.sip ..\sip\QtSensors\qcompass.sip ..\sip\QtSensors\qdistancesensor.sip ..\sip\QtSensors\qgyroscope.sip ..\sip\QtSensors\qholstersensor.sip ..\sip\QtSensors\qirproximitysensor.sip ..\sip\QtSensors\qlightsensor.sip ..\sip\QtSensors\qmagnetometer.sip ..\sip\QtSensors\qorientationsensor.sip ..\sip\QtSensors\qpressuresensor.sip ..\sip\QtSensors\qproximitysensor.sip ..\sip\QtSensors\qrotationsensor.sip ..\sip\QtSensors\qsensor.sip ..\sip\QtSensors\qtapsensor.sip ..\sip\QtSensors\qtiltsensor.sip ..\sip\QtSensors\QtSensorsmod.sip
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

TARGET = QtSensors
HEADERS = sipAPIQtSensors.h
SOURCES = sipQtSensorscmodule.cpp sipQtSensorsQAccelerometer.cpp sipQtSensorsQAccelerometerFilter.cpp sipQtSensorsQAccelerometerReading.cpp sipQtSensorsQAltimeter.cpp sipQtSensorsQAltimeterFilter.cpp sipQtSensorsQAltimeterReading.cpp sipQtSensorsQAmbientLightFilter.cpp sipQtSensorsQAmbientLightReading.cpp sipQtSensorsQAmbientLightSensor.cpp sipQtSensorsQAmbientTemperatureFilter.cpp sipQtSensorsQAmbientTemperatureReading.cpp sipQtSensorsQAmbientTemperatureSensor.cpp sipQtSensorsQCompass.cpp sipQtSensorsQCompassFilter.cpp sipQtSensorsQCompassReading.cpp sipQtSensorsQDistanceFilter.cpp sipQtSensorsQDistanceReading.cpp sipQtSensorsQDistanceSensor.cpp sipQtSensorsQGyroscope.cpp sipQtSensorsQGyroscopeFilter.cpp sipQtSensorsQGyroscopeReading.cpp sipQtSensorsQHolsterFilter.cpp sipQtSensorsQHolsterReading.cpp sipQtSensorsQHolsterSensor.cpp sipQtSensorsQIRProximityFilter.cpp sipQtSensorsQIRProximityReading.cpp sipQtSensorsQIRProximitySensor.cpp sipQtSensorsQLightFilter.cpp sipQtSensorsQLightReading.cpp sipQtSensorsQLightSensor.cpp sipQtSensorsQList0100qoutputrange.cpp sipQtSensorsQList0101QSensorFilter.cpp sipQtSensorsQMagnetometer.cpp sipQtSensorsQMagnetometerFilter.cpp sipQtSensorsQMagnetometerReading.cpp sipQtSensorsQOrientationFilter.cpp sipQtSensorsQOrientationReading.cpp sipQtSensorsQOrientationSensor.cpp sipQtSensorsqoutputrange.cpp sipQtSensorsQPressureFilter.cpp sipQtSensorsQPressureReading.cpp sipQtSensorsQPressureSensor.cpp sipQtSensorsQProximityFilter.cpp sipQtSensorsQProximityReading.cpp sipQtSensorsQProximitySensor.cpp sipQtSensorsQRotationFilter.cpp sipQtSensorsQRotationReading.cpp sipQtSensorsQRotationSensor.cpp sipQtSensorsQSensor.cpp sipQtSensorsQSensorFilter.cpp sipQtSensorsQSensorReading.cpp sipQtSensorsQTapFilter.cpp sipQtSensorsQTapReading.cpp sipQtSensorsQTapSensor.cpp sipQtSensorsQTiltFilter.cpp sipQtSensorsQTiltReading.cpp sipQtSensorsQTiltSensor.cpp
