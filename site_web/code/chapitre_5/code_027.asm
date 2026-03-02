mov ,1 ; i = 1
3.while:
cmp ,10 ; si i > 10 alors sortir du while
jg
add ,ecx ; sum += i
inc ; ++i
jmp
9.endwhile:
mov [sum],eax