for_u16:
    movdqa xmm0, [esi+ecx]
    pshufd xmm1, xmm0, 0x01      ; extrait le 2nd mot dans xmm1
    pshufd xmm2, xmm0, 0x02      ; extrait le 3ième mot dans xmm2
    pshufd xmm3, xmm0, 0x03      ; extrait le 4ième mot dans xmm3

    movd edi, xmm0               ; compte les bits dans eax/edi/ebx...
    popcnt edi, edi 
    add eax, edi
    ; etc...