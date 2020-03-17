.data

.balign 4
message: .asciz "%d %% %d =%d\n"

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

.global modulo
modulo:
    @ Save Link Register

    LDR R2, addr_lr_bu_2
    STR lr,[R2]

start:
    
    CMP R0,R1
    BLT end

    SUB R0, R0,R1

    B start
end:

    @ Restore Link Register
    
    LDR lr, addr_lr_bu_2
    LDR lr, [lr]
    BX lr

    @ variable to back up Link Register
    addr_lr_bu_2: .word lr_bu_2
