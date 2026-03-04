align 16
sse_vect0: dd 0, 1, 1, 2             ; F0, F1, F2, F3
sse_vect1: dd 1, 1, 2, 3             ; F1, F2, F3, F4

fib_sse:
    ; ... Chargements xmm0 et xmm1
    shr eax, 2                       ; n / 4 car de saut de 4 par boucle matérielle !
.while_ur4:                          ; On avance de 4 pas vectoriellement
    paddd xmm0, xmm1
    paddd xmm1, xmm0
    paddd xmm0, xmm1
    paddd xmm1, xmm0
    dec eax
    jnz .while_ur4

    ; Extraire l'élément du reste
    vmovdqu [esp], xmm0
    mov eax, [esp+ecx*4]