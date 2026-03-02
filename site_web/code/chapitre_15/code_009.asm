mov ,'a'-'a' ; stocke le nombre d'occurrences
mov ,rbx+r9*4]
mov [rdx],eax
mov ,'e'-'a' ; stocke le nombre d'occurrences
mov ,rbx+r9*4]
mov [rdx+4],eax
mov ,'i'-'a' ; stocke le nombre d'occurrences
mov ,rbx+r9*4]
mov [rdx+8],eax
mov ,'o'-'a' ; stocke le nombre d'occurrences
mov ,rbx+r9*4]
mov [rdx+12],eax
mov ,'u'-'a' ; stocke le nombre d'occurrences
mov ,rbx+r9*4]
mov [rdx+16],eax
mov ,'y'-'a' ; stocke le nombre d'occurrences
mov ,rbx+r9*4]
mov [rdx+20],eax
mov ,rsp-8]
ret