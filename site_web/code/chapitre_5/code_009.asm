mov ,6 ; eax = FF_FF_FF_FA_h
xor ,edx ; mise à -1 de edx pour réaliser
dec ; -6 (FF_FF_FF_FF_FF_FF_FF_FA) / 3
mov ,3 ;
div ; eax = FF_FF_FF_F2_h = -2 (quotient)
; edx = 0 (reste)