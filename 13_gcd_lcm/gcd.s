.globl gcd
.align 2
.text
                              @ Arguments arrive in registers r0 and r1
gcd:
   subs    r3, r0, r0         @ Power-of-two counter = 0, carry flag = 1
   orrs    r2, r0, r1         @ Logical-OR r0 and r1, set flags on result
                              @ Carry flag remains set. If r0 and r1 are
                              @ both zero, this loop does nothing and the
                              @ code exits with r0 = 0.
remove_twos_loop:
   movnes  r2, r2, lsr #1     @ Shift r2 right if >0, carry flag = LSB
   addcc   r3, r3, #1         @ If the LSB was 0 then add 1 to the counter
   bcc     remove_twos_loop   @ and loop to try the next bit (terminates)
   movs    r0, r0, lsr r3     @ else divide r0 by 2^r3 and test result
   movnes  r1, r1, lsr r3     @ if r0 > 0 divide r1 by 2^r3 and test result
   beq     finish             @ if either is zero sum inputs and exit
                              @ lsl r3 at finish undoes movs above

                              @ Now the LSB of either r0 or r1 is 1,
                              @ and u and v are considered to be even.
                              @ But starting when we reach the subs below, 
                              @ u > 0; v > 0; r0 = u / 2; r1 = v / 2.
                              @ The LSBs of u and v are tested in the carry
                              @ flag, then memorized by the program state.
check_two_r0:
   movs    r0, r0, lsr #1     @ divide u by 2 by shifting r0 right
   bcc     check_two_r0       @ repeat until u is odd (loop terminates)
check_two_r1:                 @ Loop X:
   movs    r1, r1, lsr #1     @ divide v by 2 by shifting r2 right
   bcc     check_two_r1       @ repeat until v is odd (loop terminates)

                              @ u0 := 2 * r0 + 1, v0 := 2 * r1 + 1
   subs    r1, r1, r0         @ v := v0 - u0, even and possibly zero
   addcc   r0, r0, r1         @ if v0 < u0, u := u + v, i.e. u := u0 + (v0 - u0)
                              @ i.e. u := min(u0, v0), odd since both u0 and v0 were
   rsbcc   r1, r1, #0         @ if v0 < u0, v := 0 - v, i.e. v := |v0 - u0|
   bne     check_two_r1       @ if v > 0, we need to make it odd
                              @ shift bits out of r1 up to the first 1 bit.

                              @ if v = 0, the carry flag is set (from subs)
   adc     r0, r0, r0         @ Restore u; u = 2(r0) + 1
finish:
   orr     r0, r1, r0, lsl r3 @ multiply u by 2^r3 by shifting left
   bx      lr                 @ return to caller with result in r0.
