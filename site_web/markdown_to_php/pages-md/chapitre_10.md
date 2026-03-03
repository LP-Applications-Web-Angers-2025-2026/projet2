# Chapitre 10 : Études de cas

## 10.1 Introduction

Avant d'aborder les différentes études de cas dont le but est de traiter les
points cruciaux que nous avons évoqués, nous allons détailler dans ce chapitre les
caractéristiques communes à chacune de ces études de cas que nous qualifions
également de projets car il s'agit en fait de projets de programmation.

J'ai tenté d'établir une sorte de squelette de projet en utilisant la même organi-
sation des répertoires ainsi que les mêmes scripts shell et PHP. Les diverses actions
(compilation, exécution des tests de performance, ...) sont automatisées au moyen
de l'utilitaire `make` ainsi que du `makefile` associé.

Chaque projet est conçu autour d'un ensemble d'implantations, appelées méthodes, 
d'un traitement informatique. L'une de ces méthodes est un sous-programme
dit de référence qui nous permet de vérifier que les autres méthodes sont correctes
et produisent le même résultat. Chaque nouvelle méthode tente d'apporter une
amélioration par rapport à la méthode de référence en :

- Utilisant une réécriture du code C (dépliage, élimination des `if`, vectorisation
  par *intrinsics*)
- Ou en codant la fonction C en assembleur (dépliage, élimination des `if`,
  vectorisation)

## 10.2 Arborescence des projets

Les sous-répertoires de chaque projet sont les suivants :

- Le sous-répertoire `cfg` contient des fichiers de configuration utiles à la compilation
- Le sous-répertoire `src` contient le code source, c'est-à-dire les fichiers C/C++ et
  les fichiers assembleur
- Le sous-répertoire `build` contient les fichiers générés lors de la compilation :
  - `build/obj` contient les fichiers objets (`.o`)
  - `build/bin` contient les exécutables (`.exe`)
- Le sous-répertoire `results` contient les fichiers de données et graphiques
  générés lors de l'exécution des tests de validité et de performance. On trouve
  un répertoire par processeur (ex: `Intel-Celeron-CPU-N3050-1_60GHz`)
- Le sous-répertoire `output` contient les fichiers générés par le script `table.php`
  qui permet de générer des tableaux de données à partir des résultats obtenus

L'arborescence est donc la suivante :

```text
.
├── build
│   ├── bin
│   └── obj
├── cfg
├── output
├── results
│   └── Intel-Celeron-CPU-N3050-1_60GHz
└── src
```

Dans le répertoire principal on trouvera un fichier `README` ainsi qu'un fichier
`INSTALL`. Le but du fichier `README` est de renseigner l'utilisateur sur l'objectif du
projet ainsi que de lui donner un accès rapide aux fonctionnalités de base.
Le fichier `INSTALL`, quant à lui, décrit comment installer le projet, en d'autres
termes, comment le compiler et quels programmes annexes doivent être installés.

Le choix a été fait de rédiger l'ensemble des sources en anglais ainsi que les
fichiers `README` et `INSTALL` de manière à ce qu'ils puissent être utilisés, voire modifiés
par un large public. L'ensemble des fichiers est sous Licence GNU.

### 10.2.1 Cibles Makefile

On considère que le lecteur possède des connaissances de base liées à la création
d'un `makefile`. Les différentes cibles (*targets*) de `make` sont les suivantes :

- `configure` : appelle le script `cpu_technos.sh`
- `build` : permet de générer les exécutables au format release, c'est-à-dire avec
  les options de compilations censées générer du code performant ; on obtient
  le même résultat en lançant `make` sans arguments
- `debug` : génère les exécutables en incluant les informations nécessaires au
  débogage
- `clean` : supprime les fichiers objets et les exécutables
- `validity` : exécute les tests de validité afin de vérifier que les fonctions donnent
  le même résultat pour un test de base
- `performance` : exécute les tests de performance ce qui permet de déterminer
  quelle fonction est la meilleure
- `archive` : génère une archive de l'ensemble des fichiers du projet

### 10.2.2 Scripts disponibles

On dispose dans le répertoire du projet d'un ensemble de scripts :

- `cpu_name.sh` : récupère le nom du microprocesseur en éliminant certains
  caractères inutiles et en remplaçant les espaces par le signe moins (`-`). Cet
  identifiant est ensuite utilisé pour créer un sous-répertoire dans `results`.
