section .data
    a dd 1.0, 2.0, 3.0, 4.0
    b dd 5.0, 6.0, 7.0, 8.0

section .text
    movups xmm1, [a]            ; [4.0, 3.0, 2.0, 1.0]
    movups xmm2, [b]            ; [8.0, 7.0, 6.0, 5.0]
    insertps xmm1, xmm2, 10_11_0011b 
    ; Sélection (10b = index 2 de xmm2 = 7.0)
    ; Insertion (11b = index 3 de xmm1)
    ; Mise à 0 (0011b = index 0 et 1 de xmm1 mis à 0)
    ; Résultat xmm1 = [7.0, 3.0, 0.0, 0.0]