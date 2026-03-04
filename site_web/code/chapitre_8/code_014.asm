vxorps ymm0, ymm0, ymm0        ; Registre nul (0.0) [Dans ymm0 - 256 bits]
    vmovups ymm1, [rdi]            ; Charge 8 floats depuis x
    vcmpps k1, ymm1, ymm0, 5       ; Compare 8 floats : Si ymm1[i] > 0.0, k1.bit[i] = 1 (pseudo-op 5 = Not_Less_Than_Or_Equal)
    vcompressps ymm2 {k1}, ymm1    ; Magie : Tasse les floats validés par le masque k1 de ymm1 et les plaque consécutivement en ymm2
    vmovups [rsi], ymm2            ; Envoie dans le vecteur final
    kmovq rax, k1
    popcnt rax, rax                ; Compte les bits : rax = count ++
    vzeroupper
    ret