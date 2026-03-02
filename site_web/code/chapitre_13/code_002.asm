push
mov ,esp
fldz ; sum = 0
cmp [ebp+20],0 ; si size == 0 alors retourne 0
jz
push ; sauve les registres
push ;
mov ,ebp+8]
mov ,ebp+12]
mov ,ebp+20]
xor ,ecx ; i = 0
14.for:
cmp ,edx ; fin de boucle si i >= size
jge
fld [esi+ecx*4]
fmul [ebp+16]
fadd [edi+ecx*4]
fst [edi+ecx*4]
faddp ,st0 ; sum += y[i]
inc ; ++i
jmp
24.endfor:
pop ; restaure les registres
pop ;
27.end:
mov ,ebp
pop
ret