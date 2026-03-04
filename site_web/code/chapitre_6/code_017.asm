extern scanf

section .data
    s:  db "%d", 0
    a:  dd 0

section .text
; scanf("%d", &a)
my_call_to_scanf:
    sub  rsp, 8         ; rsp multiple de 16
    lea  rdi, [s]
    lea  rsi, [a]
    mov  eax, 0         ; pas de flottant traité
    call scanf WRT..plt
    add  rsp, 8         ; on supprime les octets utilisés pour l'alignement
    ret