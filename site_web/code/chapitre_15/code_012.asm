mov eax, 0x61616161              ; 4 fois le code ASCII de 'a'
    movd xmm2, eax                   ; charger dans xmm2.d[0]
    vpbroadcastd ymm2, xmm2          ; recopier dans l'intégralité d'ymm2 (8 espaces)