mov [x],1 ; bloc alors
jmp ; pour ne pas exécuter le code du .else
9.else:
mov [x],2 ; bloc sinon
11.endif:
5.4.8