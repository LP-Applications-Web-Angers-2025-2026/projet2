.for_sse:
    cmp rcx, rsi                     ; fin de boucle si i >= size
    jge .end_for

    movdqu xmm8, [rdi+rcx]
    movdqa xmm9, xmm8                ; Copie xmm8 partout 
    movdqa xmm10, xmm8
    movdqa xmm11, xmm8
    movdqa xmm12, xmm8
    movdqa xmm13, xmm8               

    ; Compter les 'a'
    pcmpeqb xmm8, xmm2               ; xmm8.b[i] = 0xFF si s[i] == 'a'
    pmovmskb ebx, xmm8               ; Masque envoyé sur le registre EBX
    popcnt ebx, ebx                  ; Compter le nombre de 1 = occurrences
    add r8, rbx                      ; nb_a += rbx

    ; Compter les 'e'
    pcmpeqb xmm9, xmm3
    pmovmskb ebx, xmm9
    popcnt ebx, ebx
    add r9, rbx
    ; ... 

    add rcx, 16                      ; 16 prochains caractères
    jmp .for_sse
.end_for: