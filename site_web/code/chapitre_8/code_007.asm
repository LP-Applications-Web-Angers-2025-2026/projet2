section .data
    v: dd 12.0, 14.0, 16.0, 20.0

section .text
    movups xmm0, [v]
    cvtss2si eax, xmm0     ; eax contiendra l'entier 12