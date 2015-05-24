TEMPLATE = lib
CONFIG += warn_on plugin
QT += designer
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = QtDesigner.pyd
    target.files = QtDesigner.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = QtDesigner.so
    target.files = QtDesigner.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/QtDesigner
sip.files = ..\sip\QtDesigner\abstractactioneditor.sip ..\sip\QtDesigner\abstractformbuilder.sip ..\sip\QtDesigner\abstractformeditor.sip ..\sip\QtDesigner\abstractformwindow.sip ..\sip\QtDesigner\abstractformwindowcursor.sip ..\sip\QtDesigner\abstractformwindowmanager.sip ..\sip\QtDesigner\abstractobjectinspector.sip ..\sip\QtDesigner\abstractpropertyeditor.sip ..\sip\QtDesigner\abstractwidgetbox.sip ..\sip\QtDesigner\container.sip ..\sip\QtDesigner\customwidget.sip ..\sip\QtDesigner\default_extensionfactory.sip ..\sip\QtDesigner\extension.sip ..\sip\QtDesigner\formbuilder.sip ..\sip\QtDesigner\membersheet.sip ..\sip\QtDesigner\propertysheet.sip ..\sip\QtDesigner\qextensionmanager.sip ..\sip\QtDesigner\qpydesignercontainerextension.sip ..\sip\QtDesigner\qpydesignercustomwidgetcollectionplugin.sip ..\sip\QtDesigner\qpydesignercustomwidgetplugin.sip ..\sip\QtDesigner\qpydesignermembersheetextension.sip ..\sip\QtDesigner\qpydesignerpropertysheetextension.sip ..\sip\QtDesigner\qpydesignertaskmenuextension.sip ..\sip\QtDesigner\QtDesignermod.sip ..\sip\QtDesigner\taskmenu.sip
INSTALLS += sip
INCLUDEPATH += .
INCLUDEPATH += C:\Python27\Include
INCLUDEPATH += ..\qpy\QtDesigner

win32 {
    QMAKE_POST_LINK = $(COPY_FILE) $(DESTDIR_TARGET) $$PY_MODULE
} else {
    QMAKE_POST_LINK = $(COPY_FILE) $(TARGET) $$PY_MODULE
}
macx {
    QMAKE_LFLAGS += "-undefined dynamic_lookup"
    QMAKE_LFLAGS += "-install_name $$absolute_path($$PY_MODULE, $$target.path)"
}

TARGET = QtDesigner
HEADERS = sipAPIQtDesigner.h ..\qpy\QtDesigner\qpydesignercontainerextension.h ..\qpy\QtDesigner\qpydesignercustomwidgetcollectionplugin.h ..\qpy\QtDesigner\qpydesignercustomwidgetplugin.h ..\qpy\QtDesigner\qpydesignermembersheetextension.h ..\qpy\QtDesigner\qpydesignerpropertysheetextension.h ..\qpy\QtDesigner\qpydesignertaskmenuextension.h
SOURCES = sipQtDesignercmodule.cpp sipQtDesignerQAbstractExtensionFactory.cpp sipQtDesignerQAbstractExtensionManager.cpp sipQtDesignerQAbstractFormBuilder.cpp sipQtDesignerQDesignerActionEditorInterface.cpp sipQtDesignerQDesignerContainerExtension.cpp sipQtDesignerQDesignerCustomWidgetCollectionInterface.cpp sipQtDesignerQDesignerCustomWidgetInterface.cpp sipQtDesignerQDesignerFormEditorInterface.cpp sipQtDesignerQDesignerFormWindowCursorInterface.cpp sipQtDesignerQDesignerFormWindowInterface.cpp sipQtDesignerQDesignerFormWindowInterfaceFeature.cpp sipQtDesignerQDesignerFormWindowManagerInterface.cpp sipQtDesignerQDesignerMemberSheetExtension.cpp sipQtDesignerQDesignerObjectInspectorInterface.cpp sipQtDesignerQDesignerPropertyEditorInterface.cpp sipQtDesignerQDesignerPropertySheetExtension.cpp sipQtDesignerQDesignerTaskMenuExtension.cpp sipQtDesignerQDesignerWidgetBoxInterface.cpp sipQtDesignerQExtensionFactory.cpp sipQtDesignerQExtensionManager.cpp sipQtDesignerQFormBuilder.cpp sipQtDesignerQList0101QDesignerCustomWidgetInterface.cpp sipQtDesignerQPyDesignerContainerExtension.cpp sipQtDesignerQPyDesignerCustomWidgetCollectionPlugin.cpp sipQtDesignerQPyDesignerCustomWidgetPlugin.cpp sipQtDesignerQPyDesignerMemberSheetExtension.cpp sipQtDesignerQPyDesignerPropertySheetExtension.cpp sipQtDesignerQPyDesignerTaskMenuExtension.cpp
