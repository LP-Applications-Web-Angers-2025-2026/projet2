; x = x - ((x >> 1) & m1);
mov eax, [x]
mov edx, eax
shr edx, 1
and edx, 1431655765    ; 0x55555555
sub eax, edx