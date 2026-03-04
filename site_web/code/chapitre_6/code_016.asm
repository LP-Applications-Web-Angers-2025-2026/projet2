push rbx          ; ou tout autre registre 64 bits (ajoute 8 octets)
; ou :
sub  rsp, 8       ; abaisse le sommet de pile de 8 octets
; ou :
and  rsp, ~0xF    ; alignement sur le multiple de 16 inférieur