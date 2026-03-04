
# Chapitre 8

## popcnt 32
***
### Introduction

L'instruction `popcnt` (population count) compte le nombre de bits à 1 dans un registre. Cette instruction est
**disponible** sur les processeurs x86 modernes supportant l'extension SSE4.2.

***
#### Principe de fonctionnement

> L'instruction `popcnt` permet de compter efficacement les bits à 1 dans un entier 32 bits. Par exemple :

- `0b00001111` → 4 bits à 1
- `0b10101010` → 4 bits à 1
- `0b11111111` → 8 bits à 1

***

##### *Implémentation* en C


``` cpp
code/asm_vowels_64/159-183.cpp
```

*** 

