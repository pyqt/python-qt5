#include <QCoreApplication>
#include <QFile>
#include <QLibraryInfo>
#include <QTextStream>

int main(int argc, char **argv)
{
    QCoreApplication app(argc, argv);
    QFile outf("qtdetail.out");

    if (!outf.open(QIODevice::WriteOnly|QIODevice::Truncate|QIODevice::Text))
        return 1;

    QTextStream out(&outf);

    out << QLibraryInfo::licensee() << '\n';

#if defined(QT_SHARED) || defined(QT_DLL)
    out << "shared\n";
#else
    out << "static\n";
#endif

    // Determine which features should be disabled.

#if defined(QT_NO_ACCESSIBILITY)
    out << "PyQt_Accessibility\n";
#endif

#if defined(QT_NO_SESSIONMANAGER)
    out << "PyQt_SessionManager\n";
#endif

#if defined(QT_NO_SSL)
    out << "PyQt_SSL\n";
#endif

#if defined(QT_NO_PRINTDIALOG)
    out << "PyQt_PrintDialog\n";
#endif

#if defined(QT_NO_PRINTER)
    out << "PyQt_Printer\n";
#endif

#if defined(QT_NO_PRINTPREVIEWDIALOG)
    out << "PyQt_PrintPreviewDialog\n";
#endif

#if defined(QT_NO_PRINTPREVIEWWIDGET)
    out << "PyQt_PrintPreviewWidget\n";
#endif

#if defined(QT_NO_RAWFONT)
    out << "PyQt_RawFont\n";
#endif

#if defined(QT_NO_OPENGL)
    out << "PyQt_OpenGL\n";
    out << "PyQt_Desktop_OpenGL\n";
#elif defined(QT_OPENGL_ES_2)
    out << "PyQt_Desktop_OpenGL\n";
#endif

#if QT_VERSION < 0x050200
// This is the test used in qglobal.h in Qt prior to v5.2.  In v5.2 and later
// qreal is always double.
#if defined(QT_NO_FPU) || defined(Q_PROCESSOR_ARM) || defined(Q_OS_WINCE)
    out << "PyQt_qreal_double\n";
#endif
#endif

    return 0;
}
