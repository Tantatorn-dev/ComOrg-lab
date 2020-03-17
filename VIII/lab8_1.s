.global main

main:
    mov R0, #0
    mov R1, #1
    b _continue_loop

_loop:
    add R0, R0, R1

_continue_loop:
    cmp R0, #9
    ble _loop

end:
    MOV R7, #1
    SWI 0
