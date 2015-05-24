TEMPLATE = lib
CONFIG += warn_on plugin
QT -= gui
QT += xmlpatterns network
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = QtXmlPatterns.pyd
    target.files = QtXmlPatterns.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = QtXmlPatterns.so
    target.files = QtXmlPatterns.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/QtXmlPatterns
sip.files = ..\sip\QtXmlPatterns\qabstractmessagehandler.sip ..\sip\QtXmlPatterns\qabstracturiresolver.sip ..\sip\QtXmlPatterns\qabstractxmlnodemodel.sip ..\sip\QtXmlPatterns\qabstractxmlreceiver.sip ..\sip\QtXmlPatterns\qsimplexmlnodemodel.sip ..\sip\QtXmlPatterns\qsourcelocation.sip ..\sip\QtXmlPatterns\QtXmlPatternsmod.sip ..\sip\QtXmlPatterns\qxmlformatter.sip ..\sip\QtXmlPatterns\qxmlname.sip ..\sip\QtXmlPatterns\qxmlnamepool.sip ..\sip\QtXmlPatterns\qxmlquery.sip ..\sip\QtXmlPatterns\qxmlresultitems.sip ..\sip\QtXmlPatterns\qxmlschema.sip ..\sip\QtXmlPatterns\qxmlschemavalidator.sip ..\sip\QtXmlPatterns\qxmlserializer.sip
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

TARGET = QtXmlPatterns
HEADERS = sipAPIQtXmlPatterns.h
SOURCES = sipQtXmlPatternscmodule.cpp sipQtXmlPatternsQAbstractMessageHandler.cpp sipQtXmlPatternsQAbstractUriResolver.cpp sipQtXmlPatternsQAbstractXmlNodeModel.cpp sipQtXmlPatternsQAbstractXmlReceiver.cpp sipQtXmlPatternsQSimpleXmlNodeModel.cpp sipQtXmlPatternsQSourceLocation.cpp sipQtXmlPatternsQVector0100QXmlName.cpp sipQtXmlPatternsQVector0100QXmlNodeModelIndex.cpp sipQtXmlPatternsQXmlFormatter.cpp sipQtXmlPatternsQXmlItem.cpp sipQtXmlPatternsQXmlName.cpp sipQtXmlPatternsQXmlNamePool.cpp sipQtXmlPatternsQXmlNodeModelIndex.cpp sipQtXmlPatternsQXmlQuery.cpp sipQtXmlPatternsQXmlResultItems.cpp sipQtXmlPatternsQXmlSchema.cpp sipQtXmlPatternsQXmlSchemaValidator.cpp sipQtXmlPatternsQXmlSerializer.cpp
