; unroll by 64 (saut des 64 blocs via zmm8)
    ; ... 
    vmovdqa32 zmm8, [rdi+rcx]

    vpcmpeqb k1, zmm2, zmm8          ; Si ZMM8 == ZMM2('a'), mettre K1 à vrai.
    vpcmpeqb k2, zmm3, zmm8          ; 'e'
    ; ...

    ; 'a'
    kmovq rbx, k1                    ; L'AVX-512 transmet le masque direct dans un GPR !
    popcnt rbx, rbx                  ; Le CPU compte sur 64 bits les occurrences
    add r8, rbx                      ; Et les ajoute à la variable compteur native.