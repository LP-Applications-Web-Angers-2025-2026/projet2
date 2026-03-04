# Chapitre 9 : Algèbre de Boole

## 9.1 Introduction

Nous rappelons que ce chapitre est quelque peu digressif par rapport à l'apprentissage de la programmation en assembleur, mais il se base sur l'algèbre de Boole qui utilise le **ET**, le **OU** et le **NON**, opérations disponibles en assembleur en tant que mnémoniques `and`, `or`, `not`.

L'algèbre de Boole, du nom du mathématicien, logicien et philosophe britannique George Boole (1815-1864), est une partie des mathématiques qui s'intéresse à une approche algébrique de la logique. La logique possède bien évidemment un volet sémantique et l'algèbre de Boole vient renforcer la sémantique logique en remplaçant le vrai et le faux par le 1 et le 0, le **ET** et le **OU** par les opérateurs `+` et `·` (addition et multiplication).

Cette vision arithmétique de la logique a permis de mettre au point un système de calcul qui possède des applications dans la mise au point de circuits électroniques et autorise à aborder les problèmes de la logique sous un angle différent, ce qui peut, dans certains cas, donner la possibilité de résoudre un problème beaucoup plus simplement ou rapidement. Nous en verrons un exemple en fin de chapitre avec le problème des pigeons.

Concernant les circuits électroniques ce sont eux qui exécutent les mnémoniques de l'assembleur comme `add`, `mul`, `div`, etc. Nous verrons comment on implante un demi-additionneur et un additionneur. On suppose que le lecteur possède des notions de logique propositionnelle.

## 9.2 Principes de base

Soit un ensemble `A = {0, 1}` pour lequel on a `0 ≤ 1`. On définit alors les
opérations suivantes sur `A` :

