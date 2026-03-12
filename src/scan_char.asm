SECTION .bss
char_buffer resb 1

SECTION .text
global scan_char
; ---------------------------------
; scan_char
; Salida:
;   AL = caracter leído
; ---------------------------------
scan_char:
    push ebp
    mov ebp, esp

    push ebx
    push ecx
    push edx

    ; read(fd=0, &char_buffer, 1)
    mov eax, 3              ; syscall read
    mov ebx, 0              ; fd = stdin
    mov ecx, char_buffer    ; dirección del buffer
    mov edx, 1              ; 1 byte
    int 0x80

    ; Devolver el caracter leído en AL
    mov al, [char_buffer]

    pop edx
    pop ecx
    pop ebx

    mov esp, ebp
    pop ebp
    ret
