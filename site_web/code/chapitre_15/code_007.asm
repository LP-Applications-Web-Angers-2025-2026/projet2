vpxor ymm0, ymm0, ymm0
  vmovdqa [rbx], ymm0              ; letters[ 0: 7] = 0
  vmovdqa [rbx+32], ymm0           ; letters[ 8:15] = 0
  vmovdqa [rbx+64], ymm0           ; letters[16:23] = 0
  vzeroupper
  mov [rbx+96], rax                ; letters[24:25] = 0 (avec rax = 0)