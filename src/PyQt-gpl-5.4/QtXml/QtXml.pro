TEMPLATE = lib
CONFIG += warn_on plugin
QT -= gui
QT += xml
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = QtXml.pyd
    target.files = QtXml.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = QtXml.so
    target.files = QtXml.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/QtXml
sip.files = ..\sip\QtXml\qdom.sip ..\sip\QtXml\QtXmlmod.sip ..\sip\QtXml\qxml.sip
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

TARGET = QtXml
HEADERS = sipAPIQtXml.h
SOURCES = sipQtXmlcmodule.cpp sipQtXmlQDomAttr.cpp sipQtXmlQDomCDATASection.cpp sipQtXmlQDomCharacterData.cpp sipQtXmlQDomComment.cpp sipQtXmlQDomDocument.cpp sipQtXmlQDomDocumentFragment.cpp sipQtXmlQDomDocumentType.cpp sipQtXmlQDomElement.cpp sipQtXmlQDomEntity.cpp sipQtXmlQDomEntityReference.cpp sipQtXmlQDomImplementation.cpp sipQtXmlQDomNamedNodeMap.cpp sipQtXmlQDomNode.cpp sipQtXmlQDomNodeList.cpp sipQtXmlQDomNotation.cpp sipQtXmlQDomProcessingInstruction.cpp sipQtXmlQDomText.cpp sipQtXmlQXmlAttributes.cpp sipQtXmlQXmlContentHandler.cpp sipQtXmlQXmlDeclHandler.cpp sipQtXmlQXmlDefaultHandler.cpp sipQtXmlQXmlDTDHandler.cpp sipQtXmlQXmlEntityResolver.cpp sipQtXmlQXmlErrorHandler.cpp sipQtXmlQXmlInputSource.cpp sipQtXmlQXmlLexicalHandler.cpp sipQtXmlQXmlLocator.cpp sipQtXmlQXmlNamespaceSupport.cpp sipQtXmlQXmlParseException.cpp sipQtXmlQXmlReader.cpp sipQtXmlQXmlSimpleReader.cpp
