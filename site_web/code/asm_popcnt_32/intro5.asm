set:
    push ebp
    mov     ebp,esp
    mov     ecx,[ebp+8] ;ecx=n
    mov     edx,ecx     ;edx=n
    shr     edx,3       ;edx=n/8
    and     ecx,7       ;ecx=n%8
    mov     eax,1       ;eax=1
    shl     eax,cl      ;eax=1<<(n % 8)
    or      [tab_process_bits +edx],al
    mov     esp,ebp
    pop     ebp
    ret