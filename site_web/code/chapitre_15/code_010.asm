mov eax, 0x61616161              ; # ASCII(a) = 0x61
    movd xmm2, eax
    pshufd xmm2, xmm2, 0
    mov eax, 0x65656565              ; # ASCII(e) = 0x65
    movd xmm3, eax
    pshufd xmm3, xmm3, 0
    ; ...