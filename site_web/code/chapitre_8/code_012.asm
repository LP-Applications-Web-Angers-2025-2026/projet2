extern printf
default rel

section .data
    str_sse_int: db "[%d %d %d %d] ", 10, 0
    str_sse_flt: db "[%f %f %f %f] ", 10, 0

%macro print_sse_int 1
    sub rsp, 128+16+8*6
    mov [rsp], rdi
    mov [rsp+8], rsi
    mov [rsp+16], rdx
    mov [rsp+24], rcx
    mov [rsp+32], r8
    mov [rsp+40], rax

    lea rdi, [str_sse_int]
    pshufd %1, %1, 00011011b
    movdqu [rsp+56], %1
    mov esi, [rsp+56]
    mov edx, [rsp+60]
    mov ecx, [rsp+64]
    mov r8d, [rsp+68]
    xor rax, rax
    call printf WRT ..plt
    pshufd %1, %1, 00011011b

    mov rax, [rsp+40]
    mov r8, [rsp+32]
    mov rcx, [rsp+24]
    mov rdx, [rsp+16]
    mov rsi, [rsp+8]
    mov rdi, [rsp]
    add rsp, 128+16+8*6
%endmacro

%macro print_sse_flt 1
    sub rsp, 128+5*16
    movdqu [rsp+16], xmm0 
    movdqu [rsp+32], xmm1 
    movdqu [rsp+48], xmm2 
    movdqu [rsp+64], xmm3
    movdqu [rsp], %1

    cvtss2sd xmm0, dword [rsp]
    cvtss2sd xmm1, dword [rsp+4]
    cvtss2sd xmm2, dword [rsp+8]
    cvtss2sd xmm3, dword [rsp+12]
    lea rdi, [str_sse_flt]
    mov eax, 4
    call printf WRT ..plt

    movdqu xmm3, [rsp+64]
    movdqu xmm2, [rsp+48]
    movdqu xmm1, [rsp+32]
    movdqu xmm0, [rsp+16]
    add rsp, 128+5*16
%endmacro