; Listing – Somme avec 4 accumulateurs (4 dépendances distantes)
mov ebx, array
xorps xmm0, xmm0  ; sum1 = 0.0
xorps xmm1, xmm1  ; sum2 = 0.0
xorps xmm2, xmm2  ; sum3 = 0.0
xorps xmm3, xmm3  ; sum4 = 0.0
xor ecx, ecx      ; i = 0
.for_i:
    cmp ecx, 320000
    jge .endfor_i
    addss xmm0, [ebx+ecx*4+0]
    addss xmm1, [ebx+ecx*4+4]
    addss xmm2, [ebx+ecx*4+8]
    addss xmm3, [ebx+ecx*4+12]
    addss xmm0, [ebx+ecx*4+16]
    addss xmm1, [ebx+ecx*4+20]
    addss xmm2, [ebx+ecx*4+24]
    addss xmm3, [ebx+ecx*4+28]
    add ecx, 8
    jmp .for_i
.endfor_i:
    addss xmm0, xmm1  ; sum1 += sum2
    addss xmm2, xmm3  ; sum3 += sum4
    addss xmm0, xmm2  ; sum1 += sum3