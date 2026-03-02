movzx ,byte[esp+1]
mov [esp+16+edi],al ; digits[ i ] = u
inc [esp+eax]
add ,1 ; ++i
8%endmacro
10; convertir un octet qui contient deux chiffres
11%macro cvt2 1
movzx ,byte[esp+1]
movzx ,word[bcd_table+eax*2]
; chiffres sur 2 octets
movzx ,dh ; dans edx
xor ,dh ; et ebx
inc [esp+edx]
inc [esp+ebx]
mov [esp+16+edi],bl ; stockage de chiffre2
mov [esp+17+edi],dl ; stockage de chiffre1
add ,2
22%endmacro