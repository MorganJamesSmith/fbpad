# fbpad version
VERSION = 1

# paths
PREFIX ?= /usr/local
MANPREFIX = $(PREFIX)/share/man

CC = cc
CFLAGS = -Wall -O2
LDFLAGS =

all: fbpad
%.o: %.c conf.h
	$(CC) -c $(CFLAGS) $<
fbpad: fbpad.o term.o pad.o draw.o font.o isdw.o scrsnap.o
	$(CC) -o $@ $^ $(LDFLAGS)
clean:
	rm -f *.o fbpad
install: fbpad
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f fbpad $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/fbpad
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	sed "s/VERSION/$(VERSION)/g" < fbpad.1 > $(DESTDIR)$(MANPREFIX)/man1/fbpad.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/fbpad.1
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/fbpad
	rm -f $(DESTDIR)$(MANPREFIX)/man1/fbpad.1
