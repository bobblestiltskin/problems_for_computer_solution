AS      := /usr/bin/as
CC      := /usr/bin/gcc
LD      := /usr/bin/ld

ASOPTS  := -gstabs
CCOPTS  := 

#harness: harness.s armstrong.s
harness: harness.s power.s

armstrong: armstrong_main.s armstrong.s power.s

carmstrong: armstrong.c
	$(CC) -o $@ $^ -lm

clean:
	rm -f armstrong carmstrong

%: %.s
	$(CC) $(ASOPTS) -o $@ $^
