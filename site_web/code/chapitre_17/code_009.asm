mov ,0
13; détermination de la longueur
14; on part du 10ième quartet en on descend pour trouver
15; le premier quartet non égal à 0
16.find_length:
xor ,ebx ; ebx <- 0 valeur qui sera
; soutrait à ecx
mov ,10 ; taille initiale de 10
movzx ,byte[esp+36]
test ,eax ; si il est à 0 alors considérer
; les 4 premiers octects
jz
test ,0xF0 ; si le 10ième chiffre est à 0
setz ; alors mettre 1 dans bl
sub ,ebx ; soustraire à ecx
jmp [bcd_cv_jumps+ecx*4]
30.length_1_to_8:
mov ,esp+32]
; au format BCD dans eax
bsr ,eax ; trouver le bit de poids fort
movzx ,byte[bcd_tlengths+ebx]
jmp [bcd_cv_jumps+ecx*4]; convertir