TARGET = sip.pyd
OFILES = siplib.obj apiversions.obj descriptors.obj qtlib.obj threads.obj objmap.obj voidptr.obj array.obj bool.obj
HFILES = sip.h sipint.h array.h 

CC = cl
CXX = cl
LINK = link
CPPFLAGS = -DNDEBUG -DUNICODE -DWIN32 -DQT_LARGEFILE_SUPPORT -I. -IC:\Python27\include
CFLAGS = -nologo -Zm200 -Zc:wchar_t- -O2 -MD -W0
CXXFLAGS = -nologo -Zm200 -Zc:wchar_t- -O2 -MD -W0
LFLAGS = /NOLOGO /DYNAMICBASE /NXCOMPAT /DLL /MANIFEST /MANIFESTFILE:$(TARGET).manifest /SUBSYSTEM:CONSOLE /INCREMENTAL:NO
LIBS = /LIBPATH:C:\Python27\libs python27.lib
.SUFFIXES: .c .cpp .cc .cxx .C


{.}.cpp{}.obj::
	$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) -Fo @<<
	$<
<<

{.}.cc{}.obj::
	$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) -Fo @<<
	$<
<<

{.}.cxx{}.obj::
	$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) -Fo @<<
	$<
<<

{.}.C{}.obj::
	$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) -Fo @<<
	$<
<<

{.}.c{}.obj::
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -Fo @<<
	$<
<<

all: $(TARGET)

$(OFILES): $(HFILES)

$(TARGET): $(OFILES)
	$(LINK) $(LFLAGS) /OUT:$(TARGET) @<<
	  $(OFILES) $(LIBS)
<<
	mt -nologo -manifest $(TARGET).manifest -outputresource:$(TARGET);2

install: $(TARGET)
	@if not exist C:\Python27\Lib\site-packages mkdir C:\Python27\Lib\site-packages
	copy /y $(TARGET) C:\Python27\Lib\site-packages\$(TARGET)
	@if not exist C:\Python27\include mkdir C:\Python27\include
	copy /y C:\Users\marcus\Downloads\sip-4.16.5\sip-4.16.5\siplib\sip.h C:\Python27\include\sip.h

clean:
	-del $(TARGET)
	-del siplib.obj
	-del apiversions.obj
	-del descriptors.obj
	-del qtlib.obj
	-del threads.obj
	-del objmap.obj
	-del voidptr.obj
	-del array.obj
	-del bool.obj
	-del $(TARGET).manifest
