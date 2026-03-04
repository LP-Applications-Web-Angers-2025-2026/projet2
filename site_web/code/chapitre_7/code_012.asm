extern printf
default rel

section .data
    x:   dd 3.14
    msg: db "%f", 0

section .text
affiche:
    push rbp
    mov  rbp, rsp
    movss  xmm0, [x]           ; charge x (float 32 bits)
    cvtss2sd xmm0, xmm0        ; conversion au format double précision
    lea  rdi, [msg]             ; adresse du format
    mov  eax, 1                 ; indique qu'il y a une valeur flottante
    call printf WRT..plt
    mov  rsp, rbp
    pop  rbp
    ret