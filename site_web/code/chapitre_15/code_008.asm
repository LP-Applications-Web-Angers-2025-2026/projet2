movzx ,byte[rdi+rcx]
inc ; ++i
sub ,'a' ; eax = s[i] - 'a'
cdqe ; convertir en 64 bits
inc [rbx+rax*4]
cmp ,rsi ; si i < size alors
jne ; aller en .while
13.end_while: