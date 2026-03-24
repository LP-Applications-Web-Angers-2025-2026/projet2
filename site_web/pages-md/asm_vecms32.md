# Annexe : Opérations vectorielles (32 bits)

## Introduction

Cette étude de cas explore différentes approches pour effectuer des opérations sur des vecteurs de données en architecture 32 bits. Les tests comparent les performances des sections `.data`, `.text`, `.case` et les opérations de tri (`sort`).

---

## Contexte

Les opérations vectorielles de base incluent :
- L'initialisation de données (`.data`)
- Le traitement dans la section code (`.text`)
- Les structures de contrôle conditionnelles (`.case` / switch)
- Les algorithmes de tri (`sort`)

---

## Implémentations

### Section .data

Utilisation de données pré-initialisées en mémoire pour accélérer les accès :

```nasm
section .data
    align 16
    vec_data: dd 1.0, 2.0, 3.0, 4.0
```

### Section .text

Code optimisé utilisant les registres pour minimiser les accès mémoire :

```nasm
section .text
vec_process:
    mov eax, [esp+4]      ; Pointeur vers le vecteur
    movaps xmm0, [eax]    ; Charger 4 floats
    ; Traitement...
```

### Structure switch/case

Optimisation des branchements conditionnels par table de sauts :

```nasm
.case:
    cmp eax, MAX_CASE
    ja .default
    jmp [jump_table + eax*4]
```

### Tri (sort)

Implémentation optimisée d'algorithmes de tri sur des vecteurs de données.

---

## Benchmark

Les résultats comparent les différentes approches d'organisation du code et des données pour les opérations vectorielles en 32 bits.

[BENCHMARK:asm_vecms32]
