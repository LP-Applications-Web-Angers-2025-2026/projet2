compare_32bits:
    push  ebp
    mov   ebp, esp
    fld   dword [ebp+12]  ; charge y dans st0
    fld   dword [ebp+8]   ; charge x dans st0, y → st1
    fcomip st0, st1       ; compare x (st0) à y (st1), dépile x
    fstp  st0             ; supprime y
    jbe   .else
    mov   eax, 1
    jmp   .endif
.else:
    mov   eax, 3
.endif:
    mov   esp, ebp
    pop   ebp
    ret