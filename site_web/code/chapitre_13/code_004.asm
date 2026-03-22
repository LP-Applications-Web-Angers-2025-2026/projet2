; [...]
.for_u4:
    cmp ecx, edx
    jge .endfor_u4

    %assign k 0
    %rep 4
        fpu_body k
        %assign k k+1
    %endrep

    add ecx, 4
    jmp .for_u4
.endfor_u4:
    ; [...]