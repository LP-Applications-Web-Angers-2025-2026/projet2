global main
extern printf

; ==== DATA ====
section .data
    ; declaration d'une chaine
    msg: db "hello world!", 10, 0

; ==== CODE ====
section .text

; fonction main
main:
    push    ebp
    mov     ebp, esp
    push    dword msg
    call    printf
    add     esp, 4
    xor     eax, eax
    mov     esp, ebp
    pop     ebp
    ret