mov ,1 ; initialisation : i = 1
mov ,N
4.pre_for:
cmp ,edx ; test condition
jg ; ne pas executer la boucle si i >= n
8.for:
add ,ecx ; corps : sum += i
inc ; incrémentation : ++i
cmp ,edx ; test de la condition
jle ; retour au début de la boucle si vraie
14.endfor: