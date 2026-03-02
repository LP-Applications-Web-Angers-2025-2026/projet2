push
mov ,esp
4.if: ; utilisation du label local if
mov ,ebp
pop
ret
9fonction_2: ; définition d'une autre fonction
push
mov ,ebp
call
13.if: ; réutilisation du label local if
ret