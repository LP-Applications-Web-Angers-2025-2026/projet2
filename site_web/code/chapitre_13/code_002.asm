saxpy_fpu:
    push ebp
    mov ebp, esp
    fldz                            ; sum = 0
    cmp dword [ebp+20], 0           ; si size == 0 alors retourne 0
    jz end

    push esi                        ; sauve les registres
    push edi

    mov esi, [ebp+8]                ; esi = x
    mov edi, [ebp+12]               ; edi = y
    mov edx, [ebp+20]               ; edx = size
    xor ecx, ecx                    ; i = 0

.for:
    cmp ecx, edx                    ; fin de boucle si i >= size
    jge endfor

    fld dword [esi+ecx*4]           ; charge x[i]
    fmul dword [ebp+16]             ; a * x[i]
    fadd dword [edi+ecx*4]          ; a * x[i] + y[i]
    fst dword [edi+ecx*4]           ; stocke dans y[i]
    faddp st1, st0                  ; sum += y[i] et on dépile

    inc ecx                         ; ++i
    jmp .for

.endfor:
    pop edi                         ; restaure les registres
    pop esi
.end:
    mov esp, ebp
    pop ebp
    ret