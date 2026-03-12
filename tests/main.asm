%include "../include/io.inc"
global _start

SECTION .bss
str_buf resb 64

SECTION .text
_start:
    mov eax, str_buf
    mov ebx, 63
    call scan_string

    mov eax, str_buf
    call print_string
    call newline

    ; print_char hardcodeado para test 2
    mov al, 'A'
    call print_char
    call newline

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
