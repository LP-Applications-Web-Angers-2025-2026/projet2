mov ,msg ; adresse de la chaine
mov ,edi ; sauvegarde de l'adresse de la chaine
mov ,10000; longueur maximale
mov ,0 ; fin de chaine
repnz ; tant que ...
sub ,esi ; longueur dans edi