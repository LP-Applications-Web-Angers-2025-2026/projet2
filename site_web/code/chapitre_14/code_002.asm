push ; entrée dans la fonction
mov ,esp
mov ,ebp+20]
test ,eax
jz
push ; sauvegarde des registres
push ; qui seront modifiés mais
push ; doivent être préservés
; chargement des paramètres
mov ,ebp+8]
mov ,ebp+12]
mov ,ebp+16]
xor ,eax ; mutations = 0
xor ,ecx ; i = 0
19.for:
cmp ,ebp+20]
jge
mov ,esi+ecx]
and ,edi+ecx]
jnz ; si dl != 0 alors aller en .endif
mov ,esi+ecx]
or ,edi+ecx]
inc ; ++mutations
28.endif:
mov [ebx+ecx],dl ; z[i] = dl
inc ; ++i
jmp
32.endfor:
pop ; restauration des registres
pop
pop
37.end:
mov ,ebp ; sortie de fonction
pop
ret