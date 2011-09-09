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

	ldr	r7, =thousand
	mov	r6, #0				@ use r6 for digit
_thousand_start:
	cmp	r4, r7
	blt	_thousand_end
	
	mov	r5, #4				@ use r5 for width
	add	r7, r7, #thousand
	add	r6, r6, #1
	b	_thousand_start
_thousand_end:
	mov	r0, r6
	mov	r1, r5
	bl	_power
_end:
        ldmfd   sp!, {r4, r5, r6, r7, r8, pc}   @ restore state from stack and leave subroutine
