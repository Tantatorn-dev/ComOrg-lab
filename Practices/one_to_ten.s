.data

.balign 4
message: .asciz "%d\n"

.balign 4
num: .word 1

.balign 4
lr_bu: .word 0

.balign 4
lr_bu_2: .word 0

.text
 print_vals:
    @ Save Link Register

    LDR R2, addr_lr_bu_2
    STR lr,[R2]

    MOV R5,R0

start:

    LDR R0,addr_message
    MOV R1, R5
    BL printf

    @increment R1 value
    ADD R5,R5,#1

    CMP R5,#11
    BEQ end

    B start

end:

    @ Restore Link Register
    LDR lr, addr_lr_bu_2
    LDR lr, [lr]
    BX lr

    @ variable to back up Link Register
    addr_lr_bu_2: .word lr_bu_2

@ Used by the compiler to tell libc where main is located
.global main
.func main
main:
    @ Keep the value inside Link Register
    LDR R1, addr_lr_bu
    STR lr, [R1]
    @ Mem[R1] <- LR


    @ Pass by values entered to print_vals
    LDR R0, addr_num
    LDR R0, [R0]

    BL print_vals

    @ Restore the saved value to link register
    LDR lr, addr_lr_bu

    LDR lr, [lr] @ LR <- Mem[addr_lr_bu]
    BX lr @ Return to main function

@ Define addresses
addr_message: .word message

addr_num: .word num

addr_lr_bu: .word lr_bu

@ Declare printf and scanf functions to be linked with
.global printf