- `cpu_technos.sh` : détermine quelles technologies (SSE2, SSE4.1, SSE4.2, AVX2,
  POPCNT, BMI, FMA) sont implantées au niveau du CPU. Il génère en conséquence
  `src/asm_config.inc`, `src/cpp_config.inc` ainsi que `cpu_technos.mak`.
- `validity_test.php` : réalise un test de validité en vérifiant pour différents
  paramètres que les méthodes donnent le même résultat que la référence.
- `performance_test.php` : réalise un test de performance afin de déterminer
  quelle est la méthode la plus efficace, puis appelle `performance_graph.php`
  afin de générer un graphique des données avec **gnuplot**.
- `table.php` : permet de générer des tableaux de données au format CSV
  (*Comma Separated Values*), HTML ou LaTeX.

Cette liste est non exhaustive, on trouvera également des scripts spécifiques.
Par exemple, pour le produit de matrices, nous avons ajouté `samples_test.php` qui
démontre la sensibilité de la méthode de référence à la dimension.

### 10.2.3 Le répertoire src et common.h

Dans le répertoire des fichiers sources, on trouve un fichier `common.h` qui contient
les définitions de types, constantes et fonctions communes.

On trouvera également les fichiers `cpp_config.h` et `asm_config.inc` (générés
par `cpu_technos.sh`) qui définissent des macros liées aux technologies supportées.
Par exemple, si le CPU supporte le SSE 4.2, la macro `CPU_SSE42_COMPLIANT` sera
définie et pourra être utilisée en inclusion conditionnelle.

J'utilise également `cpu_timer.h` et `cpu_timer.cpp` qui définissent la classe
`CPUTimer`, un chronomètre basé sur l'instruction `rdtsc` (*ReaD TimeStamp
Counter*) pour lire le nombre de cycles d'horloge du processeur.

La classe `SignalHandler` a été implantée (dans `signal_handler.h`/`.cpp`) pour intercepter la
plupart des exceptions comme `SIGFPE`. Il suffit de l'instancier dans le `main` :

```cpp
int main(int argc, char* argv[]) {
    SignalHandler sh;
    // ...
}
```

Le fichier `src/main.cpp` se base sur `getopt` pour gérer les options en ligne de
commande :

- `-h` ou `--help` : obtenir l'aide du programme
- `-l` ou `--list` : liste des méthodes
- `-t` ou `--test` : réalise un test de validité de l'ensemble des méthodes
- `-m` ou `--method` : choisir la méthode à tester via son identifiant (la référence vaut 1)
- `-n` ou `--name` : sélectionner une méthode en précisant son nom
- `-v` ou `--verbose` : active le mode verbeux (informations supplémentaires)

## 10.3 Redéfinition des types

Afin de simplifier l'écriture du code C/C++, les types ont été redéfinis dans
`src/common.h`. Ainsi, `unsigned int`, `size_t` ou `uint32_t` deviennent plus courts.
De même pour les flottants :

```cpp
typedef unsigned int   u32;
typedef unsigned short u16;
typedef unsigned char  u8;
typedef int            i32;
typedef float          f32;
typedef double         f64;
```

## 10.4 Plateformes de test et mesures

### 10.4.1 Les matériels (Processeurs)

L'ensemble des méthodes sera testé sur différents matériels pour étudier l'influence de la technologie, taille de cache, etc. Nous séparons les matériels en trois catégories :

- **Architectures anciennes** (avant 2015)
- **Architectures modernes** (2015 à 2019)
- **Architectures récentes** (2020 et après)

#### Matériels anciens (Avant 2015)

| Marque | Modèle | Sous-modèle | Année | Architecture | Litho (nm) | Fréq. base/boost | Cores/Threads | Cache L1i/L1d (ko) | Cache L2 | Cache L3 |
|---|---|---|---|---|---|---|---|---|---|---|
| Intel | Pentium D | 925 | 2006 | Presler | 65 | 3.0 / 3.0 GHz | 2 / 2 | 12 / 16 | 1024 ko | - |
| Intel | Core 2 Quad | Q9300 | 2008 | Yorkfield | 45 | 2.5 / 2.5 GHz | 4 / 4 | 32 / 32 | 3072 ko | - |
| Intel | Core i7 | 860 | 2009 | Lynnfield | 45 | 2.8 / 3.46 GHz | 4 / 8 | 32 / 32 | 256 ko | 8 Mo |
| AMD | Phenom II X6 | 1090T | 2010 | Thuban | 45 | 3.2 / 3.6 GHz | 6 / 6 | 64 / 64 | 512 ko | 6 Mo |
| Intel | Core i5 | 3570K | 2012 | Ivy Bridge | 22 | 3.4 / 3.8 GHz | 4 / 4 | 32 / 32 | 256 ko | 6 Mo |
| Intel | Core i7 | 4790 | 2014 | Haswell | 22 | 3.6 / 4.0 GHz | 4 / 8 | 32 / 32 | 256 ko | 8 Mo |

