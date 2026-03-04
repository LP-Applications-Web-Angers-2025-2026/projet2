; vers ymm0
vmovdqu [rsi],ymm0 ; stockage dans y
kmovq ,k1 ; compte le nombre d'éléments
popcnt ,rax ; sélectionnés
vzeroupper
ret