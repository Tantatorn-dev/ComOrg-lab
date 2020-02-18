.data
nums: .byte 1, 2, 3, 4, 5
primes:
    .word 2
    .word 3
    .word 5
    .word 7

.text
.global main
main:
    LDR R3, =nums @ Load the address for the data in R3
    LDR R0, [R3, #2] @ Get the next item in the list
end:
    MOV R7, #1
    SWI 0