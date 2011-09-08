# this subroutine returns the passed digit to the passed power
#
# inputs
#   r0 - digit
#   r1 - power (between 2 and 4)
#
# outputs
#   r0 - digit ** power

.equ datum_size,4
.globl _power
.align 2
        .text
_power:
	nop
        stmfd	sp!, {r4, lr}	@ save variables to stack

	subs	r1, r1, #2				@ number of elements must be > 1
	bmi	_end

	mov	r4, r0
	add	r1, r1, #1
_power_loop_start:
	mul	r0, r4, r0
	subs	r1, r1, #1			
	beq	_end
	b	_power_loop_start
_end:
        ldmfd   sp!, {r4, pc}	@ restore state from stack and leave subroutime
