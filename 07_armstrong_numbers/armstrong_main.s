.equ ten,10
.equ ten_thousand,10000

.section	.rodata
	.align	2
string:
	.asciz "armstrong number of %d is %d\n"
.text
	.align	2
	.global	main
	.type	main, %function
main:
	ldr	r0, =string	@ store address of start of string to r0
	ldr	r5, =ten
	ldr	r6, =ten_thousand

	mov	r4, r5
_outer_loop:
	cmp	r4, r6
	beq	_end

	mov	r0, r4
	bl	_armstrong

	teq	r0, r4
	bne	_next

	mov	r2, r0
	mov	r1, r4
	ldr	r0, =string	@ store address of start of string to r0
	bl	printf		@ call the c function to display information
_next:
	add	r4, r4, #1
	b	_outer_loop
_end:
	mov	r7, #1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux
