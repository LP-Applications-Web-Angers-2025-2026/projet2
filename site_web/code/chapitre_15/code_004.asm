mov [rsp-8], rbx
    lea rbx, [rsp - (8 + 4*26)]      ; allocation 104 octets + rbx
    and rbx, ~(32-1)                 ; arrondissement au multiple de 32 inférieur
    ; en bas de la red zone
    xor eax, eax