section .text
vec_process:
    mov eax, [esp+4]      ; Pointeur vers le vecteur
    movaps xmm0, [eax]    ; Charger 4 floats
    ; Traitement...