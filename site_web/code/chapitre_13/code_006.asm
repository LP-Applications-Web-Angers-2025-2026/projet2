saxpy_fma:
    ; ...
    vxorps ymm0, ymm0, ymm0          ; somme nulle
    movss xmm3, [ebp+16]
    shufps xmm3, xmm3, 0
    vinsertf128 ymm3, ymm3, xmm3, 1  ; ymm3 = {a,a,a,a,a,a,a,a}
    ; ...

.for_u8:
    cmp ecx, edx
    jge .endfor_u8

    vmovaps ymm1, [esi+ecx*4]
    vmovaps ymm2, [edi+ecx*4]

    ; ymm2 = (ymm1 * ymm3) + ymm2
    vfmadd231ps ymm2, ymm1, ymm3

    vaddps ymm0, ymm0, ymm2
    vmovaps [edi+ecx*4], ymm2
    add ecx, 8
    jmp .for_u8

.endfor_u8:
    ; Extraction vers FPU