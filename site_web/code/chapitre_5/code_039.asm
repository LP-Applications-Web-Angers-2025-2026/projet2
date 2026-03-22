; Listing 5.4.9 – Dépliage de boucle
section .data
    N   EQU 1003
    tab: times N dd 0
section .text
    mov ebx, tab
    mov eax, 1
    xor ecx, ecx
    mov edx, N
    and edx, ~(8-1)      ; multiple de 8 le plus proche de N
.for_ur8:
    cmp ecx, edx
    jge .endfor_ur8
    mov [ebx+ecx*4+0],  eax
    mov [ebx+ecx*4+4],  eax
    mov [ebx+ecx*4+8],  eax
    mov [ebx+ecx*4+12], eax
    mov [ebx+ecx*4+16], eax
    mov [ebx+ecx*4+20], eax
    mov [ebx+ecx*4+24], eax
    mov [ebx+ecx*4+28], eax
    add ecx, 8
    jmp .for_ur8
.endfor_ur8:
.while:
    cmp ecx, N  ; dernières itérations
    ...