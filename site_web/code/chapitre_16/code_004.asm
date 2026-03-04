fib_v1:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]                 ; eax = f0
    mov edx, [ebp+12]                ; edx = f1
    mov ecx, [ebp+16]                ; ecx = n
    test ecx, ecx                    ; n == 0 ?
    jz .endif

    dec ecx                          ; n - 1
    push ecx                         ; arg 3: n - 1
    add eax, edx                     ; eax <- f0 + f1
    push eax                         ; arg 2: f0 + f1
    push edx                         ; arg 1: f1
    call fib_v1
    add esp, 12                      ; libération des paramètres

.endif:
    mov esp, ebp
    pop ebp
    ret