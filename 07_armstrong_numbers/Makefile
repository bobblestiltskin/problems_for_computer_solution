AS      := /usr/bin/as
CC      := /usr/bin/gcc
LD      := /usr/bin/ld

ASOPTS  := -gstabs
CCOPTS  := 
CLIBS   := -lm

all: armstrong armstrong_string armstrong_divide

harness: harness.s armstrong_macro.s power.s

armstrong_macro: armstrong_main.s armstrong_macro.s power.s
armstrong: armstrong_main.s armstrong.s power.s

%: %.c
	$(CC) $(CCOPTS) -o $@ $^ $(CLIBS)

clean:
	rm -f armstrong armstrong_macro armstrong_string armstrong_divide harness
