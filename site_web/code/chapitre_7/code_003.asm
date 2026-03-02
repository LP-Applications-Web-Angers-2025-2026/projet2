or Equal) pour exécuter le.elsedans le cas oùx≤y.
1compare_32bits:
push
mov ,esp
fld [ebp+12]
fld [ebp+8]
fcomip ,st1 ; x est en st0, y en st1, on compare
; x à y et on dépile x
fstp ; supprime y
jbe
mov ,1
jmp
12.else:
mov ,3
14.endif:
mov ,ebp
pop
ret