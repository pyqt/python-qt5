QT_BUILD_PARTS += libs tools
QT_QCONFIG_PATH = 

host_build {
    QT_CPU_FEATURES.x86_64 =  sse sse2
} else {
    QT_CPU_FEATURES.x86_64 =  sse sse2
}
QT_COORD_TYPE += double
#Qt for Windows CE c-runtime deployment
QT_CE_C_RUNTIME = no
CONFIG += pcre release compile_examples sse2 sse3 ssse3 sse4_1 sse4_2 avx largefile
QMAKE_QT_VERSION_OVERRIDE = 5
LIBS           += -LC:/OpenSSL/lib
INCLUDEPATH    += C:/OpenSSL/include
OPENSSL_LIBS    = -lssleay32 -llibeay32
sql-plugins    += sqlite
styles         += windows fusion windowsxp windowsvista
