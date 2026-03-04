.if:
    mov eax, [x]
    mov ebx, [y]
    cmp eax, ebx    ; si non(x < y) équivalent à x >= y
    jge .endif
.then:
    mov [x], ebx    ; bloc alors
.endif: