end_main:
    mov rdi, [rsp-8]
    mov rsi, [rsp-16]
    mov rbx, [rsp-124]
    mov rsp, rbp
    pop rbp
    ret