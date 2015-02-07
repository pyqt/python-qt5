TEMPLATE = lib
CONFIG += warn_on plugin
QT += sql widgets
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = QtSql.pyd
    target.files = QtSql.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = QtSql.so
    target.files = QtSql.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/QtSql
sip.files = ..\sip\QtSql\qsql.sip ..\sip\QtSql\qsqldatabase.sip ..\sip\QtSql\qsqldriver.sip ..\sip\QtSql\qsqlerror.sip ..\sip\QtSql\qsqlfield.sip ..\sip\QtSql\qsqlindex.sip ..\sip\QtSql\qsqlquery.sip ..\sip\QtSql\qsqlquerymodel.sip ..\sip\QtSql\qsqlrecord.sip ..\sip\QtSql\qsqlrelationaldelegate.sip ..\sip\QtSql\qsqlrelationaltablemodel.sip ..\sip\QtSql\qsqlresult.sip ..\sip\QtSql\qsqltablemodel.sip ..\sip\QtSql\QtSqlmod.sip
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

TARGET = QtSql
HEADERS = sipAPIQtSql.h
SOURCES = sipQtSqlcmodule.cpp sipQtSqlQSql.cpp sipQtSqlQSqlDatabase.cpp sipQtSqlQSqlDriver.cpp sipQtSqlQSqlDriverCreatorBase.cpp sipQtSqlQSqlError.cpp sipQtSqlQSqlField.cpp sipQtSqlQSqlIndex.cpp sipQtSqlQSqlParamType.cpp sipQtSqlQSqlQuery.cpp sipQtSqlQSqlQueryModel.cpp sipQtSqlQSqlRecord.cpp sipQtSqlQSqlRelation.cpp sipQtSqlQSqlRelationalDelegate.cpp sipQtSqlQSqlRelationalTableModel.cpp sipQtSqlQSqlResult.cpp sipQtSqlQSqlTableModel.cpp sipQtSqlQVector0100QVariant.cpp
