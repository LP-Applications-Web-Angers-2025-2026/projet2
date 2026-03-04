mov eax, -6   ; eax = FF_FF_FF_FA_h
xor edx, edx  ; mise à -1 de edx
dec edx
mov ecx, 3
div ecx