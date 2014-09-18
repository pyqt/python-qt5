CONFIG+= release shared rtti no_plugin_manifest qpa
host_build {
    QT_ARCH = x86_64
    QT_TARGET_ARCH = x86_64
} else {
    QT_ARCH = x86_64
}
QT_CONFIG += minimal-config small-config medium-config large-config full-config release shared zlib icu angle png freetype accessibility opengl opengles2 egl openssl-linked audio-backend wmf-backend native-gestures qpa concurrent
#versioning 
QT_VERSION = 5.3.1
QT_MAJOR_VERSION = 5
QT_MINOR_VERSION = 3
QT_PATCH_VERSION = 1
