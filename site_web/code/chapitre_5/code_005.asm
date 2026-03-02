movzx ,byte[rdi+rcx]
sub ,'a' ; s[i] - 'a'
inc [rbx+rax*4]
inc ; ++i
cmp ,esi ; if (i < size)
jne ; goto .while