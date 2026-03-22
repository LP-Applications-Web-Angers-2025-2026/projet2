mov ,0 ; pas de flottant traité
call WRT..plt
add ,8 ; on supprime les octets utilisés
; pour l'alignement
ret