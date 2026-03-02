mov ,x]
mov ,y]
cmp ,ebx ; si non(x < y) équivalent à x >= y
jge ; aller en .endif
6.then:
mov [x],ebx ; bloc alors
8.endif: