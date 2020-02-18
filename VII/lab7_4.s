.data
.balign 4
question: .asciz "What is your favorite number?"

.balign 4
message: .asciz "%d is a great number \n"

.balign 4
pattern: .asciz "%d"

.balign 4
number: .word 0

.balign 4
lr_bu: .word 0

.text
@ Used by the compiler to tell libc where main is located
.global main
.func main
main:
    @ Keep the value inside Link Register
    LDR R1, addr_lr_bu
    STR lr, [R1]
    @ Mem[R1] <- LR
    @ Load and print question
    LDR R0, addr_question
    BL printf
    @ Define pattern for scanf and where to store it
    LDR R0, addr_pattern
    LDR R1, addr_number
    BL scanf
    @ Display the message together with number
    LDR R0, addr_message
    LDR R1, addr_number
    LDR R1, [R1]
    BL printf
    @ Restore the saved value to link register
    LDR lr, addr_lr_bu

    LDR lr, [lr] @ LR <- Mem[addr_lr_bu]
    BX lr @ Return to main function

@ Define addresses
addr_question: .word question
addr_message: .word message
addr_pattern: .word pattern
addr_number: .word number
addr_lr_bu: .word lr_bu
@ Declare printf and scanf functions to be linked with
.global printf
.global scanf

