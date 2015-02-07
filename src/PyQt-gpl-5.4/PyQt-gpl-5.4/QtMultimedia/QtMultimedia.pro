TEMPLATE = lib
CONFIG += warn_on plugin
QT += multimedia
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = QtMultimedia.pyd
    target.files = QtMultimedia.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = QtMultimedia.so
    target.files = QtMultimedia.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/QtMultimedia
sip.files = ..\sip\QtMultimedia\qabstractvideobuffer.sip ..\sip\QtMultimedia\qabstractvideosurface.sip ..\sip\QtMultimedia\qaudio.sip ..\sip\QtMultimedia\qaudiobuffer.sip ..\sip\QtMultimedia\qaudiodecoder.sip ..\sip\QtMultimedia\qaudiodeviceinfo.sip ..\sip\QtMultimedia\qaudioformat.sip ..\sip\QtMultimedia\qaudioinput.sip ..\sip\QtMultimedia\qaudiooutput.sip ..\sip\QtMultimedia\qaudioprobe.sip ..\sip\QtMultimedia\qaudiorecorder.sip ..\sip\QtMultimedia\qcamera.sip ..\sip\QtMultimedia\qcameraexposure.sip ..\sip\QtMultimedia\qcamerafocus.sip ..\sip\QtMultimedia\qcameraimagecapture.sip ..\sip\QtMultimedia\qcameraimageprocessing.sip ..\sip\QtMultimedia\qcamerainfo.sip ..\sip\QtMultimedia\qmediabindableinterface.sip ..\sip\QtMultimedia\qmediacontent.sip ..\sip\QtMultimedia\qmediacontrol.sip ..\sip\QtMultimedia\qmediaencodersettings.sip ..\sip\QtMultimedia\qmediametadata.sip ..\sip\QtMultimedia\qmediaobject.sip ..\sip\QtMultimedia\qmediaplayer.sip ..\sip\QtMultimedia\qmediaplaylist.sip ..\sip\QtMultimedia\qmediarecorder.sip ..\sip\QtMultimedia\qmediaresource.sip ..\sip\QtMultimedia\qmediaservice.sip ..\sip\QtMultimedia\qmediatimerange.sip ..\sip\QtMultimedia\qmultimedia.sip ..\sip\QtMultimedia\qpymultimedia_qlist.sip ..\sip\QtMultimedia\qradiodata.sip ..\sip\QtMultimedia\qradiotuner.sip ..\sip\QtMultimedia\qsound.sip ..\sip\QtMultimedia\qsoundeffect.sip ..\sip\QtMultimedia\QtMultimediamod.sip ..\sip\QtMultimedia\qvideoframe.sip ..\sip\QtMultimedia\qvideoprobe.sip ..\sip\QtMultimedia\qvideosurfaceformat.sip
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

TARGET = QtMultimedia
HEADERS = sipAPIQtMultimedia.h
SOURCES = sipQtMultimediacmodule.cpp sipQtMultimediaQAbstractVideoBuffer.cpp sipQtMultimediaQAbstractVideoSurface.cpp sipQtMultimediaQAudio.cpp sipQtMultimediaQAudioBuffer.cpp sipQtMultimediaQAudioDecoder.cpp sipQtMultimediaQAudioDeviceInfo.cpp sipQtMultimediaQAudioEncoderSettings.cpp sipQtMultimediaQAudioFormat.cpp sipQtMultimediaQAudioInput.cpp sipQtMultimediaQAudioOutput.cpp sipQtMultimediaQAudioProbe.cpp sipQtMultimediaQAudioRecorder.cpp sipQtMultimediaQCamera.cpp sipQtMultimediaQCameraCaptureModes.cpp sipQtMultimediaQCameraExposure.cpp sipQtMultimediaQCameraExposureFlashModes.cpp sipQtMultimediaQCameraFocus.cpp sipQtMultimediaQCameraFocusFocusModes.cpp sipQtMultimediaQCameraFocusZone.cpp sipQtMultimediaQCameraImageCapture.cpp sipQtMultimediaQCameraImageCaptureCaptureDestinations.cpp sipQtMultimediaQCameraImageProcessing.cpp sipQtMultimediaQCameraInfo.cpp sipQtMultimediaQCameraLockTypes.cpp sipQtMultimediaQImageEncoderSettings.cpp sipQtMultimediaQList0100QAudioDeviceInfo.cpp sipQtMultimediaQList0100QAudioFormatEndian.cpp sipQtMultimediaQList0100QAudioFormatSampleType.cpp sipQtMultimediaQList0100QCameraFocusZone.cpp sipQtMultimediaQList0100QCameraInfo.cpp sipQtMultimediaQList0100QMediaContent.cpp sipQtMultimediaQList0100QMediaResource.cpp sipQtMultimediaQList0100QMediaTimeInterval.cpp sipQtMultimediaQList0100QVideoFramePixelFormat.cpp sipQtMultimediaQMediaBindableInterface.cpp sipQtMultimediaQMediaContent.cpp sipQtMultimediaQMediaControl.cpp sipQtMultimediaQMediaMetaData.cpp sipQtMultimediaQMediaObject.cpp sipQtMultimediaQMediaPlayer.cpp sipQtMultimediaQMediaPlayerFlags.cpp sipQtMultimediaQMediaPlaylist.cpp sipQtMultimediaQMediaRecorder.cpp sipQtMultimediaQMediaResource.cpp sipQtMultimediaQMediaService.cpp sipQtMultimediaQMediaTimeInterval.cpp sipQtMultimediaQMediaTimeRange.cpp sipQtMultimediaQMultimedia.cpp sipQtMultimediaQRadioData.cpp sipQtMultimediaQRadioTuner.cpp sipQtMultimediaQSound.cpp sipQtMultimediaQSoundEffect.cpp sipQtMultimediaQVideoEncoderSettings.cpp sipQtMultimediaQVideoFrame.cpp sipQtMultimediaQVideoProbe.cpp sipQtMultimediaQVideoSurfaceFormat.cpp
