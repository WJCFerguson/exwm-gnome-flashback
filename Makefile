DESTDIR := /
PREFIX  := $(DESTDIR)usr
INSTALL := install

install:
	$(INSTALL) -m 0644 -D files/exwm-gnome-flashback-session.desktop $(PREFIX)/share/xsessions/exwm-gnome-flashback-session.desktop
	$(INSTALL) -m 0644 -D files/exwm-gnome-flashback.desktop $(PREFIX)/share/applications/exwm-gnome-flashback.desktop
	$(INSTALL) -m 0644 -D files/exwm-gnome-flashback.session $(PREFIX)/share/gnome-session/sessions/exwm-gnome-flashback.session
	$(INSTALL) -m 0755 -D files/exwm-gnome-flashback-session $(PREFIX)/bin/exwm-gnome-flashback-session
	$(INSTALL) -m 0755 -D files/exwm-gnome-flashback $(PREFIX)/bin/exwm-gnome-flashback

uninstall:
	rm -f $(PREFIX)/bin/exwm-gnome-flashback \
	      $(PREFIX)/bin/exwm-gnome-flashback-session \
	      $(PREFIX)/share/gnome-session/sessions/exwm-gnome-flashback.session \
	      $(PREFIX)/share/applications/exwm-gnome-flashback.desktop \
	      $(PREFIX)/share/xsessions/exwm-gnome-flashback-session.desktop

.PHONY: install uninstall
