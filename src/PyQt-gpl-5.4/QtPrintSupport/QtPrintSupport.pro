TEMPLATE = lib
CONFIG += warn_on plugin
QT += printsupport
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = QtPrintSupport.pyd
    target.files = QtPrintSupport.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = QtPrintSupport.so
    target.files = QtPrintSupport.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/QtPrintSupport
sip.files = ..\sip\QtPrintSupport\qabstractprintdialog.sip ..\sip\QtPrintSupport\qpagesetupdialog.sip ..\sip\QtPrintSupport\qprintdialog.sip ..\sip\QtPrintSupport\qprintengine.sip ..\sip\QtPrintSupport\qprinter.sip ..\sip\QtPrintSupport\qprinterinfo.sip ..\sip\QtPrintSupport\qprintpreviewdialog.sip ..\sip\QtPrintSupport\qprintpreviewwidget.sip ..\sip\QtPrintSupport\qpyprintsupport_qlist.sip ..\sip\QtPrintSupport\QtPrintSupportmod.sip
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

TARGET = QtPrintSupport
HEADERS = sipAPIQtPrintSupport.h
SOURCES = sipQtPrintSupportcmodule.cpp sipQtPrintSupportQAbstractPrintDialog.cpp sipQtPrintSupportQAbstractPrintDialogPrintDialogOptions.cpp sipQtPrintSupportQList0100QPagedPaintDevicePageSize.cpp sipQtPrintSupportQList0100QPageSize.cpp sipQtPrintSupportQList0100QPrinterDuplexMode.cpp sipQtPrintSupportQList0100QPrinterInfo.cpp sipQtPrintSupportQList0600QPair0100QString0100QSizeF.cpp sipQtPrintSupportQPageSetupDialog.cpp sipQtPrintSupportQPrintDialog.cpp sipQtPrintSupportQPrintEngine.cpp sipQtPrintSupportQPrinter.cpp sipQtPrintSupportQPrinterInfo.cpp sipQtPrintSupportQPrintPreviewDialog.cpp sipQtPrintSupportQPrintPreviewWidget.cpp
