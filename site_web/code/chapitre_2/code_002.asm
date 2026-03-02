mov ,edi ; eax <- edi
xor ,edx ; edx <- 0
mov ,10 ; ecx <- 10
div ; eax <- eax / ecx, (u) edx <- eax % ecx
mov ,1 ; eax <- 1, valeur de retour true
cmp ,1 ; si u == 1 alors sortir de la fonction
je
cmp ,3 ; si u == 3 alors sortir de la fonction
je
cmp ,5 ; si u == 5 alors sortir de la fonction
je
cmp ,7 ; si u == 7 alors sortir de la fonction
je
cmp ,9 ; si u == 9 alors sortir de la fonction
je
xor ,eax ; sinon, le nombre est pair on sort avec
; la valeur 0 (false)
26.end:
ret