TARGET = sip.exe
OFILES = main.obj transform.obj gencode.obj extracts.obj export.obj heap.obj parser.obj lexer.obj
HFILES = sip.h parser.h

CC = cl
CXX = cl
LINK = link
CPPFLAGS = -DNDEBUG -DUNICODE -DWIN32 -DQT_LARGEFILE_SUPPORT -I.
CFLAGS = -nologo -Zm200 -Zc:wchar_t- -O2 -MD -W0
CXXFLAGS = -nologo -Zm200 -Zc:wchar_t- -O2 -MD -W0
LFLAGS = /NOLOGO /DYNAMICBASE /NXCOMPAT /INCREMENTAL:NO /MANIFEST /MANIFESTFILE:$(TARGET).manifest /SUBSYSTEM:CONSOLE
LIBS = 
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
	mt -nologo -manifest $(TARGET).manifest -outputresource:$(TARGET);1

install: $(TARGET)
	@if not exist C:\Python27 mkdir C:\Python27
	copy /y $(TARGET) C:\Python27\$(TARGET)

clean:
	-del $(TARGET)
	-del main.obj
	-del transform.obj
	-del gencode.obj
	-del extracts.obj
	-del export.obj
	-del heap.obj
	-del parser.obj
	-del lexer.obj
	-del $(TARGET).manifest
