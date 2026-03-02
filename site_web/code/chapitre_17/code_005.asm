mov ,9 ; longueur = nombre de chiffres
sub ,ecx
xor ,ecx ; i = 0
8.while_eq: ; faire
movzx ,byte[esp+ecx]
cmp ,esi+ecx]
jne
inc ; ++i
sub ,1
jnz ; tantque i < longueur
inc ; valeur de retour = vrai
16.end:
mov ,esp+32]
mov ,esp+36]
mov ,esp+40]
mov ,ebp
pop
ret