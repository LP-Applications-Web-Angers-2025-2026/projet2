test eax, eax  ; si eax == 0 alors aller en .end
jz   .end
test eax, 1    ; si le bit de poids faible n'est pas à 1
jz   .pair     ; c'est un nombre pair