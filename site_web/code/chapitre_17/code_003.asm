ad_asm_v1:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    sub esp, 44                      ; on réserve l'espace pour stocker
    and esp, -32                     ; counts, digits et les registres
    mov [esp+32], ebx                ; ebx, esi, edi
    mov [esp+36], edi
    mov [esp+40], esi

    vpxor ymm0, ymm0, ymm0           ; on met counts et digits à 0
    vmovdqa [esp], ymm0