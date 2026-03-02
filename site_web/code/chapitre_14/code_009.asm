push ; sauvegarde d'ebp
3.for_u64:
vmovdqa64 ,esi+ecx]
vpandd ,zmm3,edi+ecx]
vpord ,zmm3,edi+ecx]
vpcmpeqb ,zmm0,zmm1 ; comparaison
vmovdqu8 {k1},zmm2 ; remplacement des éléments de zmm1
; par les éléments de zmm2
; suivant k1
vmovdqa64 [ebx+ecx],zmm1
kmovd ,k1 ; partie basse de k1 dans ebp
kshiftrq ,k1,32
popcnt ,ebp
add ,ebp
kmovd ,k2 ; partie haute de k2 dans ebp
popcnt ,ebp
add ,ebp
add ,64
dec
jnz
pop
vzeroupper
29.last_63: