# Chapitre 2 : Représentation de l'information

## 2.1 Informaticien vs mathématicien

Etre informaticien demande de penser d'une certaine manière qui est différente
de la manière de penser des mathématiciens : un informaticien d'un bon niveau ne
fera pas forcément un mathématicien d'un bon niveau et inversement.

Par exemple : les mathématiciens travaillent avec la notion d'infini alors que
les informaticiens travaillent dans des domaines finis : la taille de la mémoire, la
taille du disque dur, le nombre de processeurs utilisés pour réaliser un calcul en
parallèle, toutes ces quantités sont finies.

Un mathématicien peut dire que : quand *n* tend vers l'infini, *1/n* tend vers 0
mais ne sera jamais égal à 0. Pour un informaticien, à partir d'une certaine valeur
de *n*, il remplacera *1/n* par 0 car il aura dépassé la capacité de représentation d'un
très petit nombre.
Du point de vue de la démarche, un mathématicien va démontrer qu'un problème
admet ou non des solutions dans telles conditions mais sans donner ces
solutions. La réponse sera généralement de type oui ou non : oui, le problème
admet une solution, ou non, il n'en admet pas. Le mathématicien peut également
nous indiquer comment construire une solution.
L'informaticien va s'attacher à trouver une, ou toutes les solutions, ou à prouver
qu'on ne trouvera pas de solution en résolvant le problème : c'est à dire en tentant
de trouver une solution et en ne pouvant, au final, n'en trouver aucune en ayant
testé tous les cas possibles ; la réponse sera une solution, la ou les meilleures pour
un critère donné, ou aucune.
Au niveau de la machine l'information est représentée sous forme binaire avec
des suites de 0 et de 1. Il est donc primordial de comprendre comment l'information
(entiers, réels, texte) est représentée en informatique si on désire raisonner comme
un informaticien puisque c'est de cette représentation :

- que l'on peut déduire la limite des calculs possibles que l'on pourra réaliser
- mais également, trouver les traitements les plus efficaces pour résoudre un problème donné

A titre d'exemple, considérons un traitement qui s'attache à déterminer si un
nombre entier est impair ou, en d'autres termes, comment sait-on qu'un nombre
entier est impair ?

Facile, me direz-vous, il suffit que ce nombre se termine par l'un des chiffres
suivants : 1, 3, 5, 7, 9. Mais comment procéder avec un ordinateur ?

Une première solution consiste à faire ce que font les humains : extraire le
chiffre unité du nombre et le comparer à 1, 3, 5, 7 ou 9 :

```cpp
#include <iostream>
using namespace std;

int main(int argc, char *argv[]) {
    int x = 123789;
    if (argc > 1) x = atoi(argv[1]);
    // extraire l'unité
    int u = x % 10;
    // la comparer
    if ((u == 1) || (u == 3) || (u == 5) || (u == 7) || (u == 9))
        cout << x << " est impair" << endl;
    else
        cout << x << " est pair" << endl;
    return 0;
}
```

> *Listing 2.1.1 – Déterminer si un entier est impair, méthode 1*

Voici le code assembleur x86 64 bits qui correspondrait au code C précédent
pour la partie comparaison. Ici, on retourne la valeur `1` dans le registre `eax` pour
indiquer que le nombre est impair et `0` pour indiquer qu'il est pair :

```nasm
global est_impair
section .text
; code 64 bits
; bool est_impair(int n)
; n => edi
est_impair:
    mov eax, edi    ; eax <- edi
    xor edx, edx    ; edx <- 0
    mov ecx, 10     ; ecx <- 10
    div ecx         ; eax <- eax / ecx, (u) edx <- eax % ecx
    mov eax, 1      ; eax <- 1, valeur de retour true
    cmp edx, 1      ; si u == 1 alors sortir de la fonction
    je .end
    cmp edx, 3      ; si u == 3 alors sortir de la fonction
    je .end
    cmp edx, 5      ; si u == 5 alors sortir de la fonction
    je .end
    cmp edx, 7      ; si u == 7 alors sortir de la fonction
    je .end
    cmp edx, 9      ; si u == 9 alors sortir de la fonction
    je .end
    xor eax, eax    ; sinon, le nombre est pair on sort avec la valeur 0 (false)
.end:
    ret
```

> *Listing 2.1.2 – Déterminer si un entier est impair, assembleur méthode 1*
Comme nous n’avons pas encore vu d’instructions assembleur, quelques explica-
tions s’imposent. Les lignes 9 à 12 calculent le reste de la division de n par 10, le
modulo. Celui-ci est obtenu dans le registre `edx` après utilisation de l’instruction
`div` qui réalise la division. On place ensuite en ligne 13 la valeur 1 (true) dans `eax`
car c’est, par convention, ce registre qui contient la valeur retournée par la fonction.
Les lignes 14 à 23 ne font que comparer le reste de la division à 1, 3, 5, 7 puis 9,
et, s’il s’agit de l’une de ces valeurs, on se dirige directement vers la sortie de la
fonction. Finalement, si le reste n’est pas un chiffre impair, on met, en ligne 24, `eax`
à 0 (false), puis on sort de la fonction.
Un informaticien ne procédera pas ainsi, il sait que la représentation binaire
des nombres fait que, si un nombre est impair, il possède son premier bit (bit en
position 0) à 1, étant donné que c’est la seule puissance de 2 impaire. Il effectuera
donc un ET-binaire avec le nombre et vérifiera que le résultat est égal à 1 ou qu’il
est différent de 0, ce qui revient au même :
1#include
2using ;
4int (int ,char*argv[]

```text
int =123789;
if(argc>1)x=atoi(argv[1]
if((x&1) 0)
cout<<x<<" est impair"<<endl;
}else{
cout<<x<<" est pair"<<endl;
}
return ;
16}
```

Au final, le calcul réalisé par un informaticien, ou tout au moins une personne
qui possède des connaissances en informatique, est moins coûteux en temps de
calcul et moins soumis à certains aléas.

Un test réalisé pour comparer les deux méthodes, et, qui consiste
à répéter 50 000 fois l'application de l'une des deux fonctions précédentes sur les
éléments d'un tableau de 100 000 entiers générés dans des conditions spécifiques
(voir ci-après), donne les résultats suivants :

| Initialisation | Méthode 1 | Méthode 2 |
|---|---|---|
| aléatoire | 38.42 | 5.28 |
| nombres ...1 | 12.04 | 5.44 |
| nombres ...3 | 12.23 | 5.41 |
| nombres ...5 | 12.45 | 5.29 |
| nombres ...7 | 12.86 | 5.40 |
| nombres ...9 | 14.81 | 5.50 |
| pairs | 12.46 | 5.49 |

*TABLE 2.1 – Temps d'exécution (en secondes) des méthodes en fonction des nombres à traiter sur Intel Core i7-10850H*
La méthode d'initialisation des éléments du tableau peut être :

- **Aléatoire** : on aura autant de nombres pairs que de nombres impairs
- **Ne générer que des nombres impairs** se terminant par 1, 3, 5, 7 ou 9
- **Ne générer que des nombres pairs**

L'analyse des résultats montre que la méthode 1, traduction de la manière dont
procède un programmeur non expérimenté, est sensible aux données et se révèle
toujours moins efficace que la méthode 2. En effet, trouver si un nombre se termine
par 3 prend plus de temps que comparer si un nombre se termine par 1 car on
effectue un test supplémentaire, et ainsi de suite jusqu'à comparer si un nombre se
termine par 9, comme le montre le code assembleur ci-dessus.
Dans le cas de données aléatoires (nombres pairs ou impairs sans ordre précis),
on note que le temps d'exécution est prohibitif (exorbitant) avec la méthode 1. Cela
est dû à la prédiction de branchement (cf. Section 5.2) qui ne peut déterminer
sur quelle valeur de l'unité sortir de la fonction.
Dans ce cas, la méthode 2 est **7,27** (= 38,42/5,28) fois plus performante que la
méthode 1.

## 2.2 Représentation des entiers

Pour représenter un nombre entier naturel dans une base *b*, il faut disposer de *b*
chiffres distincts allant de *0* à *b−1*. Tout nombre *n* s'exprime alors sous la forme :

*n = Σ(i=0..k) aᵢ × bⁱ* &nbsp;&nbsp;&nbsp;&nbsp;(2.1)

où chaque *aᵢ* est un chiffre. Ainsi en base 10, on peut écrire :

*1975₁₀ = 1×1000 + 9×100 + 7×10 + 5×1 = 1×10³ + 9×10² + 7×10¹ + 5×10⁰*

En informatique, on utilise la base 2 ou binaire mais il est parfois plus facile
d'utiliser d'autres bases comme l'octal (base 8) ou l'hexadécimal (base 16) afin de
représenter de grandes quantités ou de faire des calculs.

### 2.2.1 Binaire (base 2)

Dans la notation binaire, également appelée base 2, on ne dispose que de deux
chiffres 0 et 1. Par exemple `11001`₂ représente la valeur décimale 25 :

*11001₂ = 1×2⁴ + 1×2³ + 0×2² + 0×2¹ + 1×2⁰ = 16₁₀ + 8₁₀ + 1₁₀ = 25₁₀*

> **Notation**
> J'ai choisi de mettre en indice de chaque nombre la base à laquelle il se
> rapporte. Quand on ne le précise pas il s'agit par défaut de la base 10.
> Dans la suite de l'ouvrage, afin d'améliorer la lisibilité des nombres j'utilise
> le symbole souligné (`_`) après chaque quartet pour les nombres binaires ou
> chaque triplet pour les nombres décimaux :
> `110101010102` = `110_1010_1010`₂ = 1706₁₀ = `1_706`₁₀ = `1_706`

On pourra également utiliser la notation suivante :

- `b` pour le binaire : `1011_0001b` ou `1011_0001`₂
- `o` pour l'octal : `261o` ou `261`₈
- `d` pour le décimal : `177d` ou `177`₁₀ ou `177`
- `h` pour l'héxadécimal : `B1h` ou `B1`₁₆

En binaire un chiffre est appelé un **bit** pour *BInary digiT*. On distingue généralement
dans un nombre binaire le bit (ou chiffre) le plus à gauche qui est appelé bit de
**poids fort** (ou *most significant bit* en anglais) et le bit le plus à droite appelé bit de
**poids faible** (ou *least significant bit*).

| n | Valeur de 2ⁿ | n | Valeur de 2ⁿ |
|---|---|---|---|
| 0 | 1 | 8 | 256 |
| 1 | 2 | 9 | 512 |
| 2 | 4 | 10 | 1 024 |
| 3 | 8 | 11 | 2 048 |
| 4 | 16 | 12 | 4 096 |
| 5 | 32 | 13 | 8 192 |
| 6 | 64 | 14 | 16 384 |
| 7 | 128 | 15 | 32 768 |
| 16 | 65 536 | 31 | 2 147 483 648 |
| 17 | 131 072 | 32 | 4 294 967 296 |
| 63 | 9 223 372 036 854 775 808 | 64 | 18 446 744 073 709 551 616 |

*TABLE 2.3 – Liste de puissances de 2 de 2⁰ à 2⁶⁴*
Etant donné qu'en informatique on travaille toujours sur une quantité finie, on
a introduit des termes pour identifier un nombre de bits consécutifs déterminé :

- Un ensemble de 4 bits consécutifs est appelé un **quartet**
- Un ensemble de 8 bits consécutifs est appelé un **octet** (*byte* en anglais)
- Deux octets consécutifs (16 bits) forment un **mot** (*word*)
- Quatre octets consécutifs (32 bits) forment un **double mot** (*double word*)
- Huit octets consécutifs (64 bits) forment un **quadruple mot** (*quad word*)
- Seize octets consécutifs (128 bits) forment un **double quadruple mot** (*double quad word*)

Quand on travaille en tant qu'informaticien il est généralement très utile de
connaître les puissances de 2 allant de 2¹ jusqu'à 2¹⁶ (voire jusqu'à 2²⁰) car cela
permet de réaliser certains calculs de tête. Je recommande à tout informaticien
d'apprendre la Table 2.3.

