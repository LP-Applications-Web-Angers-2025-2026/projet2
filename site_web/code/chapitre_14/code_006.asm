movdqu ,esi+ecx]
movdqu ,edi+ecx]
movdqa ,xmm1 ; xmm2 = x[i:i+15]
movdqa ,xmm3 ; xmm4 = y[i:i+15]
pand ,xmm3 ; xmm1 = x[i:i+15] & y[i:i+15]
por ,xmm4 ; xmm1 = x[i:i+15] | y[i:i+15]
pcmpeqb ,xmm1 ; si xmm1.b[i] == 0
; xmm0.b[i] = 0xFF
; alors
; xmm0.b[i] = 0x00
pmovmskb ,xmm0 ; obtenir le nombre de mutations locales
popcnt ,ebp ; compter
add ,ebp ; ajouter aux mutations totales
pblendvb ,xmm2,xmm0; calculer la séquence hypothétique
movdqa[ebx+ecx],xmm1 ; stocker le résultat en z[i:i+15]
add ,16 ; i+= 16
jmp
22.endfor_ur16