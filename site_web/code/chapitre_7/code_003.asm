section .data
    angle: dd 60     ; degrés
    cqv:   dd 180    ; dénominateur

section .text
    ; calcul de pi * 60 / 180 pour avoir la mesure en radians
    fild  dword [angle]         ; st0 = 60
    fild  dword [cqv]           ; st0 = 180, st1 = 60
    fdivp st1, st0  ; st0 = 60.0 / 180.0 = 0.3333..., puis pop
    fldpi                       ; st0 = pi, st1 = 0.3333...
    fmulp st1, st0  ; st0 = pi * 0.3333...
    fsincos          ; st0 = cos(pi/3) = 0.5, st1 = sin(pi/3) = 0.86