mov eax, -128  ; eax = 0xFFFFFF80
shr eax, 2     ; eax = 0x3FFFFFE0 = 1073741792 (signe non préservé)
mov eax, -128  ; eax = 0xFFFFFF80
sar eax, 2     ; eax = 0xFFFFFFE0 = -32 (signe préservé)