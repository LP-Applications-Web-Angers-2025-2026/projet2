# Annexe : Compter les voyelles en assembleur 64 bits

## Introduction

Compter le nombre de voyelles dans une chaîne de caractères est un problème simple d'apparence, mais qui met en évidence l'importance de l'architecture du processeur et des choix d'implémentation (prédiction de branchement, vectorisation, etc.).

L'architecture 64 bits (x86-64) nous offre un avantage de taille par rapport à l'architecture 32 bits : **le nombre de registres généraux passe de 8 à 16**. Cela permet de conserver de nombreuses variables directement dans les registres du microprocesseur sans avoir à faire d'incessants allers-retours avec la mémoire (la pile), ce qui est idéal pour optimiser les performances d'une boucle de comptage.

---

## Les fonctions de référence en C

Pour bien comprendre l'enjeu au niveau de l'assembleur, on peut étudier trois approches classiques en langage C/C++ :

### 1. L'approche intuitive (avec des `if`)

La première fonction vérifie chaque lettre avec une cascade de conditions. Cette méthode est extrêmement vulnérable aux erreurs de prédiction de branchement du processeur.

```cpp
void cv_if(unsigned char *s, unsigned int size, unsigned int v[6]) {
    for (unsigned int i = 0; i < size; ++i) {
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

### 2. Le `switch`

Le `switch` permet au compilateur de générer une table de sauts (Jump Table). Cependant, si les données sont imprédictibles, le processeur videra constamment son pipeline.

```cpp
void count_switch(unsigned char *s, unsigned int size, unsigned int v[6]) {
    for (unsigned int i = 0; i < size; ++i) {
        switch(s[i]) {
            case 'a': ++v[0]; break;
            case 'e': ++v[1]; break;
            case 'i': ++v[2]; break;
            case 'o': ++v[3]; break;
            case 'u': ++v[4]; break;
            case 'y': ++v[5]; break;
        }
    }
}
```

### 3. L'approche sans embranchement (avec un Tableau)

La technique la plus rapide en scalaire consiste à allouer un tableau de 26 compteurs et d'incrémenter systématiquement l'index correspondant à la lettre lue. **On supprime ainsi totalement la prédiction de branchement !**

```cpp
void count_letters(unsigned char *s, unsigned int size, unsigned int v[6]) {
    unsigned int letters[26];
    for (unsigned int i = 0; i < 26; ++i) letters[i] = 0;
    
    for (unsigned int i = 0; i < size; ++i) {
       ++letters[s[i] - 'a']; // Pas de if, exécution fluide
    }
    
    v[0] = letters['a' - 'a'];
    v[1] = letters['e' - 'a'];
    v[2] = letters['i' - 'a'];
    v[3] = letters['o' - 'a'];
    v[4] = letters['u' - 'a'];
    v[5] = letters['y' - 'a'];
}
```

---

## Performances et Architectures

Vous pouvez observer ci-dessous le temps d'exécution requis pour analyser 256 000 caractères lors de 50 000 itérations (chaîne aléatoire avec environ 20% de voyelles). L'approche sans condition (`Tableau`) reste indéniablement la plus rapide dans une exécution purement scalaire. 

La traduction de ces méthodes, puis leur dépassement mathématique via les instructions vectorielles SSE2, AVX2 et AVX512 (traitant de 16 à 64 octets par cycle), est détaillée de façon exhaustive dans le **Chapitre 15**.

<br>

<!-- Injection des graphiques Highcharts originaux du fichier asm_vowels_64 -->
<script src="javascript/Highcharts-3.0.10/js/highcharts.js"></script>

<div id="graph_container" style="width: 100%; min-height: 600px;">
    <div id="graph_ancien" style="border: 1px solid #ccc; margin-bottom: 30px;"></div>
    <div id="graph_moderne" style="border: 1px solid #ccc; margin-bottom: 30px;"></div>
    <div id="graph_recent" style="border: 1px solid #ccc;"></div>
</div>

<script type="module">
    import { createPerformanceChart } from "./data/asm_vowels/graph.js";
    import data_ancien from "./data/asm_vowels/ancien/data.json" with { type: "json" };
    import data_moderne from "./data/asm_vowels/moderne/data.json" with { type: "json" };
    import data_recent from "./data/asm_vowels/recent/data.json" with { type: "json" };

    createPerformanceChart('#graph_ancien', data_ancien);
    createPerformanceChart('#graph_moderne', data_moderne);
    createPerformanceChart('#graph_recent', data_recent);
</script>
