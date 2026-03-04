fonction_1:         ; définition de fonction_1
    push ebp
    mov  ebp, esp
.if:                ; utilisation du label local .if
    mov  esp, ebp
    pop  ebp
    ret

fonction_2:         ; définition d'une autre fonction
    push ebp
    mov  ebp, esp
    call fonction_1
.if:                ; réutilisation du label local .if
    ret