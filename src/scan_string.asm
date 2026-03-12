SECTION .text
global scan_string
; ---------------------------------
; scan_string
; Entrada:
;   EAX = buffer destino
;   EBX = tamaño máximo
; ---------------------------------
scan_string:
    push ebp
    mov ebp, esp

    push eax
    push ebx
    push ecx
    push edx

    ; read(fd=0, buffer, tamaño_máximo)
    mov ecx, eax            ; dirección del buffer destino
    mov edx, ebx            ; tamaño máximo
    mov eax, 3              ; syscall read
    mov ebx, 0              ; fd = stdin
    int 0x80

    ; EAX ahora contiene bytes leídos
    ; Agregar terminador nulo al final
    ; La posición del terminador = buffer + bytes_leídos
    pop edx                 ; restaurar para reusar edx
    pop ecx                 ; restaurar ecx
    pop ebx                 ; restaurar ebx (buffer original en stack)
    pop eax                 ; restaurar eax (dirección del buffer)

    ; Recalcular: guardar dirección y longitud antes del ret
    push eax
    push ebx
    push ecx
    push edx

    mov ecx, eax            ; buffer destino
    mov edx, ebx            ; tamaño máximo
    mov eax, 3
    mov ebx, 0
    int 0x80
    ; EAX = bytes leídos
    ; Quitar el '\n' si está al final
    mov ecx, [ebp + 8]      ; buffer destino (primer arg)
    add ecx, eax            ; apuntar al final
    mov byte [ecx], 0       ; terminador nulo

    pop edx
    pop ecx
    pop ebx
    pop eax

    mov esp, ebp
    pop ebp
    ret
