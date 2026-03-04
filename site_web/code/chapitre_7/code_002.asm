section .data
    a: dd 0.0   ; float
    b: dq 0.0   ; double

section .text
    fld1            ; st0 = 1.0
    fst  dword [a]  ; stocke 1.0 dans a (float), st0 reste = 1.0
    fstp qword [b]  ; stocke 1.0 dans b (double), puis dépile st0