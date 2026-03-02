mov ,esp+16]
test ,eax
jz
xor ,eax ; mutations = 0
push ; sauvegarde des registres
push
push
push
; chargement des paramètres
mov ,esp+20]
mov ,esp+24]
mov ,esp+28]
xor ,ecx ; i = 0
17.for:
movzx ,byte[esi+ecx]
movzx ,byte[edi+ecx]
mov ,ebx ; edi = x[i]
or ,edx ; edi = x[i] | y[i]
and ,edx ; ebx = x[i] & y[i]
sete ; dl = (ebx == 0) ? 1 : 0
cmovz ,edi ; ebx = (ebx == 0) ? edi : ebx
add ,edx ; mutations += edx
mov [ebp+ecx],bl ; z[i] = bl
mov ,esp+24]
add ,1 ; ++i
cmp ,esp+32]
jl
pop ; restauration des registres
pop
pop
pop
38.end: ; sortie de fonction
ret