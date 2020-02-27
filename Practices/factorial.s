.data

.balign 4
message_list: .asciz "%d "

.balign 4
message_final_ans: .asciz "=%d\n"

.balign 4
pattern: .asciz "%d"

.balign 4
num: .word 1

.balign 4
lr_bu: .word 0

.balign 4
lr_bu_2: .word 0

.text
 factorial:
    @ Save Link Register

    LDR R2, addr_lr_bu_2
    STR lr,[R2]

    MOV R5,R0
    MOV R6,#1

start:

    CMP R5,#0
    BEQ end

    LDR R0,addr_message_list
    MOV R1, R5
    BL printf

    MUL R6,R6,R5
    SUB R5,R5,#1

    B start

end:

    MOV R0,R6

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
    LDR R1,addr_num
    BL scanf

    @ Pass by values entered to print_vals
    LDR R0, addr_num
    LDR R0, [R0]
    BL factorial

    MOV R1,R0

    LDR R0,addr_message_final_ans
    BL printf

    @ Restore the saved value to link register
    LDR lr, addr_lr_bu

    LDR lr, [lr] @ LR <- Mem[addr_lr_bu]
    BX lr @ Return to main function

@ Define addresses
addr_message_list: .word message_list 

addr_message_final_ans: .word message_final_ans

addr_pattern: .word pattern

addr_num: .word num

addr_lr_bu: .word lr_bu

@ Declare printf and scanf functions to be linked with
.global printf

