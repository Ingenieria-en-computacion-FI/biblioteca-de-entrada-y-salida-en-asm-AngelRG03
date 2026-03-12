SECTION .text
global print_string
; ---------------------------------
; print_string
; Entrada: EAX = dirección de cadena terminada en 0
; ---------------------------------
print_string:
    push ebp
    mov ebp, esp

    push ebx
    push ecx
    push edx
    push esi

    mov esi, eax          

    ; calcular longitud
    mov edx, 0
.len_loop:
    cmp byte [esi + edx], 0
    je  .len_done
    inc edx
    jmp .len_loop
.len_done:
    ; EDX = longitud, ESI = dirección

    mov eax, 4         
    mov ebx, 1           
    mov ecx, esi           
    ; edx ya tiene la longitud
    int 0x80

    pop esi
    pop edx
    pop ecx
    pop ebx

    mov esp, ebp
    pop ebp
    ret
