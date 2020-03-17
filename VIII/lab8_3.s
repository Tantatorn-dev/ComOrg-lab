.global main
main:
    MOV R1, #0
    MOV R2, #1
    MOV R4, #2
    MOV R5, #3

    STMDB SP!, {R4,R5}

    LDMIA SP!, {R1,R2}
    ADD R0, R1, #0
    ADD R0, R0, R2

end:
    MOV R7, #1
    SWI 0