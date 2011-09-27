AS      := /usr/bin/as
CC      := /usr/bin/gcc
LD      := /usr/bin/ld

ASOPTS  := -gstabs
CCOPTS  := -g
#CLIBS   := -lm

all: harness gcd gcd64

harness: harness.s gcd.s
gcd: gcd_main.c gcd.c
gcd64: gcd64_main.c gcd64.c

%: %.c
	$(CC) $(CCOPTS) -o $@ $^ $(CLIBS)

clean:
	rm -f harness gcd gcd64
