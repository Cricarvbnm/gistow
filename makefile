PKGNAME := gistow

DESTDIR ?=
PREFIX ?= /usr/local

REAL_PREFIX = $(DESTDIR)$(PREFIX)

BINDIR = $(REAL_PREFIX)/bin
LICENSEDIR = $(REAL_PREFIX)/share/licenses/$(PKGNAME)

BIN_FILES := gistow gistow-init gistow-install gistow-uninstall
LICENSE_FILES := LICENSE

.DEFAULT_GOAL := help

install:
	@echo "Installing gistow to $(REAL_PREFIX)..."
	@install -Dm755 $(BIN_FILES) --target-directory $(BINDIR)/
	@install -Dm644 $(LICENSE_FILES) --target-directory $(LICENSEDIR)/
	@echo "Installation done"

uninstall:
	@echo "Uninstalling from $(REAL_PREFIX)"
	@for file in $(BIN_FILES); do \
		if [ -f $(BINDIR)/$$file ]; then \
		  rm -v $(BINDIR)/$$file; \
		fi; \
	done
	@[ -d $(LICENSEDIR) ] && rm -r $(LICENSEDIR)
	@echo "Uninstallation done"

help:
	@echo "install/uninstall"
	@echo "-----------------"
	@echo "variables - description (default value)"
	@echo "---------------------------------------"
	@echo "DESTDIR   - root dir ()"
	@echo "PREFIX    - /usr (/usr/local)"
