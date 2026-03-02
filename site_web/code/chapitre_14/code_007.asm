; ymm0.b[i] = 0xFF
; alors
; ymm0.b[i] = 0x00
vpmovmskb ,ymm0 ; obtenir le nombre de mutations locales
popcnt ,ebp ; compter
add ,ebp ; ajouter aux mutations totales
vpblendvb ,ymm2,ymm0 ; calculer la séquence hypothétique
vmovdqa[ebx+ecx],ymm1; stocker le résultat en z[i:i+15]
add ,32 ; i += 32
dec
jnz