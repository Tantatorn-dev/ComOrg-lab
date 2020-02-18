.data
.balign 4 @ Request 4 bytes of space

fifteen: .word 0 @ fifteen = 15

.balign 4

thirty: .word 0

    .text
    .global main

main: 
    LDR R1, addr_fifteen @ R1 <- address_fifteen
    MOV R3, #15
    STR R3, [R1] @ R1 -> Mem[R1]
    LDR R2, addr_thirty @ R2 <- address_thirty
    MOV R3, #30
    STR R3, [R2] @ R2 -> Mem[R2]

    LDR R1, addr_fifteen @ Load address
    LDR R1, [R1] @ R1 <- Mem[R1]
    LDR R2, addr_thirty @ Load address
    LDR R2, [R2] @ R2 <- Mem[R2]
    ADD R0, R1, R2
end:
    MOV R7, #1
    SWI 0

addr_fifteen: .word fifteen
addr_thirty:  .word thirty