- l'addition : `a + b` dont la sémantique est `max(a, b)`
- la multiplication : `a · b = min(a, b)`
- la complémentation (négation) : `x` surligné (que l'on notera ici `~x` ou `x'`), avec `~0 = 1` et `~1 = 0`

Une variable complémentée `~x` est également dite signée ou négative.

| a | b | a + b | a · b |
|---|---|---|---|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 1 | 1 |

*TABLE 9.1 – Interprétation sémantique des opérations + et .*

Le quadruplet `(A, +, ·, ~)` est appelé algèbre de Boole s'il respecte les axiomes
suivants :

1. commutatives et associatives :
   `a + b = b + a`
   `a · b = b · a`
   `(a + b) + c = a + (b + c)`
   `(a · b) · c = a · (b · c)`
2. `0` est élément neutre pour l'addition et `1` est élément neutre pour la multiplication :
   `0 + a = a`
   `1 · a = a`
3. distributives l'une par rapport à l'autre :
   `(a + b) · c = a · c + b · c`
   `(a · b) + c = (a + c) · (b + c)`
4. `a = a` et vérifie les propriétés suivantes :
   `a + ~a = 1`
   `a · ~a = 0`

Si l'on rapporte ces opérations à la logique, alors :
- `1` indique le caractère vrai d'une propriété ou d'un énoncé
- `0` indique le caractère faux
- L'addition (`+`) correspond au OU
- La multiplication (`.`) correspond au ET
- La complémentation `~a` correspond à NON (noté ¬ en logique), i.e. le contraire de `a`

C'est grâce à cette modélisation de la logique sous forme d'opérations arithmétiques que l'on peut simplifier certains traitements modélisés sous forme de
fonctions booléennes.

## 9.3 Fonctions booléennes

On appelle fonction booléenne, une application de `A^n` dans `A` :
`(x1, x2, ..., xn) → f(x1, x2, ..., xn)`

La manière la plus simple de définir une fonction booléenne `f` est de donner sa table de vérité. Les variables prenant leurs valeurs dans `A = {0,1}`, une fonction de `n` variables possède donc `Card(A^n) = 2^n` lignes.

Exemple pour `f1(x, y, z)` :

| Ligne | x | y | z | f1(x, y, z) |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 1 |
| 1 | 0 | 0 | 1 | 0 |
| 2 | 0 | 1 | 0 | 0 |
| 3 | 0 | 1 | 1 | 1 |
| 4 | 1 | 0 | 0 | 0 |
| 5 | 1 | 0 | 1 | 0 |
| 6 | 1 | 1 | 0 | 1 |
| 7 | 1 | 1 | 1 | 1 |

À partir de la table de vérité, on peut donner une expression sous forme de somme de monômes :
- on exprime les monômes pour les lignes pour lesquelles `f1(x,y,z) = 1`
- si une variable est à `0` sur cette ligne, on utilise son complément

`f1(x, y, z) = (~x · ~y · ~z) + (~x · y · z) + (x · y · ~z) + (x · y · z)`

> **Notation** : Il existe un moyen plus simple de décrire la table de vérité en indiquant les lignes de la table qui comportent des `1`. Ainsi, une fonction peut être décrite par `f(x, y, z, t) = (3, 4, 5, 6, 7, 9, 13, 14, 15)` ou `(3-7, 9, 13-15)`.

### 9.3.1 Fonctions à 2 variables

Dans le cas particulier des fonctions à 2 variables `f(x,y)`, on peut définir 16 fonctions différentes dont :

- `or(x, y)` : le OU : `x + y`
- `and(x, y)` : le ET : `x · y`
- `nor(x, y) = ~or(x, y)` : le NON-OU : `~(x + y)`
- `nand(x, y) = ~and(x, y)` : le NON-ET : `~(x · y)`
- `xor(x, y)` : le OU exclusif : `x · ~y + ~x · y = x ⊕ y`

| x | y | or | and | xor | nor | nand |
|---|---|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 | 1 | 1 |
| 0 | 1 | 1 | 0 | 1 | 0 | 1 |
| 1 | 0 | 1 | 0 | 1 | 0 | 1 |
| 1 | 1 | 1 | 1 | 0 | 0 | 0 |

#### 9.3.1.1 and(x,y) (ET logique)

Le ET logique vaut 1 uniquement si ses deux opérandes valent 1.

| x | y | and(x, y) |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

*TABLE 9.2 – La fonction and(x,y)*

```c
if ((0 < a) && (a < 11)) {
    // a est compris entre 1 et 10
} else {
    // a est en dehors de l'intervalle [1..10]
}
```

#### 9.3.1.2 or(x,y) (OU Logique)

Le OU logique vaut 0 uniquement si ses deux opérandes valent 0.

| x | y | or(x, y) |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 1 |

*TABLE 9.3 – La fonction or(x,y)*

#### 9.3.1.3 xor(x,y) (OU Exclusif Logique)

Le OU Exclusif vaut 0 uniquement si ses deux opérandes ont la même valeur.

| x | y | xor(x, y) |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

*TABLE 9.4 – La fonction xor(x,y)*

#### 9.3.1.4 Lois de De Morgan

Les lois de De Morgan permettent d'exprimer la transformation de la négation :

- `~(x · y) = ~x + ~y`
- `~(x + y) = ~x · ~y`

## 9.4 Simplification des fonctions

L'intérêt de l'algèbre de Boole est qu'elle permet de simplifier les fonctions
booléennes comme on le ferait d'une expression algébrique.

### 9.4.1 Memento des règles

| Loi | Forme + | Forme · |
|---|---|---|
| élément neutre | (R1) `x + 0 = x` | (R2) `x · 1 = x` |
| d'idempotence | (R3) `x + x = x` | (R4) `x · x = x` |
| d'inversion | (R5) `x + ~x = 1` | (R6) `x · ~x = 0` |
| d'absorption | (R7) `x + x · y = x` | (R8) `x · (x + y) = x` |
| De Morgan | (R9) `~(x + y) = ~x · ~y` | (R10) `~(x · y) = ~x + ~y` |
| commutativité | (R11) `x + y = y + x` | (R12) `x · y = y · x` |
| associativité | (R13) `x + (y + z) = (x + y) + z` | (R14) `x · (y · z) = (x · y) · z` |
| distributivité | (R15) `x · (y + z) = x · y + x · z` | (R16) `x + y · z = (x + y) · (x + z)` |

On utilise également d'autres formules de simplification parmi lesquelles :
- (R17) `x + ~x · y = x + y`
- (R18) `x · y + x · z + ~y · z = x · y + ~y · z`

### 9.4.2 Tableaux de Karnaugh

La méthode des tableaux de Karnaugh (Maurice Karnaugh, 1953) est un
procédé de simplification visuel qui s'applique (judicieusement) jusqu'à 6 variables.

Elle consiste à la représentation matricielle pour grouper les 1 par `2^n`. Chaque déplacement représente la variation d'une seule variable (Code de Gray).

Exemple de `f4(x, y, z) = (~x · ~y · ~z) + (~x · y · z) + (x · ~y · z) + (x · y · ~z) + (x · y · z)`

En regroupant les adjacences par puissance de 2, on élimine les variables dont l'état n'a plus d'importance.

## 9.5 Portes Logiques

Les expressions booléennes sont représentables de manière graphique en
utilisant des portes logiques: NOT, AND, OR.

Elles sont toutes modélisables à partir d'une seule porte universelle: la porte **NAND** (ou **NOR**).

- `~x = ~(x · x)`
- `x · y = ~ ( ~(x · y) · ~(x · y) )`
- `x + y = ~( ~x · ~y )`

## 9.6 Circuits Logiques

L'algèbre de Boole permet de modéliser le fonctionnement des circuits.

### 9.6.1 Le demi-additionneur

Il calcule `x + y` avec 2 entrées (`x, y`) et 2 sorties (`S` Somme, `Rs` Retenue).

| x | y | S | Rs |
|---|---|---|---|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 1 |

*TABLE 9.5 – Table de vérité du demi-additionneur*

`S(x, y) = x ⊕ y`
`Rs(x, y) = x · y`

### 9.6.2 L'additionneur complet

Il comporte trois entrées (`x, y, Re` retenue en entrée) et calcule la somme.

| x | y | Re | S | Rs |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 1 | 0 |
| 0 | 1 | 0 | 1 | 0 |
| 0 | 1 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 | 0 |
| 1 | 0 | 1 | 0 | 1 |
| 1 | 1 | 0 | 0 | 1 |
| 1 | 1 | 1 | 1 | 1 |

*TABLE 9.6 – Table de vérité de l'additionneur*

`S(x, y, Re) = x ⊕ y ⊕ Re`
`Rs(x, y, Re) = x · y + (x ⊕ y) · Re`

### 9.6.3 Le soustracteur

| Re | x | y | S | Rs |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 1 | 1 |
| 0 | 1 | 0 | 1 | 0 |
| 0 | 1 | 1 | 0 | 0 |
| 1 | 0 | 0 | 1 | 1 |
| 1 | 0 | 1 | 0 | 1 |
| 1 | 1 | 0 | 0 | 0 |
| 1 | 1 | 1 | 1 | 1 |

*TABLE 9.7 – Table de vérité du soustracteur*

`S(x, y, Re) = x ⊕ y ⊕ Re` (identique à l'addition)
`Rs(x, y, Re) = ~x · y + ~(x ⊕ y) · Re`

## 9.7 Arithmétique vs Booléen en C

Il est possible d'exprimer les portes logiques sous forme de formules arithmétiques
avec `x` et `y` dans l'intervalle `[0, 1]`.

- `not(x) = 1 - x`
- `or(x, y)  = x + y - (x * y)`
- `and(x, y) = x * y`
- `xor(x, y) = x + y - (2 * x * y)`

```c
int not1(int x) { return 1 - x; }
int or2(int x, int y) { return x + y - x * y; }
int and2(int x, int y) { return x * y; }
int xor2(int x, int y) { return x + y - 2 * x * y; }
```

## 9.8 Résolution de problèmes (Pigeons)

### 9.8.1 Le problème des pigeons (Tiroirs et chaussettes)

Étant donné `n` pigeons et `q` pigeonniers. Chaque pigeonnier ne peut accueillir qu'au maximum un seul pigeon. Pour avoir une solution valide sans pigeon superflu, il faut `n ≤ q`.

Pour modéliser en logique, on définit les variables booléennes $x_{ij}$ : vraie si le pigeon $i$ est dans le pigeonnier $j$.
On génère alors de nombreuses clauses (disjonctions). Plus `n` et `q` augmentent, plus le solveur d'arbre logique (comme Otter) cherchera, par *hyper-résolution*.

### 9.8.2 Solveur de Cardinalité (Amélioration)

Il est plus simple de le modéliser à l'aide de l'opérateur de cardinalité : `#(min, max, {Liste})`
- Condition ligne (1 pigeon = 1 emplacement) : `#(1, 1, {x1, ..., xq})`
- Condition colonne (1 pigeonnier = au plus 1 pigeon) : `#(0, 1, {y1, ..., yn})`

| n (Pigeons) | q (Pigeonniers) | Solutions | Solveur Clauses | Solveur Contraintes | Amélioration |
|---|---|---|---|---|---|
| 10 | 10 | 3 628 800 | 428 s | 7 s | × 61 |
| 10 | 9 | 0 | 44 s | 0,7 s | × 62 |
| 11 | 11 | 39 916 800 | 6728 s | 87 s | × 77 |
| 11 | 10 | 0 | 644 s | 7 s | × 92 |

*TABLE 9.8 – Temps de résolution (AMD Ryzen 5 3600)*

## 9.9 Bilan

Nous avons vu comment l'algèbre de Boole simplifie certaines expressions (simplifier l'implantation de silicium des transistors) et permet de résoudre des problèmes via la SAT / Cardinalité.

