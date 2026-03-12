SECTION .bss
sc_buf resb 1        
SECTION .text
global scan_char
; ---------------------------------
; scan_char
; Salida: AL = carácter leído
; ---------------------------------
scan_char:
    push ebp
    mov ebp, esp

    push ebx
    push ecx
    push edx

    mov eax, 3              ; sys_read
    mov ebx, 0              ; fd = stdin
    mov ecx, sc_buf         ; buffer
    mov edx, 1              ; 1 byte
    int 0x80

    mov al, [sc_buf]        

    pop edx
    pop ecx
    pop ebx

    mov esp, ebp
    pop ebp
    ret
