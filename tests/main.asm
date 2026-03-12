%include "../include/io.inc"
global _start

SECTION .bss
str_buf resb 64

SECTION .text
_start:
    ; ── Test 1: scan_int + print_int ──────────────────────────
    call scan_int
    call print_int
    call newline

    ; ── Test 2: print_char (hardcoded 'A') ────────────────────
    mov al, 'A'
    call print_char
    call newline

    ; ── Test 3: scan_string + print_string ────────────────────
    mov eax, str_buf
    mov ebx, 63
    call scan_string
    mov eax, str_buf
    call print_string
    call newline

    ; ── Exit ──────────────────────────────────────────────────
    mov eax, 1
    xor ebx, ebx
    int 0x80
