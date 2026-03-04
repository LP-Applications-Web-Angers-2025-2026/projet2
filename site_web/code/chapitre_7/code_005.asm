movsd ,QWORD [rip]
comisd ,xmm0
jb
8.then:
....
jmp
11.else:
....
13.endif:
ret
17.LC0:
.long ; 0x7FFFFFFF
.long
.long
.long
22.LC1:
.long ; 0xA0B5ED8D
.long ; 0x3EB0C6F7