mov ,128; eax = 0xFFFFFF80
shr ,2 ; eax = 0x3FFFFFE0 = 1073741792
mov ,128; eax = 0xFFFFFF80
sar ,2 ; eax = 0xFFFFFFE0 = -32