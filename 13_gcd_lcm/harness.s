.globl main
        .align 2
        .text
main:
	mov	r0, #14
	mov	r1, #21
	bl	gcd

	mov     r7, #1		@ set r7 to 1 - the syscall for exit
	swi     0		@ then invoke the syscall from linux
