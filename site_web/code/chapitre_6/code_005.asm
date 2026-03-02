push ; entrée dans le sous-programme
mov ,esp ;
sub ,4 ; création de la variable'r'
push ; sauvegarde de ebx
mov ,ebp+8] 'a'
mov ,ebp+12] 'b'
add ,ebx ; calcul du résultat
mov[ebp-4],eax ; stockage du résultat dans'r'
mov ,ebp-4]
pop ; restauration de ebx
mov ,ebp ; sortie du sous-programme
pop
ret