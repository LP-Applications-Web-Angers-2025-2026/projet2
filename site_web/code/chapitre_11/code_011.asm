for_j:
    cmp ecx, edx                 ; fin de boucle si j >= dim
    jge endfor_j
    movdqu xmm1, [esi+ecx*4]     ; charge 4 floats b(k, j:j+3)
    movdqu xmm2, [edi+ecx*4]     ; charge 4 floats c(i, j:j+3)
    mulps xmm1, xmm0             ; multiplie b par a(i,k) qui est diffusé dans xmm0
    addps xmm2, xmm1             ; on accumule dans xmm2
    movdqu [edi+ecx*4], xmm2     ; stocke en retour dans C
    add ecx, 4                   ; j += 4
    jmp for_j
endfor_j: