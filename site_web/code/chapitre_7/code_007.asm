msg: `%f`,0
7section
fld [x]
sub ,8 ; réservation de 64 bits pour
; double précision
fstp [esp]
push
call
add ,12