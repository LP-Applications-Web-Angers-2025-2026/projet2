push ; entrée dans la fonction
mov ,esp
sub ,4 ; mutations = 0
mov [ebp-4],0 ;
mov ,ebp+20]
test ,eax
jz
push ; sauvegarde des registres
push ; qui seront modifiés mais
push ; doivent être préservés
mov ,ebp+12]
xor ,ecx ; i = 0
16.for:
mov ,ebp+8]
cmp ,ebp+20]
jge
movzx ,byte[edi+ecx]
movzx ,byte[esi+ecx]
mov ,eax ; bl = x[i]
mov ,ebp+16]
or ,edx ; bl = x[i] | y[i]
and ,edx ; al = x[i] & y[i]
setz ; dl = (al == 0) ? 1 : 0
cmovz ,ebx ; al = (al == 0) ? bl : al
add [ebp-4],edx ; mutations += edx
mov [esi+ecx],al ; z[i] = al
add ,1 ; ++i
jmp
34.endfor:
mov ,ebp-4]
pop ; restauration des registres
pop
pop
40.end:
mov ,ebp ; sortie de fonction
pop
ret