mov ,x]
movs ,3
cdq ; convertir dans edx:eax
div ; division par 3
5if:
cmp ,0 ; quotient == 0 ?
jnz
8.then:
mov ,101
jmp
11.else:
mov ,7001
13.endif:
; sortie de la fonction