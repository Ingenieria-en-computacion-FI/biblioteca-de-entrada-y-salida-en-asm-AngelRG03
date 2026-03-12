extern print_char
global newline

SECTION .text
; ---------------------------------
; newline
; Imprime un salto de línea '\n'
; Reutiliza print_char
; ---------------------------------
newline:
    push ebp
    mov ebp, esp

    push eax                ; preservar EAX

    mov al, 0x0A            ; '\n' = 10 en ASCII
    call print_char

    pop eax

    mov esp, ebp
    pop ebp
    ret
