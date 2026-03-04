; ex. eax = 1234567890
mov ,esp+36]
; chiffres : 0x12
mov ,0xF0F0F0F
pdep ,eax,ecx; décalage ebx = 0x0102
movbe[esp+16],ebx; stockage
mov ,esp+32]
; eax = 34567890
pdep ,eax,ecx; ebx = 0x07080900
movbe[esp+24],ebx; stockage 0x09080706
shr ,16 ; chiffres 5 à 8
pdep ,eax,ecx; edx = 0x03040506
movbe[esp+20],edx; stockage 0X06070809