*TABLE 10.1 – Caractéristiques des matériels : architectures anciennes (avant 2015)*

#### Matériels modernes (2015 à 2019)

| Marque | Modèle | Sous-modèle | Année | Architecture | Litho (nm) | Fréq. base/boost | Cores/Threads | Cache L1i/L1d | Cache L2 | Cache L3 |
|---|---|---|---|---|---|---|---|---|---|---|
| Intel | Core i3 | 6100 | 2015 | Skylake | 14 | 3.7 / 3.7 GHz | 2 / 4 | 32 / 32 ko | 256 ko | 3 Mo |
| AMD | Ryzen 7 | 1700X | 2017 | Zen | 14 | 3.4 / 3.8 GHz | 8 / 16 | 64 / 32 ko | 512 ko | 8+8 Mo |
| Intel | Core i5 | 7400 | 2017 | Kaby Lake | 14 | 3.0 / 3.5 GHz | 4 / 4 | 32 / 32 ko | 256 ko | 6 Mo |
| Intel | Core i7 | 8700 | 2017 | Coffee Lake | 14 | 3.2 / 4.6 GHz | 6 / 12 | 32 / 32 ko | 256 ko | 12 Mo |
| AMD | Ryzen 5 | 3600 | 2019 | Zen 2 | 7 | 3.6 / 4.2 GHz | 6 / 12 | 32 / 32 ko | 512 ko | 16+16 Mo |
| Intel | Xeon | Silver 4208 | 2019 | Cascade Lake| 14 | 2.1 / 3.2 GHz | 8 / 16 | 32 / 32 ko | 1024 ko| 11 Mo |

*TABLE 10.2 – Caractéristiques des matériels : architectures modernes (2015 à 2019)*

#### Matériels récents (2020 et après)

| Marque | Modèle | Sous-modèle | Année | Architecture | Litho (nm) | Fréq. base/boost | Cores/Threads | Cache L1i/L1d | Cache L2 | Cache L3 |
|---|---|---|---|---|---|---|---|---|---|---|
| Intel | Core i7 | 10850H | 2020 | Comet Lake | 14 | 2.7 / 5.1 GHz | 6 / 12 | 32 / 32 ko | 256 ko | 12 Mo |
| AMD | Ryzen 5 | 5600G | 2021 | Zen 3 | 7 | 3.9 / 4.4 GHz | 6 / 12 | 32 / 32 ko | 512 ko | 16 Mo |
| Intel | Core i5 | 12400F | 2022 | Alder Lake | Int. 7| 2.5 / 4.4 GHz | 6 / 12 | 32 / 48 ko | 1280 ko| 18 Mo |
| AMD | Ryzen 5 | 9600X | 2024 | Granite Ridge | TS. N4| 3.9 / 5.4 GHz | 6 / 12 | 32 / 48 ko | 1024 ko| 32 Mo |

*TABLE 10.3 – Caractéristiques des matériels : architectures récentes (2020 et suivantes)*
> *L'AMD Ryzen 5 9600X dispose des technologies AVX512 et FMA3 et utilise
également 32 Go de DDR5 Kingston (KF560C30-16) FURY Beast 6000 Mhz 30 CL.*

### 10.4.2 Mesures et Protocole

Nous avons défini deux types de tests principaux :

- **Le test de validité** : vérifie que l'ensemble des méthodes implantées produisent
  le même résultat.
- **Le test de performance** : évalue le temps d'exécution en faisant varier certains
  paramètres.

#### 10.4.2.1 Métriques reportées

Nous reportons deux mesures :
1. Le temps d'exécution du programme (`user time` mesuré via la commande système `/usr/bin/time -f`)
2. Le nombre de cycles de l'exécution (mesuré via `CPUTimer` / `rdtsc`) sans compter l'initialisation des données.

#### 10.4.2.2 Fiabilité des mesures

