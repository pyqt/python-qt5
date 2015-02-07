
all:
	cd sipgen
	$(MAKE)
	@cd ..
	cd siplib
	$(MAKE)
	@cd ..

install:
	cd sipgen
	$(MAKE) install
	@cd ..
	cd siplib
	$(MAKE) install
	@cd ..
	@if not exist C:\Python27\Lib\site-packages mkdir C:\Python27\Lib\site-packages
	copy /y sipconfig.py C:\Python27\Lib\site-packages\sipconfig.py
	copy /y C:\Users\marcus\Downloads\sip-4.16.5\sip-4.16.5\sipdistutils.py C:\Python27\Lib\site-packages\sipdistutils.py

clean:
	cd sipgen
	$(MAKE) clean
	@cd ..
	cd siplib
	$(MAKE) clean
	@cd ..
