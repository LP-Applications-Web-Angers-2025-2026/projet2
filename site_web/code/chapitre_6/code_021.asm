main:
    push rbp
    mov  rbp, rsp
    push rdi
    push rsi
    sub  rsp, 100
    push rbx
    and  rsp, ~0xF