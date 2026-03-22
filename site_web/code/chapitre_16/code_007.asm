fib_v3:
    push ebp
    mov ebp, esp
    push ebx
    mov eax, [ebp+8]                 ; eax = f0
    mov edx, [ebp+12]                ; edx = f1
    mov ecx, [ebp+16]                ; ecx = n
    test ecx, ecx
    jz .end

.while:
    mov ebx, edx                     ; tmp = f1
    add edx, eax                     ; f1 = f0 + f1 => f2
    mov eax, ebx                     ; f0 = tmp => f1
    dec ecx                          ; --n
    jnz .while

.end:
    pop ebx
    mov esp, ebp
    pop ebp
    ret