Il est également nécessaire de connaître les puissances de 2 proches des
puissances de 10 (cf. Table 2.4) puisqu'elles définissent la taille des mémoires et espaces
de stockage. Elles sont basées sur les préfixes du Système International (SI) d'unités
et simplifient la manipulation des grandes quantités.

| Puissance | Préfixe | Puissance | Préfixe |
|---|---|---|---|
| 2¹⁰ | kilo | 2⁵⁰ | Peta |
| 2²⁰ | Mega | 2⁶⁰ | Exa |
| 2³⁰ | Giga | 2⁷⁰ | Zetta |
| 2⁴⁰ | Tera | 2⁸⁰ | Yotta |

*TABLE 2.4 – Liste de puissances de 2 liées aux puissances de 10*

La phrase introductive de ce chapitre reprend dans l'ordre, pour chaque mot, la
première lettre des préfixes : ainsi le K de Karla correspond à kilo, le M de Mangeait
correspond à Mega, etc. Il s'agit d'un moyen mnémotechnique pour se rappeler
l'ordre des préfixes du SI.

Certains constructeurs comme les fabricants de disques durs préfèrent utiliser
l'exposant 3 au lieu de 1024. Un disque de 80 Gigaoctets, qui possède un espace de stockage
de 80 × 10⁹ octets, apparaît pour le système d'exploitation comme un disque de
74 Gigaoctets[^disk74].

[^disk74]: 1,80 × 10⁹ / 1024³ = 74,5

### 2.2.2 Octal (base 8)

La base 8 est utilisée pour représenter des octets comme par exemple des
caractères mais elle est en général peu usitée. On la retrouve lors de l'utilisation de
commandes Unix comme `chmod` qui change les droits d'un fichier ou `tr` qui permet
de transposer ou d'éliminer des caractères dans un fichier ou un flux de données.
Voici, par exemple, deux commandes Unix qui utilisent l'octal :

```shell
richer@universe:~$ chmod 644 fichier
richer@universe:~$ tr ':' '\012' < fichier
```

La première ligne donne au propriétaire les droits de modification et lecture,
aux membres du groupe et aux autres uniquement les droits de lecture sur le fichier.
La seconde permet de remplacer le caractère `':'` par un saut de ligne car `012`₈ = `10`₁₀
ce qui correspond au caractère *LF* (line feed). Il faut noter que le nombre commence par un
`0` qui indique qu'il faut lire la valeur en octal.

**Binaire vers l'octal** : Le passage du binaire à l'octal est simple puisqu'un triplet (3 bits consécutifs)
correspond à un chiffre octal.

### 2.2.3 Hexadécimal (base 16)

La base 16 permet de représenter des adresses ou des nombres utilisant plusieurs
bits comme les double et quadruple mots. Ainsi un double mot qui occupe 32 bits,
soit 32 chiffres en binaire, utilise seulement 8 chiffres hexadécimaux.
Dans la base 16 on utilise les chiffres `0` à `9` ainsi que des lettres pour représenter
les chiffres supérieurs ou égaux à 10 en partant de `A` qui vaut 10 pour aller jusqu'à
`F` qui vaut 15 en décimal :

*A2F8₁₆ = A×16³ + 2×16² + F×16¹ + 8×16⁰ = 41 720 = 10×16³ + 2×16² + 15×16¹ + 8×16⁰*

On remarquera qu'en C ou en assembleur on peut écrire les nombres hexadécimaux
en les préfixant avec `0x`, on écrira donc `0xA2F8`.

**Binaire vers l'hexadécimal** : Le passage du binaire à l'hexadécimal est simple puisqu'un quartet (4 bits
consecutifs) correspond à un chiffre hexadécimal.

### 2.2.4 Entiers naturels (non signés)

Les entiers naturels *ℕ* sont des entiers positifs ou nul, ils sont généralement
représentés en langage C par le type `unsigned int` ou encore par `uint32_t` du
fichier d'en-tête `stdint.h`, en d'autres termes il s'agit de valeurs dites non signées.

On a souvent besoin de convertir des nombres décimaux en binaire ou en
hexadécimal dès lors que l'on programme en assembleur. Pour passer d'un nombre
décimal en un nombre dans une autre base il existe plusieurs méthodes.

#### 2.2.4.1 Méthode des divisions successives

On réalise des divisions successives par la base *b* du nombre *n* à convertir. On
s'arrête lorsque le quotient de la division est inférieur à *b*, puis on prend le dernier
quotient et les restes successifs obtenus lors des divisions (cf. Figure 2.1).

*FIGURE 2.1 – Méthode des divisions successives par 2, 8 et 16*

Ainsi le nombre 189 en décimal s'écrit également :

- `1011_1101`₂
- `275`₈
- `BD`₁₆

#### 2.2.4.2 Méthode des intervalles

On applique ici la méthode au binaire mais elle peut être transposée à d'autres
bases. Si on connait les puissances de 2, il est plus facile de convertir les grands
nombres. En effet on n'est jamais à l'abris de commettre une erreur avec la méthode
des divisions successives. Avec la méthode des intervalles, on cherche entre quelles
puissances de 2 se trouve le nombre à convertir et on retranche la puissance la plus
petite comme sur l'exemple suivant :
- 189 est compris entre 128 et 256, il contient donc 128 = 2⁷
- 189 - 128 = 61 est compris entre 32 et 64, il contient donc 32 = 2⁵
- 61 - 32 = 29 est compris entre 16 et 32, il contient donc 16 = 2⁴
- 29 - 16 = 13 est compris entre 8 et 16, il contient donc 8 = 2³
- 13 - 8 = 5, et finalement 5₁₀ = `101`₂

On retrouve donc comme dans la méthode précédente que 189₁₀ = `1011_1101`₂.

#### 2.2.4.3 Méthode du complément

Enfin, si le nombre à convertir se trouve proche d'une puissance 2ᵏ, on peut
précéder par complément c'est à dire en calculant *2ᵏ − 1 − n*. Prenons un exemple :

`32_745` est proche de `32_768 = 2`¹⁵. Si on calcule *(2¹⁵ −1) − 32745*, on obtient 22
qui s'écrit en binaire `1_0110`₂. Il suffit alors de retirer les bits à 1 du nombre 22 à
*(2¹⁵ −1)* en utilisant par exemple l'opérateur `xor` (ou exclusif) :

```
111_1111_1111_1111₂ (32767)
xor       1_0110₂ (22)
= 111_1111_1110_1001₂ (32745)
```

#### 2.2.4.4 Capacité de représentation

En informatique, on travaille à quantité finie et on utilise pour représenter
l'information des octets, des mots, des double mots ou des quadruple mots. La
Table 2.5 montre pour un nombre fixé *n* de bits le nombre de valeurs différentes
que l'on peut représenter ainsi que les valeurs minimum et maximum si on utilise
des valeurs non signées.

| n bits | Valeur minimum | Valeur maximum | Nombre de valeurs |
|---|---|---|---|
| 8 | 0 | 255 | 256 |
| 16 | 0 | 65 535 | 65 536 |
| 32 | 0 | 4 294 967 295 | 4 294 967 296 |

*TABLE 2.5 – Entiers naturels représentés avec un nombre fixé de bits*

On peut résumer la Table 2.5 en disant qu'avec *n* bits on peut représenter *2ⁿ*
entiers naturels différents allant de 0 à *2ⁿ − 1*. Ainsi avec 32 bits on peut représenter
un peu plus de 4 milliards de valeurs différentes.

#### 2.2.4.5 Dépassement de capacité (*overflow*)

Que se passe t-il si on essaye de représenter la valeur 259 sur 8 bits ? Si, par
exemple, on ajoute 4 à 255, il se produit alors un dépassement de capacité (*overflow*)
ou débordement et la valeur obtenue est alors égale à *259 modulo 256 = 3*. On
rappelle que le modulo est le reste de la division entière, ici *259 = 256×1 + 3*,
donc 3 est le reste de la division entière de 259 par 256. La conséquence est que si
on ne prête pas attention au calcul ce dernier risque d'être erroné.

Considérons, par exemple, les entiers non signés sur 32 bits. Si on réalise la
somme des entiers naturels de 1 à *n*, à partir de quelle valeur de *n* la somme
n'est-elle plus exacte ? Ce problème est laissé à titre d'exercice de programmation.
Vous devriez normalement trouver la valeur limite de *n = 92 681*, ce qui
correspond à la somme *4 294 930 221*, soit une valeur proche de *2*³², au delà, le
calcul est inexact.

### 2.2.5 Entiers relatifs (signés)

L'ensemble des entiers relatifs *ℤ* représente les nombres entiers positifs, négatifs
ou nul. En langage C, il s'agit du type `int` ou `int32_t`, c'est à dire des valeurs
signées. Plusieurs représentations existent afin de pouvoir coder nombres positifs
et négatifs mais on utilisera la notation **binaire en complément à deux** qui permet
de réaliser des opérations arithmétiques dont le résultat sera correct. Dans cette
notation, les nombres positifs utilisent le même procédé de représentation que la
notation binaire de la section précédente.

Pour obtenir le codage en binaire en notation en complément à deux d'un
nombre *négatif*, on procède en commençant par fixer la taille de l'espace de codage
en nombre de bits, généralement 8, 16, 32 ou 64 bits. Prenons par exemple 8 bits.
On réalise ensuite la série d'opérations suivantes :
1. On code |x| du nombre que l'on code sur 8 bits
2. On réalise ensuite une opération de **complémentation** (x̅) c'est à dire que l'on
remplace les 0 par des 1 et inversement
3. On ajoute 1 au résultat

Ainsi, pour coder la valeur *x = −1* sur 8 bits en notation binaire en complément
à deux, on obtient :

```
|x| = 0000_0001₂
x̅   = 1111_1110₂
  + 0000_0001₂
  = 1111_1111̅₂
```

> **Notation** : On remarque alors que si le bit de poids fort est à 0, il s'agit d'une valeur
> positive ou nulle. Par contre si le bit de poids fort est à 1, il s'agit d'une valeur négative.
> On notera *x̅₂* un nombre en notation en complément à 2 afin de le différencier
> avec un nombre en notation binaire.

La Table 2.6 montre pour un nombre fixé *n* de bits quelles sont les valeurs
minimum, maximum et le nombre de valeurs différentes que l'on peut représenter.
On peut résumer la table en disant qu'avec *n* bits on peut représenter *2ⁿ*
entiers relatifs différents allant de *−2ⁿ⁻¹* à *+2ⁿ⁻¹ −1*.

| n bits | Valeur minimum | Valeur maximum | Nombre de valeurs |
|---|---|---|---|
| 8 | −128 | 127 | 256 |
| 16 | −32 768 | 32 767 | 65 536 |
| 32 | −2 147 483 648 | 2 147 483 647 | 4 294 967 296 |

*TABLE 2.6 – Entiers relatifs représentés avec un nombre fixe de bits*

#### 2.2.5.1 Dépassement de capacité for les entiers signés

De la même manière qu'avec les entiers naturels on peut avoir un dépassement
de capacité. Fixons la représentation sur 8 bits et considérons le nombre 126 auquel
on ajoute 3, on obtient alors 129 qui est en dehors de l'intervalle de représentation,
puisque pour 8 bits, la valeur maximale que l'on peut représenter est 127. Mais sur
8 bits, *129₁₀ = 1000_0001̅₂*. Etant donné que le bit de poids fort est à 1, cela signifie
qu'on traite un nombre négatif ! Comment un nombre positif peut-il être négatif ?

*FIGURE 2.2 – Intervalle de représentation des entiers relatifs sur 8 bits*

La raison est due au débordement. Comment savoir à quel nombre correspond
*1000_0001̅₂* ? Il suffit de réaliser les opérations inverses qui conduisent au codage
des nombres négatifs :

```
y  = 1000_0001̅₂
   − 0000_0001₂
   = 1000_0000₂
y̅  = 0111_1111₂
```

Donc *1000_0001̅₂* correspond finalement à la représentation binaire en complément
à deux de *−127*. Comme on peut le voir sur la Figure 2.2, à partir de 127,
si on se déplace dans le sens des aiguilles d'une montre de deux positions, on se
positionne sur *−127*. La boucle est bouclée !

Une autre méthode qui permet de savoir à quel nombre correspond *1000_0001̅₂*
consiste à ne pas considérer qu'il s'agit d'un nombre signé et de le convertir en
décimal et le soustraire à *2⁸*, si on a choisi une représentation sur 8 bits. Ici on
a *128 + 1 = 129*. On retranche alors 129 à 256 ce qui donne *256 − 129 = 127*. Le
nombre correspondait alors à *−127*.
De la même manière, si on a *1111_1011̅₂*, il s'agit de *255 − 4 = 251*. Si on calcule
*256 − 251*, on obtient 5. On en déduit que *1111_1011̅₂* correspond à *−5*.

## 2.3 Opérations arithmétiques binaires

Que ce soit en notation binaire naturelle pour les entiers non signés ou en
notation binaire en complément à deux pour les entiers signés, on applique les
mêmes schémas d'opérations qu'en arithmétique classique.

### 2.3.1 Addition

L'addition de deux nombres binaires est assez simple, il suffit d'appliquer les
règles suivantes :

- 0₂ + 0₂ = 0₂
- 0₂ + 1₂ = 1₂
- 1₂ + 0₂ = 1₂
- 1₂ + 1₂ = 10₂, on abaisse le 0 et on génère une retenue de 1
- Le dernier cas correspond à une retenue en entrée de 1, dès lors 1₂ + 1₂ + 1₂ = 11₂, on abaisse le premier 1 et on génère une retenue en sortie de 1

Ces règles s'appliquent aussi bien pour les nombres signés que les non signés.
Considérons une représentation des nombres sur 8 bits, pour le calcul de
`1101_1010`₂ + `1110_1111`₂. Dans ce cas on ne garde que les 8 premiers bits du résultat :

```
 Retenue(s) 1
  1 1 0 1 1 0 1 0
+ 1 1 1 0 1 1 1 1
= 1 1 0 0 1 0 0 1
```

Le résultat est-il correct ? Il suffit de traduire les nombres binaires en décimal
en décidant si on travaille avec des valeurs signées ou non signées :

- S'il s'agit de valeurs **non signées**, alors on effectue le calcul *218 + 239 = 457*
  qui modulo 256 est égal à 201
- S'il s'agit de valeurs **signées**, alors on effectue le calcul *−38 + (−17) = −55*
  qui est juste car *−55₁₀ = 1100_1001̅₂*

### 2.3.2 Multiplication

La multiplication fonctionne comme en décimal :

```
  1 1 1 1 1 1 1 0
× 1 1 1 1 1 1 0 1
  1 1 1 1 1 1 1 0
+ 0 . . . . . . .
+ 1 1 1 1 1 0 . .
+ 1 1 1 1 0 . . .
+ 1 1 1 0 . . . .
+ 1 1 0 . . . . .
+ 1 0 . . . . . .
+ 0 . . . . . . .
= 0 0 0 0 0 1 1 0
```

Le seul problème que l'on rencontre est celui de la somme des valeurs, on peut
alors procéder de deux manières différentes :

- **Soit en faisant la somme comme on le ferait en décimal :**

```
Colonnes  8 7 6 5 4 3 2 1
Retenues  1← 1← 1← 1←
  1 1 1 1 1 1 1 0
+ 1 1 1 1 1 0 0 0
+ 1 1 1 1 0 0 0 0
+ 1 1 1 0 0 0 0 0
+ 1 1 0 0 0 0 0 0
+ 1 0 0 0 0 0 0 0
= 0 0 0 0 0 1 1 0
```

Pour la cinquième colonne en partant de la droite on a une retenue en entrée
et trois 1, ce qui fait 4, soit `100`₂, on aura donc une retenue pour la septième
colonne. De la même manière, la somme des valeurs de la sixième colonne
donne *4 = `100`₂*, on aura donc une retenue de 1 pour la huitième colonne. Pour
la septième colonne on a 5 plus une retenue en entrée ce qui fait *6 = `110`₂*, ce
qui provoque une retenue pour la huitième et la neuvième colonne. Comme
on a fixé une représentation sur 8 bits, la retenue pour la neuvième colonne
ne doit pas être prise en compte. Enfin pour la huitième colonne, on a deux
retenues en entrée plus 6, ce qui fait *8 = `1000`₂*, on abaisse donc le premier 0
et on ne tient pas compte de la retenue pour la onzième colonne.

- **Soit en faisant des additions deux à deux :**

```
  1 1 1 1 1 1 1 0
+ 1 1 1 1 1 0 0 0
= 1 1 1 1 0 1 1 0  (s1)
  1 1 1 1 0 0 0 0
+ 1 1 1 0 0 0 0 0
= 1 1 0 1 0 0 0 0  (s2)
  1 1 0 0 0 0 0 0
+ 1 0 0 0 0 0 0 0
= 0 1 0 0 0 0 0 0  (s3)
  1 1 1 1 0 1 1 0  (s1)
+ 1 1 0 1 0 0 0 0  (s2)
= 1 1 0 0 0 1 1 0  (s4)
  0 1 0 0 0 0 0 0  (s3)
+ 1 1 0 0 0 1 1 0  (s4)
= 0 0 0 0 0 1 1 0  (s5)
```

Au final on obtient `0000_0110`₂. Si on se place dans le cadre de valeurs non
signées le calcul effectué est *254 × 253 = 64 262* qui modulo 256 donne 6 car
*64 262 = 251 × 256 + 6*. Si on considère que l'on traite des valeurs signées, on
effectue le calcul *−2 × −3 = 6*.

### 2.3.3 Soustraction

Le principe de la soustraction est le même qu'en décimal. Lorsque l'on calcule
*25 − 16*, on commence à s'intéresser aux unités. 5 étant inférieur à 6, on ajoute
une dizaine à 5 et on calcule *15 − 6* ce qui donne 9. On passe ensuite aux dizaines.
Sachant que l'on a ajouté une dizaine précédemment, on retire cette dizaine et on
calcule *2 − 1* auquel on retranche la dizaine, soit *2 − 1 − 1 = 0*.

Il suffit donc d'appliquer les règles suivantes :

- 0₂ − 0₂ = 0₂
- 0₂ − 1₂ : étant donné que 0 < 1 il faut calculer 10₂ − 1₂ = 1₂ et propager une retenue de 1
- 1₂ − 0₂ = 1₂
- 1₂ − 1₂ = 0₂
- 0₂ − (1₂ + retenue) = 0₂ − 10₂ : on ajoute une dizaine, ce qui donne 10₂ − 10₂ = 0₂ et on propage une retenue de 1
- 1₂ − (1₂ + retenue) = 1₂ − 10₂ : on ajoute une dizaine, ce qui donne 11₂ − 10₂ = 1₂ et on propage une retenue de 1

Voyons cela sur un exemple et calculons *5 − 10*, soit en binaire sur 4 bits
`0101`₂ − `1010`₂. Dans ce cas on ne garde que les 4 premiers bits du résultat :

```
Retenue(s) en sortie 1
  0 1 0 1
- 1 0 1 0
Retenue(s) en entrée 1
= 1 0 1 1
```

Soit au final `1011`₂ qui dans le cadre de la représentation signée en complément
à 2 correspond à *−5*. On a donc bien le résultat escompté.

#### 2.3.3.1 Soustraire 1 d'un nombre binaire

Pour soustraire 1 d'un nombre binaire *x*, il suffit :

- Si le nombre *x* se termine par un 1, de transformer ce 1 en 0
- Par contre, si le nombre se termine par un ou plusieurs 0, il suffit de trouver
  le premier bit à 1, puis de complémenter sur cette partie

Par exemple :

- `1101`₂ − 1 = `1100`₂
- `11_1000`₂ − 1 donne `11_0111`₂ puisqu'on prend le complément de `1000`₂

### 2.3.4 Division

La division, tout comme en décimal, est difficile à appréhender. Elle consiste à
diviser le dividende *n* par le diviseur *d* et obtenir un quotient *q* ainsi qu'un reste *r*.
On a donc *n = q × d + r*. On va considérer que *n ≥ d* par la suite.

Comment divise t-on en binaire ? Il suffit de rechercher la position (numéro du
bit) dans le dividende *n* où il est possible de soustraire le diviseur *d* le plus à gauche
possible, puis d'effectuer la soustraction. On réitère ensuite l'opération en plaçant
un 1 à droite du quotient et en le décalant de *k − 1* rangs vers la gauche lorsque
*k − 1 ≥ 0*, avec *k* qui représente la différence entre deux positions successives
comme on peut le voir sur l'exemple de la Figure 2.3.

*FIGURE 2.3 – Division binaire sur un exemple*

Dans cet exemple, on divise 1136 par 7. C'est à partir de la position (ou bit) 7
que l'on obtient au niveau du dividende, un nombre plus grand que le diviseur, en
l'occurrence `1000`₂ = 8. On soustrait alors 7 à 8, il nous reste 1 et on abaisse les
chiffres restants du dividende. Etant donné que l'on vient de soustraire une fois 7
au dividende, on place un 1 à droite du quotient qui était initialement égal à 0.

On s'intéresse alors au dividende modifié qui est `1111_0000`₂ et on trouve que
l'on peut lui retrancher le diviseur *7 = `111`₂* à partir de la position 5. On calcule
alors *k = 7 − 5 − 1 = 1*, il faut donc décaler le quotient de 1 rang vers la gauche.
Le quotient est alors `10`₂ et on place un 1 à droite du quotient qui devient `101`₂ en
raison de la soustraction effectuée.

Le dividende restant est alors `1_0000`₂. On peut lui retrancher le diviseur à partir
de la position 1. Dans ce cas, *k = 5 − 1 − 1 = 3*. On décale donc le quotient de 3
rangs vers la gauche, celui-ci devient alors `10_1000`₂.

On réalise la soustraction du diviseur au dividende et on place un 1 à droite du
quotient qui est à présent égal à `101_0001`₂.

Le dividende devient `10`₂, il est inférieur au diviseur donc on arrête la division,
mais comme la dernière soustraction a été réalisée en position 1, il est nécessaire de
décaler le quotient d'un rang vers la droite. Finalement le quotient est `1010_0010`₂,
soit 162 et le reste est de 2.

On peut en dégager l'algorithme suivant extrait d'une librairie C++ que j'ai
écrite :

```cpp
int pos = greater_or_equal_at(dividend, divisor);
while (pos >= 0) {
    quotient.shl(1);
    quotient.set_bit(BIT_0, 1);
    sub_at(dividend, divisor, pos);
    int next_pos = greater_or_equal_at(dividend, divisor);
    int shift = pos - next_pos - 1;
    if (shift > 0) quotient.shl(shift);
    pos = next_pos;
}
```

