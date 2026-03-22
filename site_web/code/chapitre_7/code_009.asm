section .data
    trois: dd 3.0   ; constante non prédéfinie → stockée en mémoire

section .text
    ; x + 1
    fld  dword [x]
    fld1
    faddp st1, st0      ; st0 = x + 1.0

    ; x - 1
    fld  dword [x]
    fld1
    fsubp st1, st0      ; st0 = x - 1.0, st1 = x + 1.0

    ; (x+1)*(x-1)
    fmulp st1, st0      ; st0 = (x+1)*(x-1)

    ; 3 - sqrt(x)
    fld  dword [trois]
    fld  dword [x]
    fsqrt               ; st0 = sqrt(x), st1 = 3.0, st2 = (x+1)*(x-1)
    fsubp st1, st0      ; st0 = 3.0 - sqrt(x)

    ; (x+1)*(x-1) / (3 - sqrt(x))
    fdivp st1, st0      ; st0 = résultat final