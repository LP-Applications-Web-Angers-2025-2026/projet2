; SSE : à 2 opérandes
paddd xmm1, xmm2    ; xmm1 = xmm1 + xmm2
; AVX : à 3 opérandes
vpaddd xmm3, xmm1, xmm2 ; xmm3 = xmm1 + xmm2 (xmm1 préservé)