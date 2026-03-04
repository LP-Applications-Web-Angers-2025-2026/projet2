movdqa xmm0, [ebx]          ; mémoire (Load)
movdqa [edi+ecx*4], xmm7    ; mémoire (Store)
movdqa xmm0, xmm1           ; deux opérandes SSE