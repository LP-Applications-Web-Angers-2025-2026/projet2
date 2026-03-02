cmp ,0qui prend plus de place en mémoire puisqu’on code l’opérande 0.
test ,eax ; si eax == 0 alors aller en .end
jz ;
test ,1 ; si le bit de poids faible n'est pas
jz ; à 1, alors il s'agit d'un nombre pair
5.3.6