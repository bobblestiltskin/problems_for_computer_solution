AS      := /usr/bin/as
CC      := /usr/bin/gcc
LD      := /usr/bin/ld

ASOPTS  := -gstabs
CCOPTS  := -g
CLIBS   := -lm

all: harness

harness: harness.s gcd.s

%: %.c
	$(CC) $(CCOPTS) -o $@ $^ $(CLIBS)

clean:
	rm -f harness gcd
