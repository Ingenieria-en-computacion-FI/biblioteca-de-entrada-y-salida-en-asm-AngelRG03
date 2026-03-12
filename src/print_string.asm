SECTION .text
global print_string
; ---------------------------------
; print_string
; Entrada:
;   EAX = dirección de cadena terminada en 0
; ---------------------------------
print_string:
    push ebp
    mov ebp, esp

    push eax
    push ebx
    push ecx
    push edx

    ; Calcular longitud de la cadena
    mov ecx, eax            ; ECX = puntero al inicio
    mov edx, 0              ; contador de longitud
.count_loop:
    cmp byte [ecx + edx], 0 ; ¿terminador nulo?
    je  .count_done
    inc edx
    jmp .count_loop
.count_done:
    ; EDX = longitud, EAX = dirección

    ; write(fd=1, cadena, longitud)
    mov ebx, 1              ; fd = stdout
    mov ecx, eax            ; dirección de la cadena
    mov eax, 4              ; syscall write
    int 0x80

    pop edx
    pop ecx
    pop ebx
    pop eax

    mov esp, ebp
    pop ebp
    ret
