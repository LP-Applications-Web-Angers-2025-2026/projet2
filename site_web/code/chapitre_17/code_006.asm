ad_asm_v2:
    ; ... (identique à ad_asm_v1)
    mov ebx, 0xCCCCCCCD              ; Inv. 0.1 dans ebx
    mov ecx, 9
    cmp eax, 10
    jl .x_lt_10

.while_x_ge_10:
    mov edi, eax                     ; sauvegarde de x dans edi
    mul ebx                          ; edx:eax <- x * Inv
    shr edx, 3                       ; edx <- edx / 8 (éq. x/10)
    lea esi, [edx+edx*4]
    shl esi, 1                       ; esi = 2*5*(x/10) = 10 * (x/10)
    sub edi, esi                     ; calcul du reste u de la division
    dec ecx                          ; --i
    inc byte [esp+edi]               ; ++counts[u]
    mov [esp+ecx+16], dil            ; digits[ i ] = u
    mov eax, edx                     ; eax <- x/10
    cmp eax, 10
    jge .while_x_ge_10