Pour les méthodes qui s'exécutent en quelques millisecondes, les temps d'exécution
peuvent varier (fréquences, processus concurrents). Il faut donc, lors des tests de performance :
- Ne pas utiliser souris et clavier.
- Éviter tout traitement en tâche de fond.

La librairie PHP *ezlib.php* calcule la moyenne des temps d'exécution (`average_time()`)
sur dix lancements.

> **Attention** : sur les dernières versions d'Ubuntu, la fréquence de fonctionnement peut s'avérer basse par défaut. On peut alors obliger l'OS à utiliser le *governor* performance :
> ```bash
> sudo apt-get install cpufrequtils
> echo 'GOVERNOR="performance"' | sudo tee /etc/default/cpufrequtils
> sudo systemctl disable ondemand
> ```

### 10.4.3 Premiers Tests (Chapitre 2) en 32 bits

Le chapitre 2 s'est penché sur l'instruction `bsr` (cf. section Bit Scan Reverse) et sur le crible d'Ératosthène (nombres premiers). Voici les mesures de performance :

#### Matériels anciens (Avant 2015) - Temps en ms/s

| Test | Pentium D 925 | Core 2 Q9300 | Core i7 860 | Phenom II X6 | Core i5 3570K | Core i7 4790 |
|---|---|---|---|---|---|---|
| `bsr` (fonction C) | 29.23 | 25.70 | 15.47 | 17.90 | 15.79 | 13.48 |
| `bsr` (`__builtin_clz`) | 3.39 | 1.80 | 1.52 | 1.81 | 1.20 | 0.55 |
| `bsr` (asm + bsr) | 1.78 | 1.33 | 0.67 | 1.70 | 0.60 | 0.42 |
| Premier (v1) | 7154.93 | 3003.00 | 3513.00 | 6214.00 | 1327.00 | 1163.00 |
| Premier (v2) | 0.64 | 0.18 | 0.28 | 0.44 | 0.13 | 0.08 |
| Crible (v3) | 0.02 | 0.01 | 0.01 | 0.02 | 0.01 | 0.00 |

*TABLE 10.4 – Tests des matériels anciens (32 bits)*

#### Matériels modernes (2015 à 2019) - Temps en ms/s

| Test | Core i3 6100 | Ryzen 7 1700X | Core i5 7400 | Core i7 8700 | Ryzen 5 3600 | Xeon 4208 |
|---|---|---|---|---|---|---|
| `bsr` (fonction C) | 13.56 | 10.52 | 14.42 | 10.40 | 9.44 | 16.43 |
| `bsr` (`__builtin_clz`) | 0.63 | 0.49 | 0.61 | 0.46 | 0.45 | 0.21 |
| `bsr` (asm + bsr) | 0.47 | 1.04 | 0.44 | 0.33 | 0.96 | 0.51 |
| Premier (v1) | 1082.25 | 1859.59 | 1154.00 | 895.17 | 1726.93 | 1263.00 |
| Premier (v2) | 0.11 | 0.20 | 0.12 | 0.07 | 0.18 | 0.15 |
| Crible (v3) | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 | 0.00 |

*TABLE 10.5 – Test des matériels modernes en architecture 32 bits*

> Sur un Xeon Silver 4208, le temps de calcul extrêmement faible de `__builtin_clz` (0,21s ou ~0,09s en 64 bits) est dû à l'optimisation extrême du compilateur (usage de `vplzcntd` via AVX512-VL / AVX512-CD). Sur CPU AMD modernes, l'instruction assembleur pure `bsr` seule ne semble par contre pas spécialement efficace face aux CPUs Intel comparables.

#### Matériels récents (2020 et après) - Temps en ms/s

| Test | Core i7 10850H | Ryzen 5 5600G | Core i5 12400F | Ryzen 5 9600X |
|---|---|---|---|---|
| `bsr` (fonction C) | 10.01 | 7.65 | 11.33 | 8.37 |
| `bsr` (`__builtin_clz`) | 0.44 | 0.46 | 0.33 | 0.40 |
| `bsr` (asm + bsr) | 0.31 | 0.92 | 0.25 | 0.22 |
| Premier (v1) | 815.96 | 676.94 | 691.73 | 554.30 |
| Premier (v2) | 0.08 | 0.07 | 0.08 | 0.04 |
| Crible (v3) | 0.00 | 0.00 | 0.02 | 0.00 |

*TABLE 10.6 – Test des matériels récents 2020 et après en architecture 32 bits*
