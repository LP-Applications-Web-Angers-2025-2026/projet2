movdqa ,esi+ecx]
movdqa ,edi+ecx]
movdqa ,xmm0 ; xmm1 = xmm0
pand ,xmm2 ; xmm0 = x[i:i+15] & y[i:i+15]
por ,xmm2 ; xmm1 = x[i:i+15] | y[i:i+15]
movdqa ,xmm0 ; xmm4 = x[i:i+15] & y[i:i+15]
pcmpeqb ,xmm6 ; xmm4 est le masque
; si (x[i] & y[i] == 0) alors
; xmm4[i] = 0xFF
; sinon
; xmm4[i] = 0x00
pmovmskb ,xmm4 ; obtenir les bits
popcnt ,ebp ; compte le nombre de mutations
add ,ebp ; ajouter à eax
; calcul de la séquence
pand ,xmm4 ; not(xmm4) & (x[i] | y[i])
pandn ,xmm0
por ,xmm1
movdqa[ebx+ecx],xmm0 ; résultat dans z[i:i+15]
add ,16 ; i+= 16
dec
jnz