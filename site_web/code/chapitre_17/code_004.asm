mov ebx, 10                      ; constante 10 pour division par 10
    mov ecx, 9                       ; i = 9, indice pour tableau digits
    cmp eax, 10                      ; si x < 10 alors aller en .x_lt_10
    jl .x_lt_10

.while_x_ge_10:                      ; tantque x >= 10 faire
    xor edx, edx
    div ebx                          ; u, x = x % 10, x / 10
    inc byte [esp+edx]               ; ++counts[u]
    dec ecx                          ; digits[ --i ] = u
    mov [esp+ecx+16], dl
    cmp eax, 10
    jge .while_x_ge_10               ; fin tantque

.x_lt_10:                            ; si x < 10, pas de division
    cmp eax, 0                       ; si x == 0 alors aller en .next
    jz .next
    inc byte [esp+eax]
    dec ecx                          ; digits[ --i ] = x
    mov [esp+ecx+16], al