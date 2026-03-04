; Listing 5.4.10 – Dépliage de boucle avec macro instruction
%macro BODY 1
    mov [ebx+ecx*4+%1], eax
%endmacro

section .text
    mov ebx, tab
    mov eax, 1
    xor ecx, ecx
    mov edx, N
    and edx, ~(8-1)
.for_ur8:
    cmp ecx, edx
    jge .endfor_ur8
    BODY 0
    BODY 4
    BODY 8
    BODY 12
    BODY 16
    BODY 20
    BODY 24
    BODY 28
    add ecx, 8
    jmp .for_ur8
.endfor_ur8:
; dernières itérations
.while:
    cmp ecx, N
    ...