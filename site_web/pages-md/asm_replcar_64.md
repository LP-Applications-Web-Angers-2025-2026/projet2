# Annexe : Remplacement de caractères (64 bits)

## Introduction

Cette étude de cas traite de l'optimisation d'une fonction de remplacement de caractères dans une chaîne. L'objectif est de remplacer toutes les occurrences d'un caractère donné par un autre caractère, de manière performante en architecture 64 bits.

---

## Principe de fonctionnement

La fonction de référence parcourt la chaîne caractère par caractère et effectue le remplacement lorsque le caractère cible est trouvé :

```c
void chr_replace_ref(char *str, size_t len, char old_char, char new_char) {
    for (size_t i = 0; i < len; ++i) {
        if (str[i] == old_char) {
            str[i] = new_char;
        }
    }
}
```

---

## Optimisations

### Vectorisation SSE

En utilisant les registres SSE (128 bits), on peut traiter 16 caractères simultanément :
- Charger 16 octets avec `movdqu`
- Comparer avec `pcmpeqb` pour créer un masque
- Appliquer le remplacement avec `pblendvb` ou des opérations logiques

### Vectorisation AVX2

Avec les registres AVX2 (256 bits), on traite 32 caractères par itération, doublant ainsi le débit théorique.

```nasm
chr_repl_avx2:
    ; Broadcast du caractère à chercher dans ymm1
    vpbroadcastb ymm1, [old_char]
    ; Broadcast du caractère de remplacement dans ymm2
    vpbroadcastb ymm2, [new_char]
    
.loop:
    vmovdqu ymm0, [rsi]           ; Charger 32 octets
    vpcmpeqb ymm3, ymm0, ymm1     ; Comparer avec old_char
    vpblendvb ymm0, ymm0, ymm2, ymm3  ; Remplacer si match
    vmovdqu [rsi], ymm0           ; Stocker le résultat
    add rsi, 32
    sub rcx, 32
    jnz .loop
```

---

## Benchmark

Les tests comparent la référence C compilée avec différents niveaux d'optimisation (`-O2`, `-O3`) avec les versions assembleur SSE et AVX2, incluant différents niveaux de dépliage de boucle.

[BENCHMARK:asm_replcar_64]