Ce code repose sur l'utilisation d'une structure de données appelée `Bits` qui
représente une suite de bits par un tableau de caractères, ainsi que sur l'utilisation
de deux fonctions :

- `greater_or_equal_at` qui détermine à partir de quel bit dans le dividende on
  peut soustraire le diviseur de manière à ce que le résultat soit supérieur ou égal à 0
- `sub_at` qui réalise la soustraction à la position trouvée par le sous-programme précédent

## 2.4 Nombres à virgule flottante (IEEE 754)

La norme IEEE 754 (*Standard for Binary Floating-Point Arithmetic*) date de 1985.
Elle définit initialement quatre représentations de nombres réels qui sont
appelés **nombres flottants** ou **nombres à virgule flottante** en informatique[^fp_note] :

- **Simple précision** (32 bits), correspond au type `float` du langage C
- **Double précision** (64 bits), correspond au type `double` du langage C
- **Simple précision étendue** (43 bits et plus)
- **Double précision étendue** (79 bits et plus), on utilise généralement 80 bits
  ce qui correspond à la modélisation des nombres au sein du coprocesseur arithmétique

[^fp_note]: Les Anglo-saxons utilisent le point pour représenter la virgule, on parle donc de *floating point number*.

D'autres formats de représentations ont été ajoutés par la suite :

- La **demi précision** (*half precision*) qui code sur 16 bits et est utilisée dans le cadre des réseaux de neurones
- La **quadruple précision** qui code sur 128 bits
- L'**octuple précision** qui code sur 256 bits

Dans la norme IEEE 754, les nombres sont décomposés en trois parties distinctes :

- Le **Signe (S)** qui vaut `0` pour un nombre positif et `1` pour un nombre négatif et
  qui correspondra au bit le plus significatif
- Suivi de l'**Exposant (E)** que nous appelons **Exposant décalé (Ed)** car on lui ajoute une valeur positive
- Et de la **Mantisse (M)** que nous qualifions de **Mantisse tronquée Mt** car on
  supprime le premier 1 une fois le nombre normalisé

On peut voir dans la Table 2.7 la précision de la représentation. Nous avons indiqué également les plus petites et
plus grandes valeurs que l'on peut représenter.

| Précision | 16 bits | 32 bits | 64 bits | 128 bits |
|---|---|---|---|---|
| Signe (bits) | 1 | 1 | 1 | 1 |
| Exposant (bits) | 5 | 8 | 11 | 15 |
| Mantisse (bits) | 11 | 23 | 52 | 113 |
| Plus petit nombre | ±6,103×10⁻⁵ | ±1,175×10⁻³⁸ | ±2,225×10⁻³⁰⁸ | ±3,362×10⁻⁴⁹³² |
| Plus grand nombre | ±65504 | ±1,701×10³⁸ | ±1,797×10³⁰⁸ | ±1,189×10⁴⁹³² |
| Décimales | 3 | 7 | 16 | 34 |

*TABLE 2.7 – Caractéristiques des nombres flottants en fonction de la précision*

Ainsi, dans le format IEEE 754 en 32 bits, un nombre *n* s'exprime par :

*n = (−1)ˢ × M × 2ᴸ = (−1)ˢ × 1,Mt × 2*(Ed−127)

On voit que l'on retire 127 à l'exposant décalé car celui-ci est augmenté, par
convention, de 127 comme nous allons le voir ci-après.

### 2.4.1 Codage d'un nombre flottant en IEEE 754

*FIGURE 2.4 – Codage d'un nombre flottant en IEEE 754 32 bits*

Comment coder un nombre réel au format IEEE 754 ? Prenons l'exemple de
la représentation en simple précision sur 32 bits (cf. Figure 2.4) du codage de
*n = −1027,625*. On procède comme suit :

- Il s'agit d'un nombre négatif donc *S = 1*
- On code la partie entière en valeur absolue :
  *1027₁₀ = 1024₁₀ + 2₁₀ + 1₁₀ = 2¹⁰ + 2¹ + 2⁰ = `100_0000_0011`₂*
- On code la partie décimale en utilisant des puissances de 2 négatives :
  *0,625 = 0,5 + 0,125 = 2⁻¹ + 2⁻³*
- La mantisse qui regroupe partie entière et décimale est alors *M = `100_0000_0011,101`₂*

Pour obtenir la mantisse tronquée et l'exposant décalé, il suffit de déplacer la
virgule vers la gauche derrière le premier 1, on parle alors de **normalisation** du
nombre à représenter :

*1,0000000011101₂*

Par conséquent, on a déplacé la virgule de 10 rangs vers la gauche (voir
Figure 2.4), ce qui correspond à *E = 10*.

- La mantisse tronquée est alors égale à la mantisse à laquelle on a enlevé le
  premier 1 devant la virgule, on obtient donc *Mt = `0000000011101`₂*
- L'exposant décalé est égal, par convention en 32 bits, à *127 + E*, dans notre
  cas *E = 10*, donc : *Ed = 127 + 10 = 137₁₀ = `1000_1001`₂*

On remplit alors chacun des champs du nombre flottant (Figure 2.4) et on
complete la mantisse tronquée par des zéros à droite. Au final on obtient une valeur
sur 32 bits que l'on exprime généralement en hexadécimal pour plus de lisibilité.
On obtient donc `C4_80_74_00`₁₆.

### 2.4.2 Méthode de codage de la partie décimale

Pour coder la partie décimale d'un nombre il existe une autre méthode que celle
qui consiste à sommer les puissances de deux négatives afin de retrouver la valeur
cherchée.

Cette méthode consiste à multiplier la partie décimale par 2 jusqu'à obtenir 0
quand cela est possible.

A chaque étape on garde le chiffre le plus à gauche du résultat de la multiplication
qui sera 1 ou 0 puis on réitère la multiplication sur la partie décimale du
résultat de la multiplication en supprimant le premier `1` s'il existe.

Prenons un exemple simple, on désire obtenir le codage en binaire de 0,8125 :

| n | n × 2 | r |
|---|---|---|
| 0,8125 | 1,625 | 1 |
| 0,625 | 1,25 | 1 |
| 0,25 | 0,5 | 0 |
| 0,5 | 1,0 | 1 |
| 0,0 | - | - |

- On multiplie 0,8125 par deux ce qui donne 1,625, on garde le premier chiffre 1
  et on réitère sur 1,625 − 1
- On multiplie 0,625 par deux ce qui donne 1,25, on garde le premier chiffre 1
  et on réitère sur 1,25 − 1
- On multiplie 0,25 par deux ce qui donne 0,5, on garde le premier chiffre 0 et
  on réitère sur 0,5 − 0
- On multiplie 0,5 par deux ce qui donne 1,0, on garde le premier chiffre 1 et
  on s'arrête car 1 − 1 = 0

Au final on obtient *0,8125 = `0,1101`₂*.

Un exemple plus problématique est le codage de 0,3 :

| n | n×2 | r |
|---|---|---|
| 0,3 | 0,6 | 0 |
| 0,6 | 1,2 | 1 |
| 0,2 | 0,4 | 0 |
| 0,4 | 0,8 | 0 |
| 0,8 | 1,6 | 1 |
| 0,6 | 1,2 | 1 |
| ··· | ··· | ··· |

Dans le cas de 0,3 le résultat ne tombe pas juste et on obtient une séquence qui
se répète à l'infini (et même au-delà) :

*0, 0 1001 1001 1001 ...*

Si on code 0,3 au format IEEE 754 en 32 bits, on a :

- Le signe est *S = 0* car le nombre est positif
- La normalisation du nombre donne *M = 0,0100110011001...* et donc *E = −2*
  car on doit déplacer la virgule de deux rangs vers la droite pour atteindre le premier 1 du nombre
- En conséquence l'exposant décalé est de *Ed = 127 − 2 = 125 = `0111_1101`₂*
- La mantisse tronquée est `00110011...`₂
- La représentation de 0,3 est donc `3E_99_99_9A`₁₆

### 2.4.3 Le biais de l'exposant

La constante 127 est utilisée pour les nombres flottants en simple précision afin
de pouvoir coder les nombres dont la partie entière est égale à 0. Dans ce cas
l'exposant *E* est négatif, par exemple *0,0625 = 2⁻⁴*, on ajoute un décalage de 127
pour pouvoir représenter ces nombres.

Notons que l'assembleur `nasm` que nous utiliserons est capable de convertir
automatiquement une valeur décimale en sa représentation IEEE 754, nous n'aurons
donc pas à réaliser ces calculs fastidieux d'encodage des nombres à virgule flottante.

| Symbole | Hexadécimal | Signe | Exposant | Mantisse |
|---|---|---|---|---|
| 0,0 | `00000000` | 0 | `00000000` | `00...0`₂ |
| ∞ | `7F800000` | 0 | `11111111` | `00...0`₂ |
| −∞ | `FF800000` | 1 | `11111111` | `00...0`₂ |
| NaN | `FFC00000` | 1 | `11111111` | `10...0`₂ |

