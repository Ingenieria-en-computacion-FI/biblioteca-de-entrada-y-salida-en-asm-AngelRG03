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

    push ebx
    push ecx
    push edx
    push esi

    mov esi, eax          
    mov ecx, eax        
    mov edx, ebx     

    mov eax, 3          
    mov ebx, 0     
    int 0x80             



    mov byte [esi + eax], 0

    pop esi
    pop edx
    pop ecx
    pop ebx

    mov esp, ebp
    pop ebp
    ret
