; Listing 5.4.3 – Tant que
xor eax, eax   ; sum = 0
mov ecx, 1     ; i = 1
.while:
    cmp ecx, 10    ; si i > 10 alors sortir du while
    jg  .endwhile
    add eax, ecx   ; sum += i
    inc ecx        ; ++i
    jmp .while
.endwhile:
    mov [sum], eax