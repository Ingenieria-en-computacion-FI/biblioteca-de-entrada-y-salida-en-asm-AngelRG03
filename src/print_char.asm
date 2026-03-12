SECTION .bss
char_buffer resb 1

SECTION .text
global print_char
; ---------------------------------
; print_char
; Entrada:
;   AL = caracter a imprimir
; ---------------------------------
print_char:
    push ebp
    mov ebp, esp

    ; Guardar registros que usaremos
    push eax
    push ebx
    push ecx
    push edx

    ; Guardar el caracter en memoria
    mov [char_buffer], al

    ; write(fd=1, &char_buffer, 1)
    mov eax, 4              ; syscall write
    mov ebx, 1              ; fd = stdout
    mov ecx, char_buffer    ; dirección del buffer
    mov edx, 1              ; 1 byte
    int 0x80

    pop edx
    pop ecx
    pop ebx
    pop eax

    mov esp, ebp
    pop ebp
    ret
