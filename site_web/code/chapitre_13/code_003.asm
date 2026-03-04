%macro fpu_body 1
    fld dword [esi+ecx*4 + %1*4]
    fmul dword [ebp+16]
    fadd dword [edi+ecx*4 + %1*4]
    fst dword [edi+ecx*4 + %1*4]
    faddp st1, st0
%endmacro