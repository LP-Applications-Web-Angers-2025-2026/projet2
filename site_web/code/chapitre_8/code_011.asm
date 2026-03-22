extern printf

section .data
    str_sse_int: db "[%d %d %d %d] ", 10, 0
    str_sse_flt: db "[%f %f %f %f] ", 10, 0

%macro print_sse_int 1
    sub esp, 16
    ; affichage Intel
    pshufd %1, %1, 00011011b
    movdqu [esp], %1
    push str_sse_int
    call printf
    add esp, 20
    ; rétablir les valeurs initiales
    pshufd %1, %1, 00011011b
%endmacro

%macro print_sse_flt 1
    sub esp, 48               ; 16 + 4*8
    movups [esp], %1          ; stocke le registre
    fld dword [esp+12]
    fstp qword [esp+40]
    fld dword [esp+8]
    fstp qword [esp+32]
    fld dword [esp+4]
    fstp qword [esp+24]
    fld dword [esp]
    fstp qword [esp+16]
    push str_sse_flt
    call printf
    add esp, 52               ; 48 + 4
%endmacro