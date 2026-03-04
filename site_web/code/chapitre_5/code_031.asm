; Listing 5.4.2 – Si Alors avec conjonction de conditions
; eax = x, ebx = y, ecx = z
.if:
    cmp eax, 3    ; C1
    jge .endif    ; si non(x < 3) alors aller en finsi
    cmp ebx, 6    ; C2
    jl  .endif    ; si non(y >= 6) alors aller en finsi
    cmp eax, ecx  ; C3
    jne .endif    ; si non (x == z) alors aller en finsi
.then:
    mov eax, ebx
.endif: