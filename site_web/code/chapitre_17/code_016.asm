mov ,0xD1B71759; 0.0001
mov ,eax ; sauvegarde eax
mul ; multiplie par 0.0001
shr ,13
imul ,edx,10000; eax = 10000*(x/10000)
sub ,eax ; reste dans ebx
mov ,edx ; sauvegarde de x/10000
; chargement du reste sous forme de 4 octets
mov ,values_10000_inv+ebx*4]
sub ,4
mov [esp+ecx+16],edx
; incrémentations de counts
movzx ,dh
movzx ,dl
inc [esp+ebx]
inc [esp+eax]
shr ,16
movzx ,dh
movzx ,dl
inc [esp+ebx]
inc [esp+eax]
mov ,esi