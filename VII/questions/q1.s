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

.text
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

@ Used by the compiler to tell libc where main is located
.global main
.func main
main:
    @ Keep the value inside Link Register
    LDR R1, addr_lr_bu
    STR lr, [R1]
    @ Mem[R1] <- LR

    @ Define pattern for scanf and where to store it
    LDR R0, addr_pattern
    LDR R1, addr_num1
    LDR R2, addr_num2
    BL scanf

    @ Pass by values entered to sum_vals
    LDR R0, addr_num1
    LDR R0, [R0]

    @ R0 <- Mem[addr_num_1]
    LDR R1, addr_num2
    LDR R1, [R1]

    BL modulo

    MOV R3,R0

    @ Display the message together with number
    LDR R0, addr_message
    LDR R1, addr_num1
    LDR R2, addr_num2
    LDR R1, [R1]
    LDR R2, [R2]

    BL printf
    @ Restore the saved value to link register
    LDR lr, addr_lr_bu

    LDR lr, [lr] @ LR <- Mem[addr_lr_bu]
    BX lr @ Return to main function

@ Define addresses
addr_message: .word message
addr_pattern: .word pattern

addr_num1: .word num1
addr_num2: .word num2
addr_ans: .word ans

addr_lr_bu: .word lr_bu

@ Declare printf and scanf functions to be linked with
.global printf
.global scanf

