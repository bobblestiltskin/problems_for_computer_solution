# inputs
#   r0 - number
#
# outputs
#   r0 - armstrong number
#
# local r4, r5, r6, r7, r8

.equ ten,10
.equ hundred,100
.equ thousand,1000
.equ ten_thousand,10000

.globl _armstrong
.align 2
        .text
_armstrong:
        nop
        stmfd   sp!, {r4, r5, r6, r7, r8, lr}   @ save variables to stack

        mov     r4, r0				@ use r4 for n
	cmp	r4, #ten
	blt	_end

        ldr     r8, =ten_thousand
	cmp	r4, r8
	bge	_end

	mov	r5, #0				@ use r5 for width
	mov	r6, #0				@ use r6 for digit
	ldr	r7, =thousand
	mov	r8, #0				@ use r8 for armstrong
_thousand_start:
	cmp	r4, r7
	blt	_thousand_end
	
	mov	r5, #4				
	add	r7, r7, #thousand
	add	r6, r6, #1
	b	_thousand_start
_thousand_end:
	add	r4, r4, #thousand
	sub	r4, r4, r7
	mov	r0, r6
	mov	r1, r5
	bl	_power
	add	r8, r0, r8

	ldr	r7, =hundred
	mov	r6, #0				@ use r6 for digit
_hundred_start:
	cmp	r4, r7
	blt	_hundred_end
	
	teq	r5, #0
	moveq	r5, #3
_hundred_width:
	add	r7, r7, #hundred
	add	r6, r6, #1
	b	_hundred_start
_hundred_end:
	add	r4, r4, #hundred
	sub	r4, r4, r7
	mov	r0, r6
	mov	r1, r5
	bl	_power
	add	r8, r0, r8

	ldr	r7, =ten
	mov	r6, #0				@ use r6 for digit
_ten_start:
	cmp	r4, r7
	blt	_ten_end
	
	teq	r5, #0
	moveq	r5, #3
_ten_width:
	add	r7, r7, #ten
	add	r6, r6, #1
	b	_ten_start
_ten_end:
	add	r4, r4, #ten
	sub	r4, r4, r7
	mov	r0, r6
	mov	r1, r5
	bl	_power
	add	r8, r0, r8

	mov	r0, r4
	mov	r1, r5
	bl	_power
	add	r8, r0, r8

	mov	r0, r8
_end:
        ldmfd   sp!, {r4, r5, r6, r7, r8, pc}   @ restore state from stack and leave subroutine
