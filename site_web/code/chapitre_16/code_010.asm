mov ,ebp+16]
and ,7
jmp [switch_jumps_table +ecx*4]
1%macro swap_1 0
; eax=f0 edx=f1
add ,edx; eax=f2=f0+f1
xchg ,edx; eax=f1 edx=f2
5%endmacro
7%macro swap_2 0
; eax=f0 edx=f1
add ,edx; eax=f0+f1=f2
add ,eax; edx=f2+f1=f3
11%endmacro
13fib_v13:
push
mov ,esp
mov ,ebp+8]
mov ,ebp+12]
mov ,ebp+16]
test ,ecx
jz
shr ,3 ; / 8
jz
27.while_ur8: ; eax=f0 edx=f1
swap_2 ; eax=f2 edx=f3
swap_2 ; eax=f4 edx=f5
swap_2 ; eax=f6 edx=f7
swap_2 ; eax=f8 edx=f9
loop
34.last_7:
mov ,ebp+16]
and ,7
jz
39.while:
swap_1
loop
43.end:
mov ,ebp
pop
ret