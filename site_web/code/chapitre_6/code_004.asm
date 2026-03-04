; Listing 6.2.1 – Appelant en 32 bits
main:
    mov  eax, 5       ; place dans un registre le second paramètre
    push eax          ; place dans la pile le second paramètre
    push dword 4      ; place le premier paramètre
    call sum          ; appel du sous-programme
    add  esp, 8       ; supprime les paramètres
    ret