mov r9d, 'a'-'a'                 ; stocke le nombre d'occurrences
    mov eax, [rbx+r9*4]
    mov [rdx], eax
    mov r9d, 'e'-'a'                 
    mov eax, [rbx+r9*4]
    mov [rdx+4], eax
    ; ... idem pour i,o,u,y

    mov rbx, [rsp-8]
    ret