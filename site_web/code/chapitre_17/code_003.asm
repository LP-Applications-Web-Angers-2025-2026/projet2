push
mov ,esp
mov ,ebp+8]
sub ,44 ; on réserve l'espace pour stocker
and ,31 ; counts, digits et les registres
mov [esp+32],ebx; ebx, esi, edi
mov [esp+36],edi
mov [esp+40],esi
vpxor ,ymm0 ; on met counts et digits à 0
vmovdqa[esp],ymm0