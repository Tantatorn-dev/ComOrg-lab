.data

.balign 4
message: .asciz "%d\n"

.balign 4
pattern: .asciz "%d %d"

.balign 4
num1: .word 0

.balign 4
num2: .word 0

.balign 4
ans: .word 0

.balign 4
lr_bu: .word 0

.balign 4
lr_bu_2: .word 0

.global gcd
 gcd:
    @ Save Link Register

    LDR R2, addr_lr_bu_2
    STR lr,[R2]


    CMP R0,R1
    SUBGT  R0, R0, R1
    SUBLT R1, R1, R0
    BNE gcd

end:

    @ Restore Link Register
    LDR lr, addr_lr_bu_2
    LDR lr, [lr]
    BX lr

    @ variable to back up Link Register
    addr_lr_bu_2: .word lr_bu_2
