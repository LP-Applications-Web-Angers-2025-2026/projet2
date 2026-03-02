mov ,dword[rdi+rcx]
add ,4 ; i += 4
movzx ,al ; r8 = s[i]
shr ,8
movzx ,al ; r9 = s[i+1]
shr ,8
movzx ,al ; r10 = s[i+2]
shr ,8 ; eax = s[i+3]
sub ,'a' ; calcul des indices
sub ,'a'
sub ,'a'
sub ,'a'
inc [rbx+rax*4]
inc [rbx+r8*4]
inc [rbx+r9*4]
inc [rbx+r10*4]
cmp ,esi
jl
24.end_while_ur4: