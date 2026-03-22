mov  eax, [x]
mov  ecx, 3
cdq
idiv ecx
cmp  edx, 0
mov  eax, 7001
mov  ecx, 101
cmovnz eax, ecx   ; si edx != 0, eax = 7001, sinon eax = 101