TEMPLATE = lib
CONFIG += warn_on plugin
QT += quick
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = QtQuick.pyd
    target.files = QtQuick.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = QtQuick.so
    target.files = QtQuick.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/QtQuick
sip.files = ..\sip\QtQuick\qquickframebufferobject.sip ..\sip\QtQuick\qquickimageprovider.sip ..\sip\QtQuick\qquickitem.sip ..\sip\QtQuick\qquickitemgrabresult.sip ..\sip\QtQuick\qquickpainteditem.sip ..\sip\QtQuick\qquickrendercontrol.sip ..\sip\QtQuick\qquicktextdocument.sip ..\sip\QtQuick\qquickview.sip ..\sip\QtQuick\qquickwindow.sip ..\sip\QtQuick\qsgabstractrenderer.sip ..\sip\QtQuick\qsgengine.sip ..\sip\QtQuick\qsgflatcolormaterial.sip ..\sip\QtQuick\qsggeometry.sip ..\sip\QtQuick\qsgmaterial.sip ..\sip\QtQuick\qsgnode.sip ..\sip\QtQuick\qsgsimplerectnode.sip ..\sip\QtQuick\qsgsimpletexturenode.sip ..\sip\QtQuick\qsgtexture.sip ..\sip\QtQuick\qsgtexturematerial.sip ..\sip\QtQuick\qsgtextureprovider.sip ..\sip\QtQuick\qsgvertexcolormaterial.sip ..\sip\QtQuick\QtQuickmod.sip
INSTALLS += sip
INCLUDEPATH += .
INCLUDEPATH += C:\Python27\Include
INCLUDEPATH += ..\qpy\QtQuick

win32 {
    QMAKE_POST_LINK = $(COPY_FILE) $(DESTDIR_TARGET) $$PY_MODULE
} else {
    QMAKE_POST_LINK = $(COPY_FILE) $(TARGET) $$PY_MODULE
}
macx {
    QMAKE_LFLAGS += "-undefined dynamic_lookup"
    QMAKE_LFLAGS += "-install_name $$absolute_path($$PY_MODULE, $$target.path)"
}

TARGET = QtQuick
HEADERS = sipAPIQtQuick.h ..\qpy\QtQuick\qpyquickitem.h ..\qpy\QtQuick\qpyquickpainteditem.h ..\qpy\QtQuick\qpyquick_api.h ..\qpy\QtQuick\qpyquick_chimera_helpers.h ..\qpy\QtQuick\qpyquick_register_type.h
SOURCES = sipQtQuickcmodule.cpp sipQtQuickQList0101QQuickItem.cpp sipQtQuickQQuickFramebufferObject.cpp sipQtQuickQQuickFramebufferObjectRenderer.cpp sipQtQuickQQuickImageProvider.cpp sipQtQuickQQuickItem.cpp sipQtQuickQQuickItemFlags.cpp sipQtQuickQQuickItemGrabResult.cpp sipQtQuickQQuickItemItemChangeData.cpp sipQtQuickQQuickItemUpdatePaintNodeData.cpp sipQtQuickQQuickPaintedItem.cpp sipQtQuickQQuickPaintedItemPerformanceHints.cpp sipQtQuickQQuickRenderControl.cpp sipQtQuickQQuickTextDocument.cpp sipQtQuickQQuickTextureFactory.cpp sipQtQuickQQuickView.cpp sipQtQuickQQuickWindow.cpp sipQtQuickQQuickWindowCreateTextureOptions.cpp sipQtQuickQSGAbstractRenderer.cpp sipQtQuickQSGAbstractRendererClearMode.cpp sipQtQuickQSGBasicGeometryNode.cpp sipQtQuickQSGClipNode.cpp sipQtQuickQSGDynamicTexture.cpp sipQtQuickQSGEngine.cpp sipQtQuickQSGEngineCreateTextureOptions.cpp sipQtQuickQSGFlatColorMaterial.cpp sipQtQuickQSGGeometry.cpp sipQtQuickQSGGeometryAttribute.cpp sipQtQuickQSGGeometryAttributeSet.cpp sipQtQuickQSGGeometryColoredPoint2D.cpp sipQtQuickQSGGeometryNode.cpp sipQtQuickQSGGeometryPoint2D.cpp sipQtQuickQSGGeometryTexturedPoint2D.cpp sipQtQuickQSGMaterial.cpp sipQtQuickQSGMaterialFlags.cpp sipQtQuickQSGMaterialShader.cpp sipQtQuickQSGMaterialShaderRenderState.cpp sipQtQuickQSGMaterialShaderRenderStateDirtyStates.cpp sipQtQuickQSGMaterialType.cpp sipQtQuickQSGNode.cpp sipQtQuickQSGNodeDirtyState.cpp sipQtQuickQSGNodeFlags.cpp sipQtQuickQSGOpacityNode.cpp sipQtQuickQSGOpaqueTextureMaterial.cpp sipQtQuickQSGSimpleRectNode.cpp sipQtQuickQSGSimpleTextureNode.cpp sipQtQuickQSGSimpleTextureNodeTextureCoordinatesTransformMode.cpp sipQtQuickQSGTexture.cpp sipQtQuickQSGTextureMaterial.cpp sipQtQuickQSGTextureProvider.cpp sipQtQuickQSGTransformNode.cpp sipQtQuickQSGVertexColorMaterial.cpp ..\qpy\QtQuick\qpyquickitem.cpp ..\qpy\QtQuick\qpyquickpainteditem.cpp ..\qpy\QtQuick\qpyquick_chimera_helpers.cpp ..\qpy\QtQuick\qpyquick_post_init.cpp ..\qpy\QtQuick\qpyquick_register_type.cpp
