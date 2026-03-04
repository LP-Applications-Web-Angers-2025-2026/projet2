; Listing 6.3.1 – Traduction en 64 bits de la fonction sum
sum:
    test  esi, esi          ; si n == 0 alors sortir
    jle   .L4               ; du sous-programme
    lea   eax, [rsi+1]
    pxor  xmm2, xmm2        ; s = xmm2 = 0
    lea   rax, [rdi+rax*4+4]
.L3:
    movss xmm1, [rdi]
    add   rdi, 4            ; ++tab
    divss xmm1, xmm0        ; xmm1 /= a
    addss xmm2, xmm1        ; s += xmm1
    cmp   rdi, rax          ; si &t[i] < &tab[N] boucler
    jne   .L3
    movaps xmm0, xmm2       ; résultat placé dans xmm0
    ret
.L4:
    pxor  xmm2, xmm2        ; résultat mis à 0
    movaps xmm0, xmm2
    ret