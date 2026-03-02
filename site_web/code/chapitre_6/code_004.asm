mov ,5 ; place dans la pile le second parametre
push
push ; place le premier parametre
call ; appel du sous-programme
add ,8 ; supprime les parametres
ret