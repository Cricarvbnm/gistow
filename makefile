PREFIX ?= /usr
BINDIR := $(PREFIX)/bin

FILES := gistow gistow-init gistow-install gistow-uninstall 

install:
	install -Dm755 $(FILES) $(DESTDIR)$(BINDIR)/
	install -Dm644 LICENSE "${DESTDIR}${PREFIX}/share/licenses/gistow/LICENSE"

uninstall:
	rm $(DESTDIR)$(BINDIR)/$(FILES)
	rm -r $(DESTDIR)$(PREFIX)/share/licenses/gistow/
