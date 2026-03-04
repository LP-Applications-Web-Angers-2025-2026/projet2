align 32
avx_vect0: dd 0, 1, 1, 2, 3, 5, 8, 13
avx_vect1: dd 1, 2, 3, 5, 8, 13, 21, 34

fib_avx:
    ; ...
    shr ecx, 3                       ; n / 8 !
.while_ur8:
    vpaddd ymm1, ymm1, ymm0          ; ymm1 = ymm1 + ymm0
    vpaddd ymm0, ymm0, ymm1          ; ymm0 = ymm0 + ymm1
    ; ... (x8)
    dec ecx
    jnz .while_ur8