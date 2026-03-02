movss ,ebp+16]
shufps ,xmm3,0
vinsertf128 ,xmm3,1
xor ,ecx ; i = 0
and ,7 ; edx multiple de 8 de size
10.for_u8:
cmp ,edx ; sortie de boucle si ecx >= edx
jge
vmovaps ,esi+ecx*4]
vmovaps ,edi+ecx*4]
vfmadd321ps ,ymm1,ymm3
vaddps ,ymm2
vmovaps[edi+ecx*4],ymm2; y[i:i+7] = ymm2
add ,8 ; i += 8
jmp
20.endfor_u8:
vhaddps ,ymm0 ; somme des valeurs
vhaddps ,ymm0 ; de ymm0
vextractf128 ,ymm0,1
vaddps ,xmm1
sub ,4 ; stockage du résultat dans st0
vmovss[esp],xmm0
fadd [esp]
add ,4
mov ,ebp+16]
31.for:
cmp ,edx
jge
fld [esi+ecx*4]
fmul [edi+ecx*4]
faddp ,st0
inc
jmp
39.endfor:
...