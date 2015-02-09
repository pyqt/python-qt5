TEMPLATE = lib
CONFIG += warn_on plugin
QT += help
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = QtHelp.pyd
    target.files = QtHelp.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = QtHelp.so
    target.files = QtHelp.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/QtHelp
sip.files = ..\sip\QtHelp\qhelpcontentwidget.sip ..\sip\QtHelp\qhelpengine.sip ..\sip\QtHelp\qhelpenginecore.sip ..\sip\QtHelp\qhelpindexwidget.sip ..\sip\QtHelp\qhelpsearchengine.sip ..\sip\QtHelp\qhelpsearchquerywidget.sip ..\sip\QtHelp\qhelpsearchresultwidget.sip ..\sip\QtHelp\QtHelpmod.sip
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

TARGET = QtHelp
HEADERS = sipAPIQtHelp.h
SOURCES = sipQtHelpcmodule.cpp sipQtHelpQHelpContentItem.cpp sipQtHelpQHelpContentModel.cpp sipQtHelpQHelpContentWidget.cpp sipQtHelpQHelpEngine.cpp sipQtHelpQHelpEngineCore.cpp sipQtHelpQHelpIndexModel.cpp sipQtHelpQHelpIndexWidget.cpp sipQtHelpQHelpSearchEngine.cpp sipQtHelpQHelpSearchQuery.cpp sipQtHelpQHelpSearchQueryWidget.cpp sipQtHelpQHelpSearchResultWidget.cpp sipQtHelpQList0100QHelpSearchQuery.cpp sipQtHelpQList0100QStringList.cpp sipQtHelpQMap0100QString0100QUrl.cpp