*TABLE 2.8 – Constantes prédéfinies pour les nombres en virgule flottante*

Certaines valeurs ont une signification particulière (cf. Table 2.8). Notamment
`NaN` qui en anglais signifie *Not a Number* et qui est utilisée pour signaler une erreur
lors d'un calcul. Il existe deux types de valeurs NaN :

- `qNaN` ou *quiet NaN*, ne produit pas d'exception et sera propagée afin que le
  calcul se termine sans provoquer l'arrêt du programme
- `sNaN` ou *signaling NaN* est sensée provoquer une exception

Pour les système POSIX/Unix les exceptions générées lors de calculs sur les
nombres à virgule flottante mettent fin à l'exécution du programme à moins qu'elles
ne soient interceptées par un gestionnaire (*handler*) qui captera le signal `SIGFPE`[^sigfpe].

[^sigfpe]: `SIGFPE` signifie *SIGnal Floating Point Exception* (ou Error).

On pourra utiliser le [convertisseur IEEE-754 Floating Point](https://www.h-schmidt.net/FloatConverter/IEEE754.html)
écrit en Javascript qui permet à partir d'un nombre réel d'obtenir son codage en norme IEEE 754 32 bits.

### 2.4.4 Puissances de 2 négatives

| n | Valeur de 2ⁿ |
|---|---|
| −1 | = 0,5 |
| −2 | = 0,25 |
| −3 | = 0,125 |
| −4 | = 0,0625 |
| −5 | = 0,03125 |
| −6 | = 0,015625 |
| −7 | = 0,0078125 |
| −8 | = 0,00390625 |
| ... | ... |
| −23 | = 0,00000011920928955078125 |

*TABLE 2.9 – Puissances de 2 négatives*

On notera que les puissances de 2 négatives se terminent toutes par des puissances de
chiffres finissant par 5 (car *5³ = 125*).

Lorsque l'on utilise la représentation IEEE 754, on rencontre deux problèmes :

- **Le premier** est la conséquence de l'utilisation des puissances de 2, car comme
  on le voit dans la Table 2.9, les puissances de 2 négatives se terminent par 5, on
  ne peut donc coder la plupart des nombres décimaux qu'en utilisant une
  combinaison de puissances de 2 négatives et cela engendre une erreur de
  précision.

```cpp
#include <iostream>
#include <iomanip>
#include <cmath>
using namespace std;

float v1 = 1.2;
float v2 = 1.3;
float v3 = 1.3001;
float v4 = 1.3001001;

int main() {
    float diff_v1_v2 = v1 - v2;
    float diff_v2_v3 = v2 - v3;
    cout << setprecision(10);
    cout << "v1-v2 = " << diff_v1_v2 << endl;
    cout << "v2-v3 = " << diff_v2_v3 << endl;
    float diff_v3_v4 = fabs(v3 - v4);
    cout << "|v3-v4| = " << diff_v3_v4 << endl;
    if (diff_v3_v4 < 1E-6)
        cout << "v3 = v4" << endl;
    else
        cout << "v3 != v4" << endl;
    return 0;
}
```

> *Listing 2.4.1 – Précision et nombres flottants*

- **Le second** découle du premier et tient au fait que la taille de la mantisse peut
  être trop petite pour représenter certains nombres qui comportent beaucoup
  de chiffres, notamment en 32 bits, car on dispose de 7 chiffres significatifs.
  C'est pour cela que le coprocesseur arithmétique qui réalise les opérations
  sur les nombres flottants utilise un codage sur 80 bits afin de minimiser les
  erreurs de précision.

On peut voir sur le Listing 2.4.1 la différence entre des valeurs proches. Cependant le résultat de l'exécution ne
correspond pas à ce que nous devrions obtenir :

```
v1-v2 = -0.09999990463 ! et non -0.1
v2-v3 = -0.0001000165939 ! et non -0.0001
|v3-v4| = 1.192092896e-07 ! et non 0.0000001
v3 = v4
```

- La différence `v1 - v2` devrait être égale à *−0,1*
- Et celle de `v2 - v3` devrait être de *−0,0001*

Cela est dû au fait qu'il est impossible de coder exactement certaines valeurs
comme nous l'avons expérimenté pour représenter *0,3*.

> **Attention**
> Le problème lié aux erreurs de précision implique que pour comparer deux
> valeurs en virgule flottante on ne peut pas utiliser l'opérateur d'égalité (`==`)
> du langage C comme on le ferait pour des entiers, il est nécessaire d'utiliser
> la valeur absolue de la différence des deux valeurs (ligne 20 du Listing 2.4.1)
> et de vérifier que cette différence est bien inférieure à un *ϵ* donné (ligne 23).

Si on utilise une précision plus grande de 64 bits, c'est à dire un `double` en
langage C, on obtient un résultat qui correspond à un calcul exact :

```
v1-v2 = -0.1
v2-v3 = -0.0001
|v3-v4| = 1.000000001e-07
v3 = v4
```

Néanmoins, on obtiendra les mêmes erreurs de précision dès lors que les
nombres à traiter possèdent un nombre de chiffres après la virgule important qui
dépasse la capacité de représentation des nombres en double précision.

### 2.4.5 Précision de la représentation IEEE 754

La valeur décimale *0,3* est codée au format IEEE 754 sur 32 bits par `3E99999A`.
De même *0,4 = `3ECCCCCD`*.
Si nous calculons la différence *0x3ECCCCCD - 0x3E99999A*, nous obtenons *0x333333 = 3 355 443*,
c'est à dire que l'on peut coder un peu plus de 3,3 millions de valeurs
entre 0,3 et 0,4.

De la même manière si on code *1,0* on obtient `0x3F800000`. Le nombre qui suit
*1,0* est donc `3F800001` qui correspond à la valeur décimale *1,0000001*, le suivant est
`0x3F800002` qui correspond à la valeur décimale *1,0000002*. On a donc une précision
de 7 chiffres après la virgule.

En revanche si on code *1024* on obtient `0x44800000`. Le nombre qui suit *1024* est,
en hexadécimal, égal à `0x44800001` et correspond à *1024,0001*, soit une précision
de 4 chiffres après la virgule.

Ceci montre qu'en représentation IEEE 754 sur 32 bits on dispose de 8 chiffres
significatifs.

### 2.4.6 La valeur absolue d'un flottant

Pour conclure sur la partie liée aux nombres flottants, demandons nous comment
coder la fonction `fabs` qui calcule la valeur absolue d'un nombre. Logiquement
cette fonction devrait être implantée sous la forme suivante :

```cpp
float fabs(float v) {
    if (v >= 0.0)
        return v;
    else
        return -v;
}
```

C'est à dire qu'il faudrait changer le signe du nombre seulement s'il est négatif
et cela implique donc de comparer *v* à 0.0. Mais il existe une méthode beaucoup
plus simple pour obtenir la valeur absolue, puisque le bit de poids fort d'un flottant
représente le signe du nombre. Il suffit donc de le mettre à 0 en utilisant un masque.
On peut écrire cela en C++ de la manière suivante :

```cpp
float v = -1.5;
unsigned *p = reinterpret_cast<unsigned *>(&v);
*p = (*p & 0x7FFFFFFF);
```

On convertit le nombre flottant 32 bits en un entier non signé 32 bits auquel on
applique un masque qui préserve tous les bits sauf le bit de signe. En assembleur
on peut traduire ce code par une seule instruction :

```nasm
section .data
v dd -1.5
section .text
and [v], 0x7FFFFFFF
```

Il faut noter que l'on a utilisé ici une instruction (`and`) qui travaille sur les entiers,
mais comme nous le verrons dans le Chapitre suivant, il est normalement nécessaire
d'utiliser les instructions liées au coprocesseur pour faire des calculs avec les réels.

### 2.4.7 Division entière par multiplication et décalage

Dans le cas d'une division entière (non signée) sur 32 bits par une constante
*d*, il est possible de rendre la division plus efficace en la remplaçant par une
multiplication car on exécute alors *x × (1/d)*. On va alors chercher *a* et *s* tels que :

*1/d = a × 2⁻³²⁻ˢ*

car on ne peut pas représenter une valeur inférieure à 0 comme *0,3* avec des
entiers. Dans ce cas, *x/d = x × a* suivi d'un décalage à droite de *32 + s* bits car la
multiplication des deux valeurs 32 bits donne un résultat sur 64 bits.

Prenons un exemple concret avec *d = 10*. Dans ce cas, *a = `CCCCCCCD`₁₆ = 3 435 973 837*
et *s = 3*. Si on prend *x = 173*, on obtient alors :

*x × a = 173 × 3 435 973 837 = 594 423 473 801 = `8A_66_66_66_89`₁₆ = `1000_1010 × 2³² + ..._1001`₂*

Le décalage de 35 bits vers la droite ou dans le cas présent de la partie haute
du résultat (`8A`₁₆) de 3 bits vers la droite, donne au final *`1_0001`₂ = 17* et permet
d'obtenir un résultat sur 32 bits.

Si on reste en 32 bits, on utilisera le code assembleur qui suit pour lequel la partie haute de
la multiplication (`edx`) sera décalée de *35 − 32 = 3* bits à droite :

```nasm
mov eax, 173        ; x
mov edx, 0xCCCCCCCD ; a
mul edx
mov eax, edx
shr eax, 3
```

Comment trouve t-on *a* et *s* ? C'est assez simple, il suffit de calculer *1/d* et le
coder sous forme d'un flottant. Dans l'exemple précédent, *1/d = 0,1*, soit au format
IEEE 754 : `3D_CC_CC_CD`₁₆. Pour avoir une meilleure précision, on code sur 64
bits sous forme d'un `double`, ce qui donne `3FB9_9999_9999_999A`₁₆. La taille de
l'exposant étant de 11 bits dans le format IEEE 754 64 bits :

- On décale le nombre de 64 bits de 11 bits vers la gauche :
  *`01001100110011001...`₂ = `4CCC...`₁₆*
- On fixe à 1 le bit de poids fort (bit 63) pour obtenir la mantisse, car on ne
  disposait que de la mantisse tronquée :
  *`11001100110011001...`₂ = `CCC...C`₁₆*
- On décale de 32 bits vers la droite pour obtenir une valeur sur 32 bits
- On fixe le bit de poids faible (bit 0) à 1

On retrouve alors `CCCCCCCD`₁₆.

Une fois qu'on a déterminé la valeur de *a*, il est assez simple de trouver *s*, en
testant par une boucle `for` le décalage qui donnera le résultat escompté ou en
utilisant les instructions assembleur telles que `bsr` ou `bsf`. Le code C correspondant
est le suivant et devrait donner dans la majorité des cas les valeurs de *a* et de *s* de
manière précise :

```cpp
void find_a_s(u32 d) {
    // on calcule 1/d sous forme d'une double
    double ratio = 1.0 / d;
    u64 *a = (u64*)&ratio;
    // décalage de 11 bits (exposant)
    // et on fixe le bit de la mantisse tronquée
    // on décale ensuite de 32 bits
    *a = ((*a << 11) | 0x8000000000000000) >> 32;
    // on fixe le bit de poids faible
    *a = *a | 0x01;
    u32 shift;
    u64 prod = (*a) * d;
    for (shift = 32; shift < 63; shift++) {
        u64 r = prod >> shift;
        if (r == 1)
            break;
    }
    cout << "a=" << hex << *a << endl;
    cout << "s=" << dec << shift << endl;
}
```

Un test simple qui consiste à réaliser 10 milliards de divisions par différentes
valeurs (11, 127, 1027, 11279, 44567187) en employant soit l'instruction `div` de
l'assembleur, soit la multiplication avec décalage pour *d = 10*, donne les temps
d'exécution reportés dans la Table 2.10.

| Méthode | AMD Ryzen 5 5600g | Intel Core i5 7400 | Intel Core i5 12400f | Intel Core i5 10850H |
|---|---|---|---|---|
| division (`div`) | 13,53 | 19,67 | 13,95 | 13,60 |
| mult + décalage | 4,27 | 7,70 | 3,37 | 5,32 |
| gain | ×3,16 | ×2,55 | ×4,13 | ×2,55 |

*TABLE 2.10 – 10 milliards de divisions sur différentes architectures*

On voit clairement que la multiplication suivie d'un décalage est plus performante
que la division. On va notamment **3,16 fois plus vite** sur AMD Ryzen 5600g.

## 2.5 Codage des caractères

### 2.5.1 ASCII

Le stockage des caractères ainsi que des chaînes de caractères est généralement
effectué en ASCII 8 bits afin de pouvoir coder sur un octet 256 valeurs différentes.
Dans un langage comme le C cela est suffisant si on utilise les langues européennes.

Dans le codage ASCII (voir [www.ascii-code.com](https://www.ascii-code.com) ainsi qu'en annexe de cet
ouvrage), les caractères 0 à 31 sont des caractères de contrôle qui ne représentent
pas un symbole mais permettent la mise en page de texte (comme le saut de page
`FF`, le saut de ligne `LF`, le retour-chariot `CR` ou la tabulation horizontale `HT`), ou la
transmission d'information pour les liaisons RS232 (port série) comme `STX` et `ETX`.

- Les plages de caractères de 32 à 47, 58 à 64, 91 à 96, 123 à 126 représentent
  des symboles tels que l'espace, les opérations arithmétiques, les signes de
  ponctuations (virgule, point, point-virgule, etc), les parenthèses, les crochets,
- Les caractères 48 à 57 sont les chiffres
- Les lettres majuscules occupent la plage 65 à 90, alors que les lettres minuscules
  s'étendent de 97 à 122
- De 128 à 255 les caractères codés sont les lettres avec accents ainsi que des
  symboles mathématiques ou de ponctuation et des symboles qui permettent
  la mise en forme de tableaux

On notera que la distance entre les majuscules et minuscules est de 32. Ainsi
pour transformer `'A'` en `'a'`, il suffit d'ajouter 32 au code ASCII de `'A'`. Du point
de vue du binaire, il suffit de positionner le bit 5 à 1, puisque *2⁵ = 32*.

En langage C le codage des chaînes consiste à stocker l'ensemble des caractères
de la chaîne de manière contiguë (consécutive) puis à marquer la fin de chaîne par
le caractère 0, représenté en C par `'\0'`.

Cette représentation possède l'avantage de pouvoir coder des chaînes très
longues puisqu'elle ne pose aucune limitation sur la longueur, si ce n'est celle de
la mémoire. Cependant, elle possède un inconvénient dû au fait qu'on ne peut
connaître la longueur de la chaîne qu'en la parcourant.

Si une chaîne possède 1000 caractères, elle occupera donc en mémoire 1001
caratères, c'est à dire les 1000 caractères de la chaîne plus le marqueur de fin de
chaîne.

Si l'on désire changer les caractères minuscules en majuscules il ne faut surtout
pas parcourir la chaîne deux fois (à cause du `strlen`). Il vaut mieux passer par des pointeurs :

```cpp
#include <iostream>
#include <cctype>
#include <cstring>
#include <iomanip>
using namespace std;

int main() {
    char chaine[] = "abracadabra...";
    int longueur = strlen(chaine);
    for (int i = 0; i < longueur; i++)
        if (isalpha(chaine[i])) chaine[i] = toupper(chaine[i]);
    cout << chaine << endl;
    return 0;
}
```

> *Listing 2.5.1 – Convertir une chaine en majuscules (inefficace)*

Il vaut mieux cependant passer par des pointeurs, en évitant le double parcours :

```cpp
char *s = chaine;
while (*s != '\0') {
    if (isalpha(*s)) *s = toupper(*s);
    ++s;
}
```

> *Listing 2.5.2 – Convertir une chaine en majuscules (avec pointeurs)*

### 2.5.2 Unicode et UTF

Le problème de l'ASCII est qu'il ne permet de coder que 256 caractères différents
ce qui est insuffisant au regard de toutes les langues qui existent ainsi que des
symboles (mathématiques, physique, chimie) que l'on peut utiliser dans l'écriture
courante.

Le standard Unicode dans sa version 15.0 (Septembre 2022) permet de coder
149 186 caractères ce qui couvre la presque totalité des caractères connus.
Le Consortium Unicode a pour but d'identifier de manière précise et distincte
l'ensemble des caractères.

Chaque caractère est clairement identifié par son **point de code** qui est en fait
un indice entier. Par exemple le symbole € a pour point de code la valeur 8364 soit
`U+20AC` en hexadécimal dans le standard Unicode.

L'UTF (*Universal character set Transformation Format*) permet de transformer le
point de code des caractères Unicode en une série d'octets. En fonction des besoins
de l'utilisateur on utilisera une représentation 8, 16 ou 32 bits, sachant que l'on
peut passer de l'une à l'autre sans perte.

L'encodage par octet, **UTF-8**, a été conçu pour coder des chaînes à la manière
de ce que l'on peut faire avec l'ASCII et est très utilisé par le protocole HTML et les
éditeurs de texte :

- Les 127 premiers caractères de l'ASCII 7 bits ont les mêmes valeurs en UTF-8
  et sont donc codés sur un octet
- Pour coder les caractères de valeurs comprises entre 128 et 2047 on utilise deux octets
- Puis trois octets pour coder les caractères de valeurs comprises entre 2048 et 65535
- Enfin, on utilise quatre octets pour les caractères de valeurs supérieures à 65535

En **UTF-32**, par contre, chaque caractère est codé par une valeur 32 bits ce qui
prend plus de place que l'UTF-8.

Par exemple la chaîne `"abàé=€"` sera codée :

```
ASCII
00000000  61 | 62 | e0 | e9 | a4 | 0a
00000006
UTF-8
00000000  61 | 62 | c3 a0 | c3 a9 | e2 82 ac | 0a
0000000a
UTF-16
00000000  ff fe | 61 00 | 62 00 | e0 00 | e9 00 | ac 20 | 0a 00
0000000e
UTF-32
00000000  ff fe 00 00 | 61 00 00 00 | 62 00 00 00 | e0 00 00 00
00000010  e9 00 00 00 | ac 20 00 00 | 0a 00 00 00
0000001c
HTML Entities
00000000 61 62 26 61 67 72 61 76 65 3b 26 65 61 63 75 74 |ab&agrave;&eacut|
00000010 65 3b 26 65 75 72 6f 3b 0a |e;&euro;.|
HTML Hexadecimal
00000000 61 62 26 23 78 45 30 3b 26 23 78 45 39 3b 26 23 |ab&#xE0;&#xE9;&#|
00000010 78 32 30 41 43 3b 0a |x20AC;.|
```

Pour la transformation en ASCII, j'ai utilisé `konwert` mais comme le symbole de
l'Euro n'existe pas en ASCII, il a été traduit par le symbole de code `A4`.

La suite de valeurs `FF FE` en UTF-16 bits et `FF FE 00 00` en UTF-32 indique
l'ordre de lecture des caractères. Il s'agit du **BOM** (*Byte Order Mark*). Ici cela signifie
qu'il faut commencer par la première valeur trouvée. Dans le cas de l'UTF-32,
la séquence d'octets `61 00 00 00` doit donc être considérée comme la valeur
hexadécimale `00_00_00_61` = *97₁₀* qui correspond au caractère `'a'`.

On trouvera les séquences :

- `FF FE` qui indique que le fichier utilise le format **Little Endian (LE)**
- Ou l'inverse, `FE FF`, qui indique un encodage en **Big Endian (BE)**.

## 2.6 Endianness

Nous avons vu précédemment que certaines données tels que les nombres
entiers ou les nombres flottants peuvent être représentées sur plusieurs octets.
L'ordre dans lequel ces octets sont ordonnés en mémoire est appelé ***endianness***[^endian].

[^endian]: Terme issu du livre les Voyages de Gulliver, conte satirique de Jonathan Swift et qui se traduit en français par *boutisme* ou par *endianisme*.

Dans le mode ***big endian***, l'octet de poids le plus fort est enregistré à l'adresse
mémoire la plus petite alors que dans le mode ***little endian*** c'est l'inverse.
Pour le monde x86, c'est le mode *little endian* qui est utilisé, ainsi la valeur
`FFFE0201`₁₆ sera stockée en mémoire dans l'ordre croissant des adresses sous la
forme : `01`₁₆ suivi de `02`₁₆, `FE`₁₆ et finalement `FF`₁₆.

## 2.7 Résumé du chapitre

### 2.7.1 Ce qu'il faut retenir

- L'information est codée sur un ordinateur au format binaire et sera modélisée
  par des types scalaires comme le caractère, l'entier court, l'entier, le flottant
  simple ou double précision qui occupent un, deux, quatre ou huit octets
- La représentation binaire en complément à deux permet de modéliser les
  entiers relatifs et de pouvoir leur appliquer les opérations arithmétiques de
  base (addition, multiplication, soustraction, division)
- La norme IEEE 754 définit le format de codage des nombres réels qui sont
  qualifiés de nombres à virgule flottante, ou encore de manière plus succincte
  de **flottants**
- Le codage des nombres à virgule flottante ne permet pas de représenter tous
  les nombres et cela peut conduire à des erreurs de précision lors de calculs
- Deux nombres à virgule flottante sont égaux si la différence de leur valeur
  absolue est inférieure à un epsilon donné, ou en d'autres termes, s'ils sont
  proches

### 2.7.2 Objectifs

Après lecture et travail sur ce chapitre, on doit être capable de :

- ☐ Convertir un nombre décimal dans une autre base
- ☐ Convertir un nombre en binaire, en octal ou en hexadécimal en décimal
- ☐ Convertir un nombre réel en son équivalent flottant
- ☐ Convertir un nombre flottant en son équivalent réel
- ☐ Réaliser une addition et une multiplication en binaire
- ☐ Déterminer si un nombre entier est dans l'intervalle de représentation du
  codage binaire naturel ou binaire en complément à deux en fonction du
  nombre d'octets utilisé pour sa représentation

## 2.8 Exercices

**Exercice 3** – Trouvez l'équivalent décimal des nombres suivants :

- `101010`b, `10011`b
- `201`₃, `1111`₃
- `421`o, `732`o
- `A0`h, `FF`h

**Exercice 4** – Convertir les nombres décimaux suivants :

- 11 et 10 en base 2
- 26 et 210 en base 8
- 250 et 49 en base 16

**Exercice 5** – Utilisez la méthode par complémentation afin de coder en notation
binaire naturelle non signée, les nombres suivants :

- 249
- 1011
- 16373
- 131069

**Exercice 6** – Réaliser la somme des nombres naturels suivants en base 2. Que remarquez-vous ?

- `0000_0010`b + `0000_0011`b
- `0000_1010`b + `0000_1111`b

**Exercice 7** – Quels sont les plus grands entiers naturels que l'on peut représenter
avec 8, 16 ou 32 bits ?

**Exercice 8** – Donner la représentation en complément à deux des nombres décimaux
suivants : *−1, −2, −127, −128, −129*. Combien de nombres peut-on représenter
avec 8 bits en notation en complément à deux ?

**Exercice 9** – Calculer la somme des nombres **en complément à deux** suivants. Que remarquez vous ?

- `0000_0111`̅₂ + `0000_0101`̅₂
- `0000_0111`̅₂ + `1000_0101`̅₂
- `0000_0011`̅₂ + `1111_1011`̅₂
- `0100_0000`̅₂ + `0100_0001`̅₂

**Exercice 10** – Calculer le produit des nombres en complément à deux suivants. Que remarquez vous ?

- 7 × 5
- 7 × −5
- 48 × −2
- 48 × −3

**Exercice 11** –

- Comment **multiplier** simplement un nombre binaire par 2, 4, 8 ou *2ⁿ* ?
- Comment **diviser** simplement un nombre binaire par 2, 4, 8 ou *2ⁿ* ?

**Exercice 12** – Représentez en norme IEEE 754, les nombres suivants :

- *133,875₁₀*
- *14,6875₁₀*
- *5,59375₁₀*
- *0,66₁₀*

**Exercice 13** – Trouvez à quels nombres réels correspondent les représentations
IEEE 754 :

- `42_C8_40_00`
- `48_92_F5_40`
- `C2_92_F0_00`
- `C3_B0_30_00`

**Exercice 14** – Codez la chaîne de caractères `Hola mundo!` en ASCII.

**Exercice 15** – Ouvrir un éditeur de texte comme `gedit`, saisir la chaîne `"éAèBàCçD€"`
sans les guillemets et sauvegarder le fichier en le nommant `a.txt`. Utilisez ensuite
la commande Unix `hexdump -C a.txt` afin d'obtenir le contenu du fichier sous
forme d'octets. Regardez comment sont codés les caractères accentués et le symbole
de l'euro.

**Exercice 16** – Programmer la soustraction binaire en C ou tout autre langage que
vous maîtrisez. On considère que les nombres sont codés soit sous forme de listes
d'entiers ou de booléens. On peut également utiliser des chaînes de caractères ou
la classe `bitset` du C++. On réalise l'opération *x − y* en supposant que *x ≥ y*.

**Exercice 17** – Programmer la division binaire en C ou tout autre langage que
vous maîtrisez. On considère que les nombres sont codés soit sous forme de listes
d'entiers ou de booléens. On peut également utiliser des chaînes de caractères.
Initialement le quotient est à 0 et la dernière position à laquelle on a réalisé une
soustraction (*k1*) est égale à la taille du dividende.

Tant que le dividende est supérieur ou égal au diviseur, on effectue les opérations
suivantes :

1. On recherche la position *k2* à laquelle on peut soustraire le diviseur dans le dividende
2. On décale le quotient de *(k1 − k2 − 1)* rangs vers la gauche si cette quantité est supérieure à 0
3. On soustrait le diviseur au dividende à la position *k2* et on place un `1` à droite du quotient
4. *k1 = k2*

Enfin, lorsque le dividende est inférieur au diviseur, si *k1* n'est pas égal à 0, on
décale le quotient de *k1* rangs vers la gauche.
