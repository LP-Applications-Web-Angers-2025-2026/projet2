mov ,6 ; eax = FF_FF_FF_FA_h
cdq ; edx = FF_FF_FF_FF, eax = FF_FF_FF_FA
mov ,3 ;
div ; eax = FF_FF_FF_F2_h = -2 (quotient)
; edx = 0 (reste)
5.3.2.4 imul