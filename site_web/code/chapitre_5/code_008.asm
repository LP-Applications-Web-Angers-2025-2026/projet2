mov ,6 ; eax = FF_FF_FF_FA_h
xor ,edx ; mise à zéro de edx pour rester
; en 32 bits
mov ,3 ;
div ; eax = 55_55_55_53_h = 1_431_655_763
; edx = 0