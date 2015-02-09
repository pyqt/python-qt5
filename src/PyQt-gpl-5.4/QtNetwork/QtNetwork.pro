TEMPLATE = lib
CONFIG += warn_on plugin
QT -= gui
QT += network
CONFIG += release
CONFIG -= android_install

win32 {
    PY_MODULE = QtNetwork.pyd
    target.files = QtNetwork.pyd
    LIBS += -LC:\Python27\libs -lpython27
} else {
    PY_MODULE = QtNetwork.so
    target.files = QtNetwork.so
}

target.CONFIG = no_check_exist
target.path = C:\Python27\Lib\site-packages/PyQt5
INSTALLS += target
sip.path = C:\Python27\sip\PyQt5/QtNetwork
sip.files = ..\sip\QtNetwork\qabstractnetworkcache.sip ..\sip\QtNetwork\qabstractsocket.sip ..\sip\QtNetwork\qauthenticator.sip ..\sip\QtNetwork\qdnslookup.sip ..\sip\QtNetwork\qhostaddress.sip ..\sip\QtNetwork\qhostinfo.sip ..\sip\QtNetwork\qhttpmultipart.sip ..\sip\QtNetwork\qlocalserver.sip ..\sip\QtNetwork\qlocalsocket.sip ..\sip\QtNetwork\qnetworkaccessmanager.sip ..\sip\QtNetwork\qnetworkconfigmanager.sip ..\sip\QtNetwork\qnetworkconfiguration.sip ..\sip\QtNetwork\qnetworkcookie.sip ..\sip\QtNetwork\qnetworkcookiejar.sip ..\sip\QtNetwork\qnetworkdiskcache.sip ..\sip\QtNetwork\qnetworkinterface.sip ..\sip\QtNetwork\qnetworkproxy.sip ..\sip\QtNetwork\qnetworkreply.sip ..\sip\QtNetwork\qnetworkrequest.sip ..\sip\QtNetwork\qnetworksession.sip ..\sip\QtNetwork\qpynetwork_qhash.sip ..\sip\QtNetwork\qpynetwork_qmap.sip ..\sip\QtNetwork\qssl.sip ..\sip\QtNetwork\qsslcertificate.sip ..\sip\QtNetwork\qsslcertificateextension.sip ..\sip\QtNetwork\qsslcipher.sip ..\sip\QtNetwork\qsslconfiguration.sip ..\sip\QtNetwork\qsslerror.sip ..\sip\QtNetwork\qsslkey.sip ..\sip\QtNetwork\qsslsocket.sip ..\sip\QtNetwork\qtcpserver.sip ..\sip\QtNetwork\qtcpsocket.sip ..\sip\QtNetwork\QtNetworkmod.sip ..\sip\QtNetwork\qudpsocket.sip
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

TARGET = QtNetwork
HEADERS = sipAPIQtNetwork.h
SOURCES = sipQtNetworkcmodule.cpp sipQtNetworkQAbstractNetworkCache.cpp sipQtNetworkQAbstractSocket.cpp sipQtNetworkQAbstractSocketBindMode.cpp sipQtNetworkQAbstractSocketPauseModes.cpp sipQtNetworkQAuthenticator.cpp sipQtNetworkQDnsDomainNameRecord.cpp sipQtNetworkQDnsHostAddressRecord.cpp sipQtNetworkQDnsLookup.cpp sipQtNetworkQDnsMailExchangeRecord.cpp sipQtNetworkQDnsServiceRecord.cpp sipQtNetworkQDnsTextRecord.cpp sipQtNetworkQHash0100QNetworkRequestAttribute0100QVariant.cpp sipQtNetworkQHostAddress.cpp sipQtNetworkQHostInfo.cpp sipQtNetworkQHttpMultiPart.cpp sipQtNetworkQHttpPart.cpp sipQtNetworkQList0100QDnsDomainNameRecord.cpp sipQtNetworkQList0100QDnsHostAddressRecord.cpp sipQtNetworkQList0100QDnsMailExchangeRecord.cpp sipQtNetworkQList0100QDnsServiceRecord.cpp sipQtNetworkQList0100QDnsTextRecord.cpp sipQtNetworkQList0100QHostAddress.cpp sipQtNetworkQList0100QNetworkAddressEntry.cpp sipQtNetworkQList0100QNetworkConfiguration.cpp sipQtNetworkQList0100QNetworkCookie.cpp sipQtNetworkQList0100QNetworkInterface.cpp sipQtNetworkQList0100QNetworkProxy.cpp sipQtNetworkQList0100QSslCertificate.cpp sipQtNetworkQList0100QSslCertificateExtension.cpp sipQtNetworkQList0100QSslCipher.cpp sipQtNetworkQList0100QSslError.cpp sipQtNetworkQList0600QPair0100QByteArray0100QByteArray.cpp sipQtNetworkQLocalServer.cpp sipQtNetworkQLocalServerSocketOptions.cpp sipQtNetworkQLocalSocket.cpp sipQtNetworkQMultiMap0100QSslAlternativeNameEntryType0100QString.cpp sipQtNetworkQNetworkAccessManager.cpp sipQtNetworkQNetworkAddressEntry.cpp sipQtNetworkQNetworkCacheMetaData.cpp sipQtNetworkQNetworkConfiguration.cpp sipQtNetworkQNetworkConfigurationManager.cpp sipQtNetworkQNetworkConfigurationManagerCapabilities.cpp sipQtNetworkQNetworkConfigurationStateFlags.cpp sipQtNetworkQNetworkCookie.cpp sipQtNetworkQNetworkCookieJar.cpp sipQtNetworkQNetworkDiskCache.cpp sipQtNetworkQNetworkInterface.cpp sipQtNetworkQNetworkInterfaceInterfaceFlags.cpp sipQtNetworkQNetworkProxy.cpp sipQtNetworkQNetworkProxyCapabilities.cpp sipQtNetworkQNetworkProxyFactory.cpp sipQtNetworkQNetworkProxyQuery.cpp sipQtNetworkQNetworkReply.cpp sipQtNetworkQNetworkRequest.cpp sipQtNetworkQNetworkSession.cpp sipQtNetworkQNetworkSessionUsagePolicies.cpp sipQtNetworkQPair0100QHostAddress1800.cpp sipQtNetworkQSsl.cpp sipQtNetworkQSslCertificate.cpp sipQtNetworkQSslCertificateExtension.cpp sipQtNetworkQSslCipher.cpp sipQtNetworkQSslConfiguration.cpp sipQtNetworkQSslError.cpp sipQtNetworkQSslKey.cpp sipQtNetworkQSslSocket.cpp sipQtNetworkQSslSslOptions.cpp sipQtNetworkQTcpServer.cpp sipQtNetworkQTcpSocket.cpp sipQtNetworkQUdpSocket.cpp sipQtNetworkQ_IPV6ADDR.cpp
