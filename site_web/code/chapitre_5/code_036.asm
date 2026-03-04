; Listing 5.4.5 – Traduction améliorée du for
xor eax, eax   ; sum = 0
mov ecx, 1     ; initialisation : i = 1
mov edx, N
.pre_for:
    cmp ecx, edx   ; test condition
    jg  .endfor    ; ne pas exécuter la boucle si i > N
.for:
    add eax, ecx   ; corps : sum += i
    inc ecx        ; incrémentation : ++i
    cmp ecx, edx   ; test de la condition
    jle .for       ; retour au début de la boucle si vraie
.endfor: