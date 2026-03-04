xor rax, rax                     ; rax = 0
  mov r8, rdi                      ; sauvegarde rdi dans r8
  mov rdi, rbx                     ; rdi = &letters[0]
  mov rcx, 13                      ; faire 13 fois
  rep stosq           
  mov rdi, r8                      ; restaure rdi depuis r8