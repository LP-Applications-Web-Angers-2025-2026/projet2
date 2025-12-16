
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


``` C++
void cv_if(u8 *s, u32 size, u32 v[6]) {
	for (u32 i=0; i<size; ++i) {
		if (s[i] == 'a') {
			++v[0];
		} else if (s[i] == 'e') {
			++v[1];
		} else if (s[i] == 'i') {
			++v[2];
		} else if (s[i] == 'o') {
			++v[3];
		} else if (s[i] == 'u') {
			++v[4];
		} else if (s[i] == 'y') {
			++v[5];
		}
	}
}
```

*** 

