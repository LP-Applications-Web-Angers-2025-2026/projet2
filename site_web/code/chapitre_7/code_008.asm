equal_64bits:
    subss   xmm0, xmm1              ; x - y
    andps   xmm0, [.LC0]            ; fabs : masque 0x7FFFFFFF (élimine le bit de signe)
    cvtss2sd xmm0, xmm0             ; conversion simple → double précision
    movsd   xmm1, [.LC1]            ; charge 1e-6 en double précision
    comisd  xmm1, xmm0              ; compare 1e-6 et |x-y|
    jb      .then                   ; si 1e-6 > |x-y|
.then:
    ...
    jmp .endif
.else:
    ...
.endif:
    ret

.LC0: dd 0x7FFFFFFF, 0, 0, 0       ; masque pour fabs (32 bits)
.LC1: dq 0x3EB0C6F7A0B5ED8D        ; 1e-6 en IEEE 754 double