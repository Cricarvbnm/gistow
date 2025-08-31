PKGNAME := gistow

DESTDIR ?=
PREFIX ?= /usr/local

REAL_PREFIX = $(DESTDIR)$(PREFIX)

BINDIR = $(REAL_PREFIX)/bin
LICENSEDIR = $(REAL_PREFIX)/share/licenses/$(PKGNAME)
ZSH_COMP_DIR = $(REAL_PREFIX)/share/zsh/site-functions

BIN_FILES := gistow gistow-init gistow-install gistow-uninstall
LICENSE_FILES := LICENSE
ZSH_COMP_FILES := completions/zsh/_gistow

.DEFAULT_GOAL := help

install:
	@echo "Installing gistow to $(REAL_PREFIX) ..."
	@install -Dm755 $(BIN_FILES) --target-directory $(BINDIR)/
	@install -Dm644 $(LICENSE_FILES) --target-directory $(LICENSEDIR)/
	@install -Dm644 $(ZSH_COMP_FILES) --target-directory $(ZSH_COMP_DIR)/
	@echo "Installation done"

uninstall:
	@echo "Uninstalling from $(REAL_PREFIX) ..."
	@for file in $(BIN_FILES); do \
		if [ -f $(BINDIR)/$$file ]; then \
		  rm -v $(BINDIR)/$$file; \
		fi; \
	done
	@for file in $(ZSH_COMP_FILES); do \
		if [ -f $(ZSH_COMP_DIR)/$$(basename $$file) ]; then \
		  rm -v $(ZSH_COMP_DIR)/$$(basename $$file); \
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
