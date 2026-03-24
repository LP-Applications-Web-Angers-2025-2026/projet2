# Annexe : Utilisation de l'instruction POPCNT 32 bits

## Introduction

L'instruction `popcnt` (*population count*) compte le nombre de bits à 1 dans un registre. Cette instruction matérielle très rapide a été introduite sur les processeurs x86 modernes supportant l'extension logicielle SSE4.2 (processeurs Intel Nehalem ou AMD Barcelona).

---

## Principe de fonctionnement

> **Note** : L'instruction `popcnt` permet de compter efficacement les bits positionnés à 1 dans un entier 16, 32 ou 64 bits. 

**Par exemple :**
- `0b00001111` → 4 bits à 1
- `0b10101010` → 4 bits à 1
- `0b11111111` → 8 bits à 1

---

## Implémentation de référence en C

Afin de simuler le comportement de l'instruction `popcnt` si celle-ci n'est pas disponible sur une architecture ancienne, on peut utiliser ce simple code C :

```c
#include <stdint.h>

uint32_t pop_count_32(uint32_t n) {
    uint32_t count_bits = 0;
    while (n != 0) {
        count_bits += (n & 1); // Ajoute 1 si le bit de poids faible est à 1
        n = n >> 1;            // Décale à droite pour lire le bit suivant
    }
    return count_bits;
}
```

De nos jours, on privilégiera l'utilisation directe de l'instruction assembleur matérielle via la directive intrinsèque du compilateur :

```c
#include <nmmintrin.h> // Header SSE4.2 pour _mm_popcnt_u32

uint32_t hardware_popcnt(uint32_t x) {
    return _mm_popcnt_u32(x);
}
```

Ou directement en assembleur `nasm` :

```nasm
mov eax, [valeur]
popcnt eax, eax   ; eax contient maintenant le nombre de bits à 1
```

## Benchmark

[BENCHMARK:asm_popcnt_32]
