TEMPLATE = lib
CONFIG += warn_on plugin
QT += qml
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = QtQml.pyd
    target.files = QtQml.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = QtQml.so
    target.files = QtQml.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/QtQml
sip.files = ..\sip\QtQml\qjsengine.sip ..\sip\QtQml\qjsvalue.sip ..\sip\QtQml\qjsvalueiterator.sip ..\sip\QtQml\qmlattachedpropertiesobject.sip ..\sip\QtQml\qmlregistertype.sip ..\sip\QtQml\qpyqmllistproperty.sip ..\sip\QtQml\qqmlabstracturlinterceptor.sip ..\sip\QtQml\qqmlapplicationengine.sip ..\sip\QtQml\qqmlcomponent.sip ..\sip\QtQml\qqmlcontext.sip ..\sip\QtQml\qqmlengine.sip ..\sip\QtQml\qqmlerror.sip ..\sip\QtQml\qqmlexpression.sip ..\sip\QtQml\qqmlextensionplugin.sip ..\sip\QtQml\qqmlfileselector.sip ..\sip\QtQml\qqmlincubator.sip ..\sip\QtQml\qqmllist.sip ..\sip\QtQml\qqmlnetworkaccessmanagerfactory.sip ..\sip\QtQml\qqmlparserstatus.sip ..\sip\QtQml\qqmlproperty.sip ..\sip\QtQml\qqmlpropertymap.sip ..\sip\QtQml\qqmlpropertyvaluesource.sip ..\sip\QtQml\qqmlscriptstring.sip ..\sip\QtQml\QtQmlmod.sip
INSTALLS += sip
INCLUDEPATH += .
INCLUDEPATH += C:\Python27\Include
INCLUDEPATH += ..\qpy\QtQml

win32 {
    QMAKE_POST_LINK = $(COPY_FILE) $(DESTDIR_TARGET) $$PY_MODULE
} else {
    QMAKE_POST_LINK = $(COPY_FILE) $(TARGET) $$PY_MODULE
}
macx {
    QMAKE_LFLAGS += "-undefined dynamic_lookup"
    QMAKE_LFLAGS += "-install_name $$absolute_path($$PY_MODULE, $$target.path)"
}

TARGET = QtQml
HEADERS = sipAPIQtQml.h ..\qpy\QtQml\qpyqmllistproperty.h ..\qpy\QtQml\qpyqmlobject.h ..\qpy\QtQml\qpyqmlsingletonobject.h ..\qpy\QtQml\qpyqml_api.h ..\qpy\QtQml\qpyqml_listdata.h
SOURCES = sipQtQmlcmodule.cpp sipQtQmlQJSEngine.cpp sipQtQmlQJSValue.cpp sipQtQmlQJSValueIterator.cpp sipQtQmlQList0100QJSValue.cpp sipQtQmlQList0100QQmlError.cpp sipQtQmlQList0100QQmlProperty.cpp sipQtQmlQQmlAbstractUrlInterceptor.cpp sipQtQmlQQmlApplicationEngine.cpp sipQtQmlQQmlComponent.cpp sipQtQmlQQmlContext.cpp sipQtQmlQQmlEngine.cpp sipQtQmlQQmlError.cpp sipQtQmlQQmlExpression.cpp sipQtQmlQQmlExtensionPlugin.cpp sipQtQmlQQmlFileSelector.cpp sipQtQmlQQmlImageProviderBase.cpp sipQtQmlQQmlImageProviderBaseFlags.cpp sipQtQmlQQmlIncubationController.cpp sipQtQmlQQmlIncubator.cpp sipQtQmlQQmlListProperty0100QObject.cpp sipQtQmlQQmlListReference.cpp sipQtQmlQQmlNetworkAccessManagerFactory.cpp sipQtQmlQQmlParserStatus.cpp sipQtQmlQQmlProperty.cpp sipQtQmlQQmlPropertyMap.cpp sipQtQmlQQmlPropertyValueSource.cpp sipQtQmlQQmlScriptString.cpp ..\qpy\QtQml\qpyqmllistproperty.cpp ..\qpy\QtQml\qpyqmlobject.cpp ..\qpy\QtQml\qpyqmlsingletonobject.cpp ..\qpy\QtQml\qpyqml_listdata.cpp ..\qpy\QtQml\qpyqml_post_init.cpp ..\qpy\QtQml\qpyqml_qjsvalue.cpp ..\qpy\QtQml\qpyqml_register_singleton_type.cpp ..\qpy\QtQml\qpyqml_register_type.cpp
