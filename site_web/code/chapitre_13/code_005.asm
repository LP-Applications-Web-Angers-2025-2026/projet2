saxpy_sse:
    ; ...
    xorps xmm0, xmm0                 ; sum = {0.0, 0.0, 0.0, 0.0}
    movss xmm3, [ebp+16]
    shufps xmm3, xmm3, 0             ; xmm3 = {a, a, a, a}

    xor ecx, ecx                     ; i = 0
    mov edx, [ebp+20]                ; edx = size
    and edx, ~3                      ; le plus grand multiple de 4 <= size

.for_u4:
    cmp ecx, edx
    jge .endfor_u4

    movaps xmm1, [esi+ecx*4]         ; xmm1 = X
    movaps xmm2, [edi+ecx*4]         ; xmm2 = Y
    mulps xmm1, xmm3                 ; xmm1 = a * X
    addps xmm2, xmm1                 ; xmm2 = a * X + Y
    addps xmm0, xmm2                 ; xmm0 = sum += xmm2
    movaps [edi+ecx*4], xmm2         ; Y = xmm2

    add ecx, 4
    jmp .for_u4
.endfor_u4:

    ; Réduction de xmm0 par la FPU dans st0 afin de retourner la somme 
    haddps xmm0, xmm0
    haddps xmm0, xmm0
    sub esp, 4
    movss [esp], xmm0 
    fadd dword [esp]
    add esp, 4
    ; + Gestion de la fin de tableau reliquat non-multiple de 4 ...
    ret