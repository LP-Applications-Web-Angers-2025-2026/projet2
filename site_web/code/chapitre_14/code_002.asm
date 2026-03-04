fitch_asm:
    push ebp                        ; entrée dans la fonction
    mov ebp, esp
    mov eax, [ebp+20]
    test eax, eax                   ; si size == 0
    jz .end

    push ebx                        ; sauvegarde des registres
    push esi
    push edi

    ; chargement des paramètres
    mov esi, [ebp+8]
    mov edi, [ebp+12]
    mov ebx, [ebp+16]
    xor eax, eax                    ; mutations = 0
    xor ecx, ecx                    ; i = 0

.for:
    cmp ecx, [ebp+20]
    jge .endfor

    mov dl, [esi+ecx]               ; dl = x[i]
    and dl, [edi+ecx]               ; dl = x[i] & y[i]
    jnz .endif                      ; si dl != 0 alors pas de mutation

    mov dl, [esi+ecx]
    or dl, [edi+ecx]                ; dl = x[i] | y[i]
    inc eax                         ; ++mutations
.endif:
    mov [ebx+ecx], dl               ; z[i] = dl
    inc ecx                         ; ++i
    jmp .for

.endfor:
    pop edi                         ; restauration des registres
    pop esi
    pop ebx
.end:
    mov esp, ebp                    ; sortie de fonction
    pop ebp
    ret