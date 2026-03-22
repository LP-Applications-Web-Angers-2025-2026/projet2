; évaluation de l'expression, résultat dans edx
xor eax, eax  ; valeur de sortie à 0
cmp edx, 0    ; ou test edx, edx
setnz al      ; al = 1 si ZF=0, al = 0 si ZF=1