; ... (pand et por calculés dans xmm1 et xmm2)
    pcmpeqb xmm1, xmm0               ; xmm0 est 0. Si le ET est vide, octet à 0xFF
    pmovmskb ebp, xmm1
    popcnt ebp, ebp
    add eax, ebp                     ; Gestion des mutations inchangée
    pblendvb xmm1, xmm2, xmm0        ; z[i:i+15] est calculé en 1 tic matériel !
    ; ...