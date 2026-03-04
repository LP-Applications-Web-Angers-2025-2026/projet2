mov  eax, 0x01010101
movd xmm1, eax         ; xmm1.d[0] = 0x01010101, autres inchangés
movss xmm1, [edi]