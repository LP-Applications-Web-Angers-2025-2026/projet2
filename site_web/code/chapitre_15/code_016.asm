; remplir le vecteur ymm2 avec [a,a,a,a,...]
mov ,0x61616161 ; 4 fois le code ASCII de 'a'
movd ,eax ; charger dans xmm2.d[0]
vpbroadcastd ,xmm2 ; recopier dans ymm2.d[1] à ymm2.d[7]