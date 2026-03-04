; Listing 6.3.2 – Traduction en 64 bits de la fonction sum - version améliorée
sum:
    xorps xmm2, xmm2        ; s = 0
    test  esi, esi           ; si n <= 0 alors sortir
    jle   .end
    lea   rax, [rdi+rsi*4]  ; rax = adresse de fin du tableau
.while:
    movss xmm1, [rdi]
    add   rdi, 4             ; ++tab
    divss xmm1, xmm0         ; xmm1 /= a
    addss xmm2, xmm1         ; s += tab[i] / a
    cmp   rdi, rax            ; si &t[i] < &tab[N] boucler
    jne   .while
.end:
    movaps xmm0, xmm2         ; résultat placé dans xmm0
    ret