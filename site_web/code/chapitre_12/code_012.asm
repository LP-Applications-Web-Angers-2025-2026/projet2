movdqa ,esi+ecx]
pshufd ,xmm0,0x01 ; extrait le 2nd mot dans xmm1
pshufd ,xmm0,0x02 ; extrait le 3ieme mot dans xmm2
pshufd ,xmm0,0x03 ; extrait le 4ieme mot dans xmm3
movd ,xmm0 ; compte les bits
popcnt ,edi ; de la partie basse de xmm0
add ,edi
movd ,xmm1 ; compte les bits
popcnt ,ebx ; de la partie basse de xmm1
add ,ebx
movd ,xmm2 ; compte les bits
popcnt ,edi ; de la partie basse de xmm2
add ,edi
movd ,xmm3 ; compte les bits
popcnt ,ebx ; de la partie basse de xmm3
add ,ebx
add ,16
cmp ,edx
jne