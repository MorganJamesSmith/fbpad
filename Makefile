CC = cc
CFLAGS = -std=gnu99 -pedantic -Wall -O2 `pkg-config --cflags freetype2`
LDFLAGS = -lutil `pkg-config --libs freetype2`

all: fbpad
.c.o:
	$(CC) -c $(CFLAGS) $<
term.o: vt102.c
fbpad: fbpad.o term.o pad.o draw.o font.o
	$(CC) $(LDFLAGS) -o $@ $^
clean:
	rm -f *.o fbpad
