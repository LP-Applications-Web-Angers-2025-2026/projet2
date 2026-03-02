; et affecte k1 en consequence
vmovdqu8 {k1},zmm4 ; selectionne les octets de zmm4 en
; utilisant k1 et remplace dans zmm3
vmovdqu8 [rdx+r9],zmm3 ; affecte le résultat final
kmovq ,k1 ; met le masque k1 dans r8
popcnt ,r8 ; compte le nombre de bits à 1
add ,r8d ; additionne à eax