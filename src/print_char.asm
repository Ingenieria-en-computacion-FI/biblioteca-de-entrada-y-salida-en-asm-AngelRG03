SECTION .bss
pc_buf resb 1         
SECTION .text
global print_char
; ---------------------------------
; print_char
; Entrada: AL = carácter a imprimir
; ---------------------------------
print_char:
    push ebp
    mov ebp, esp

    push eax
    push ebx
    push ecx
    push edx

    mov [pc_buf], al       

    mov eax, 4            
    mov ebx, 1              
    mov ecx, pc_buf         ; buffer
    mov edx, 1             
    int 0x80

    pop edx
    pop ecx
    pop ebx
    pop eax

    mov esp, ebp
    pop ebp
    ret
