push
mov ,esp
mov ,ebp+8]
mov ,ebp+12]
mov ,ebp+16]
test ,ecx
jz
dec
push ; n-1
add ,edx ; eax <- f0+f1
push
push ; f1
call
; add esp 12
21.endif:
mov ,ebp
pop
ret