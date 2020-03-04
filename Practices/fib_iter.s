@ exercise 2.19 from Computer Organization And Design ARM edition

.data

.balign 4
message: .asciz "%d"

.balign 4
pattern: .asciz "%d %d %d"

.balign 4
num_a: .word 0

.balign 4
num_b: .word 0

.balign 4
num_n: .word 0

.balign 4
lr_bu: .word 0

.balign 4
lr_bu_2: .word 0

.text
 fib_iter:
    @ Save Link Register
    LDR R3, addr_lr_bu_2
    STR lr,[R3]

start:

    CMP R2, #0
    MOVEQ R0,R1
    BEQ end

    MOV R6,R0    @temp for store R0 value
    ADD R0,R6,R1
    MOV R1,R6
    SUB R2,R2,#1

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

    @ get the number from user
    LDR R0,addr_pattern
    LDR R1,addr_num_a
    LDR R2,addr_num_b
    LDR R3,addr_num_n
    BL scanf

    @ Pass by values entered to print_vals
    LDR R0, addr_num_a
    LDR R0, [R0]
    LDR R1, addr_num_b
    LDR R1, [R1]
    LDR R2, addr_num_n
    LDR R2, [R2]
    BL fib_iter

    MOV R1,R0

    LDR R0,addr_message
    BL printf

    @ Restore the saved value to link register
    LDR lr, addr_lr_bu

    LDR lr, [lr] @ LR <- Mem[addr_lr_bu]
    BX lr @ Return to main function

@ Define addresses
addr_message: .word message 

addr_pattern: .word pattern

addr_num_a: .word num_a

addr_num_b: .word num_b

addr_num_n: .word num_n

addr_lr_bu: .word lr_bu

@ Declare printf and scanf functions to be linked with
.global printf

