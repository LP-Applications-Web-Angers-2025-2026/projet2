push
mov ,esp
sub ,8 ; réserve l'espace pour i et k
; i est en [ebp-4]
; k est en [ebp-8]
push ; sauvegarde des registres
push
push
xor ,eax ; i = 0
mov [ebp-4],eax ;
11.7. VERSION SSE DE L’INVERSION DE LA BOUCLE J, K 309