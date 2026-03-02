push
mov ,esp
push
mov ,ebp+8]
mov ,ebp+12]
mov ,ebp+16]
test ,ecx
jz
13.while:
mov ,edx ; tmp = f1
add ,eax ; f1 = f1 + f0 => f2, f3, ...
mov ,ebx ; f0 = tmp => f1, f2, ...
dec ; --n
jnz
20.endwhile:
22.end:
pop
mov ,ebp
pop
ret