movss ,ebp+16]
shufps ,xmm3,0 ;
xor ,ecx ; i = 0
and ,3 ; dépliage par 4
8.for_u4:
cmp ,edx
jge
movaps ,esi+ecx*4]
movaps ,edi+ecx*4]
mulps ,xmm3
addps ,xmm1
addps ,xmm2
movaps[edi+ecx*4],xmm2; stocke résultat
add ,4
jmp
19.endfor_u4:
haddps ,xmm0 ; somme des valeurs
haddps ,xmm0 ; du registre xmm0
sub ,4 ; et addition au
movss[esp],xmm0 ; registre st0
fadd [esp]
add ,4
; dernières itérations
...
ret