.for:
    mov esi, [ebp+8]
    cmp ecx, [ebp+20]
    jge .endfor

    movzx edx, byte [edi+ecx]       ; dl = y[i]
    movzx eax, byte [esi+ecx]       ; al = x[i]
    mov ebx, eax                    ; bl = x[i]

    or ebx, edx                     ; bl = x[i] | y[i]
    and eax, edx                    ; al = x[i] & y[i]

    setz dl                         ; dl = (al == 0) ? 1 : 0
    cmovz eax, ebx                  ; eax = (al == 0) ? ebx : eax

    add [ebp-4], edx                ; mutations += edx
    mov [esi+ecx], al               ; z[i] = al
    add ecx, 1                      ; ++i
    jmp .for