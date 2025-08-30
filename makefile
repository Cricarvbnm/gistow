PREFIX ?= /usr
BINDIR := $(PREFIX)/bin

FILES := gistow gistow-init gistow-install gistow-uninstall 

install:
	install -Dm755 $(FILES) $(BINDIR)/

uninstall:
	rm $(BINDIR)/$(FILES)
