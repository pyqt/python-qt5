TEMPLATE = lib
CONFIG += warn_on plugin
QT += winextras widgets
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = QtWinExtras.pyd
    target.files = QtWinExtras.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = QtWinExtras.so
    target.files = QtWinExtras.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/QtWinExtras
sip.files = ..\sip\QtWinExtras\QtWinExtrasmod.sip ..\sip\QtWinExtras\qwinfunctions.sip ..\sip\QtWinExtras\qwinjumplist.sip ..\sip\QtWinExtras\qwinjumplistcategory.sip ..\sip\QtWinExtras\qwinjumplistitem.sip ..\sip\QtWinExtras\qwintaskbarbutton.sip ..\sip\QtWinExtras\qwintaskbarprogress.sip ..\sip\QtWinExtras\qwinthumbnailtoolbar.sip ..\sip\QtWinExtras\qwinthumbnailtoolbutton.sip
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

TARGET = QtWinExtras
HEADERS = sipAPIQtWinExtras.h
SOURCES = sipQtWinExtrascmodule.cpp sipQtWinExtrasQList0101QWinJumpListCategory.cpp sipQtWinExtrasQList0101QWinJumpListItem.cpp sipQtWinExtrasQList0101QWinThumbnailToolButton.cpp sipQtWinExtrasQtWin.cpp sipQtWinExtrasQWinJumpList.cpp sipQtWinExtrasQWinJumpListCategory.cpp sipQtWinExtrasQWinJumpListItem.cpp sipQtWinExtrasQWinTaskbarButton.cpp sipQtWinExtrasQWinTaskbarProgress.cpp sipQtWinExtrasQWinThumbnailToolBar.cpp sipQtWinExtrasQWinThumbnailToolButton.cpp
