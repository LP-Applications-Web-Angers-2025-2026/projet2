mov edi, msg  ; adresse de la chaîne
mov esi, edi  ; sauvegarde de l'adresse
mov ecx, 10000 ; longueur maximale
mov al, 0     ; fin de chaîne
repnz scasb   ; tant que ...
sub edi, esi  ; longueur dans edi