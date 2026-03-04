imul ecx              ; edx:eax = eax * ecx (comme mul)
imul ebx, ecx         ; ebx = ebx * ecx (edx pas modifié)
imul ebx, ecx, 3      ; ebx = ecx * 3 (edx pas modifié)