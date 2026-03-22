.next:
    xor eax, eax                     ; valeur de retour = faux
    lea esi, [esp+ecx+16]
    mov edi, 9                       ; longueur = nombre de chiffres
    sub edi, ecx
    xor ecx, ecx                     ; i = 0

.while_eq:                           ; faire
    movzx edx, byte [esp+ecx]
    cmp dl, [esi+ecx]
    jne .end
    inc ecx                          ; ++i
    sub edi, 1
    jnz .while_eq                    ; tantque i < longueur
    inc eax                          ; valeur de retour = vrai

.end:
    mov ebx, [esp+32]
    mov edi, [esp+36]
    mov esi, [esp+40]
    mov esp, ebp
    pop ebp
    ret