## 9.10 Exercices

**Exercice 39** – Démontrez algébriquement les égalités suivantes :
(a) `Y~Z + YZ + ~Y~Z + ~Y·Z = 1`
(b) `A~B + AB + ~A·B = A + B`
(c) `A + AB + AC + A·B·C = A + B + C`
(d) `AB + A·C·D + A·BD + A·B·C·D = A·C·D + B`
(e) `~XY + ~XZ + ~Y~Z = ~XY + ~XZ`
(f) `X + XY = X + Y`

**Exercice 40** – Simplifiez les expressions suivantes :
(a) `ABC + A~BC + A~B~C`
(b) `(A+B)(~A+B)`
(c) `(A+B+AB)(AB+AC+BC)`
(d) `X+Y(~Z+X+Z)`
(e) `WX(Z+Y~Z) + X(W+W~YZ)`

**Exercice 41** – Simplifiez ces fonctions à l'aide d'un tableau de Karnaugh :
(a) `F(X,Y,Z) = (1,3,6,7)`
(b) `G(X,Y,Z) = (0,3,4,5,7)`
(c) `H(A,B,C,D) = (1,5,9,12,13,15)`

**Exercice 42** – `pigeon_hole_generator.exe` : Écrire le générateur C++ de problèmes pigeon/pigeonnier.
**Exercice 43** – `clauses_solver.exe` : Créer un algorithme de résolution récursif d'arbre de clauses.
**Exercice 44** – `constraints_solver.exe` : Créer un algorithme de résolution via les contraintes de cardinalité `beta`.
