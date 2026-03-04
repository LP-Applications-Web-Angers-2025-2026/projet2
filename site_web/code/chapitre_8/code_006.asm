pand xmm1, xmm2     ; xmm1 = xmm1 AND xmm2
por xmm1, [esi]     ; xmm1 = xmm1 OR [esi]
pandn xmm1, xmm4    ; xmm1 = NOT(xmm1) AND xmm4