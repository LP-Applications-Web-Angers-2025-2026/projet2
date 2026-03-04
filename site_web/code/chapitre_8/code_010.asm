vhaddps ymm0, ymm0, ymm0        ; 1ère addition horizontale (intra lanes)
vhaddps ymm0, ymm0, ymm0        ; 2ème addition horizontale (intra lanes)
vextractf128 xmm1, ymm0, 1      ; extrait les 128 bits du haut dans xmm1
vaddps xmm0, xmm1, xmm0         ; additionne le haut et le bas