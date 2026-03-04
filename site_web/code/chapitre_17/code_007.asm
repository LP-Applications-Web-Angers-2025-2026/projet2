xor eax, eax                     ; valeur de retour : false
    vmovdqa xmm1, [esp]              ; counts
    vmovdqu xmm2, [esp+ecx+16]       ; digits (shifté)
    vpcmpeqb xmm1, xmm1, xmm2        ; comparer octet par octet
    vpmovmskb edx, xmm1              ; récupérer le masque issu de la comparaison
    cmp edx, 0xFFFF                  ; s'il est égal à 0xFFFF alors OK
    sete al                          ; dans ce cas mettre eax à true