mov eax, -6
cdq           ; edx = FF_FF_FF_FF
mov ecx, 3
idiv ecx      ; eax = -2 (quotient), edx = 0 (reste)