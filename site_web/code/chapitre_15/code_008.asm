test rsi, rsi                    ; si size == 0 alors
    jz .end_while                    ; aller en .end_while

    xor rcx, rcx                     ; i = 0

.while:
    movzx eax, byte [rdi+rcx]
    inc rcx                          ; ++i
    sub eax, 'a'                     ; eax = s[i] - 'a'
    cdqe                             ; convertir en 64 bits vers rax (Optionnel la plupart du temps)
    inc dword [rbx+rax*4]

    cmp rcx, rsi                     ; si i < size alors
    jne .while                       ; aller en .while

.end_while: