mov eax, 1024
xor edx, edx  ; mise à zéro de edx pour rester en 32 bits
mov ecx, 3
div ecx
; eax = 341 (quotient), edx = 1 (reste)