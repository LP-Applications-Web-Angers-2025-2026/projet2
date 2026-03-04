.for_u16:
    movdqa xmm0, [esi+ecx]           ; Chargement x
    movdqa xmm2, [edi+ecx]           ; Chargement y

    movdqa xmm1, xmm0                ; xmm1 = x
    pand xmm0, xmm2                  ; xmm0 = x & y
    por xmm1, xmm2                   ; xmm1 = x | y
    movdqa xmm4, xmm0                ; xmm4 = x & y (tampon pour comparer à 0)

    pcmpeqb xmm4, xmm6               ; xmm6 = [0]*16. Fait xmm4 = 0xFF si vide.
    pmovmskb ebp, xmm4               ; Le masque vers ebp
    popcnt ebp, ebp                  ; Compter le nombre de bit à 1 (= mutations !)
    add eax, ebp                     ; Ajout aux mutations totales

    pand xmm1, xmm4                  ; Conserver le OU là où c'était vide
    pandn xmm4, xmm0                 ; Conserver le ET de l'autre côté
    por xmm0, xmm1                   ; xmm0 contient maintenant le Z définitif

    movdqa [ebx+ecx], xmm0           ; z[i:i+15] = xmm0
    add ecx, 16
    dec edx                          ; boucle sur size / 16
    jnz .for_u16