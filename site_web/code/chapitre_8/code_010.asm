movss ,esp+36]
movss ,esp+44]
insertps ,esp+32],0x10; xmm1 = [ -, -, a, b]
insertps ,esp+40],0x10; xmm0 = [ -, -, c, d]
movlhps ,xmm1 ; xmm0 = [ a, b, c, d]
haddps ,xmm0
haddps ,xmm0
movss [esp+12],xmm0
fld [esp+12]
add ,28
ret