; affichage Intel
pshufd%1,1,00011011b
movdqu[esp], 1
push
call
add ,20
; rétablir les valeurs initiales
pshufd%1,1,00011011b
18%endmacro
20%macro print_sse_flt 1
sub ,48 ; 16 + 4*8
movups[esp], 1 ; stocke le registre
fld [esp+32]
fstp [esp+24]
fld [esp+36]
fstp [esp+16]
fld [esp+40]
fstp [esp+8]
fld [esp+44]
fstp [esp]
push
call
add ,48+4
34%endmacro