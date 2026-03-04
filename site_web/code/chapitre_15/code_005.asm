xor rax, rax
  %assign i 0
  %rep 13
      mov [rbx+i], rax
      %assign i i + 8
  %endrep