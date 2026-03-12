extern print_char
global newline

SECTION .text


; newline

newline:
    push ebp
    mov ebp, esp

    push eax

    mov al, 0x0A            ; '\n'
    call print_char

    pop eax

    mov esp, ebp
    pop ebp
    ret
    ret
