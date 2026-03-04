%assign i 0
%rep 8
    BODY i    ; appel de la macro BODY avec la valeur de i
    %assign i i+4
%endrep