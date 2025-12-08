global main
extern printf

section .data

    message: db "hello world"!", 10, 0
    
section .text

main:
    push    ebp
    mov     ebp, esp
    
    push    dword msg
    call    printf
    add     esp, 4
    
    mov     esp, ebp
    pop     ebp
    xor     eax, eax
    ret
