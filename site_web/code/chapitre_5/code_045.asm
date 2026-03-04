mov  eax, [x]
mov  ecx, 3
cdq           ; convertir dans edx:eax
idiv ecx      ; division par 3
.if:
    cmp eax, 0   ; quotient == 0 ?
    jnz .else
.then:
    mov eax, 101
    jmp .endif
.else:
    mov eax, 7001
.endif:
    ; sortie de la fonction