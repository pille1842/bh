PREFIX=/usr/local

dummy:
	@echo "Type `sudo make install` to install bh on your system."

install:
	install -m755 bh ${PREFIX}/bin/bh
	install -m644 bh.1 ${PREFIX}/share/man/man1/bh.1
	install -m644 bh.info ${PREFIX}/share/info/bh.info
	mandb
	install-info ${PREFIX}/share/info/bh.info ${PREFIX}/share/info/dir
