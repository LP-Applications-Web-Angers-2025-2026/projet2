mov edx, 1
    mov ecx, -1
    mov eax, [esp+4]
    cmp eax, 0
    cmovg eax, edx                   ; x > 0 ==> 1
    cmovl eax, ecx                   ; x < 0 ==> -1