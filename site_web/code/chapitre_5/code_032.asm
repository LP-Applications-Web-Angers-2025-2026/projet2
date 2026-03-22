.if:
    mov eax, [x]
    mov ebx, [y]
    cmp eax, ebx
    jge .else
.then:
    mov [x], 1    ; bloc alors
    jmp .endif    ; pour ne pas exécuter le code du .else
.else:
    mov [x], 2    ; bloc sinon
.endif: