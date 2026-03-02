tab: ; tableau de N entiers dont chaque
; élément est initialisé à 0
6section
mov ,tab ; ebx = tab
mov ,1 ; eax = 1 (constante)
xor ,ecx ; i = 0
mov ,N ; edx = N
and ,(8-1)
12.for_ur8:
cmp ,edx ; fin de boucle si i >= N
jge
mov [ebx+ecx*4+0],eax
mov [ebx+ecx*4+4],eax
mov [ebx+ecx*4+8],eax
mov [ebx+ecx*4+12],eax
mov [ebx+ecx*4+16],eax
mov [ebx+ecx*4+20],eax
mov [ebx+ecx*4+24],eax
mov [ebx+ecx*4+28],eax
add ,8 ; i += 8
jmp
25.endfor_ur8:
26.while:
cmp ,N; dernieres iterations
...