mov ,0x61616161 ; # ASCII(a) = 0x61
movd ,eax
pshufd ,xmm2,0
mov ,0x65656565 ; # ASCII(e) = 0x65
movd ,eax
pshufd ,xmm3,0
...
mov ,0x79797979 ; # ASCII(y) = 0x79
movd ,eax
pshufd ,xmm7,0