; (Exemple partiel AVX512 avec registres k1/k2)
    vpcmpeqb k1, zmm0, zmm1          ; Comparaison stockée dans le registre de masque k
    vmovdqu8 zmm1 {k1}, zmm2         ; Remplacement conditionnel ultra-rapide
    ; Extraction du masque k1 vers des registres généraux pour faire les popcnt