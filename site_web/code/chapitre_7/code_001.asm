section .data
    a: dd 1.25          ; float a = 1.25
    b: dq 3.752567871   ; double b = 3.752567871
    c: dd 31            ; int c = 31
    d: dq 123           ; long int d = 123

section .text
    fld  dword [a]
    fld  qword [b]
    fld  st0            ; empile le sommet (copie)
    fld  st1
    fild dword [c]
    fild qword [d]
    ret