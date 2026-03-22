# Documentation du Site Web et du Framework PHP

Ce document explique le fonctionnement technique du site, la logique de génération des pages à partir de fichiers Markdown, et l'utilisation du framework `ez_web.php`.

## 1. Vue d'ensemble de la Génération

Le site est conçu pour être géré via des fichiers **Markdown** (`.md`) qui sont ensuite convertis en pages **HTML/PHP** via un script de build.

- **Source** : Les fichiers de contenu se trouvent dans `site_web/pages-md/`.
- **Build** : Le script `site_web/markdown_to_php/build.php` parcourt ces fichiers, transforme le Markdown en HTML (via Parsedown), injecte les composants dynamiques, et applique un layout commun.
- **Sortie** : Les pages générées sont placées à la racine du dossier `site_web/`.

---

## 2. Le Système de Benchmark (Nouvelle Logique)

La nouvelle logique de benchmark automatise l'affichage des résultats de performance. Elle remplace les tableaux manuels et les scripts JavaScript complexes par un simple balisage.

### 2.1 Le Balisage `[BENCHMARK:nom]`
Pour insérer un benchmark, il suffit d'ajouter la balise suivante dans un fichier Markdown :
```markdown
[BENCHMARK:nom_du_benchmark]
```
Exemple : `[BENCHMARK:asm_vowels_64]`

### 2.2 Fonctionnement Interne
Lors du build, la balise est détectée et traitée par la fonction `generateBenchmarkComponent` :

1.  **Source de Vérité (SQLite)** : Les données sont extraites de `site_web/data/benchmarks.db`. La vue `v_resultats` est utilisée pour filtrer les données par chapitre (le "nom" dans la balise).
2.  **Catégorisation par Architecture** : Le système sépare automatiquement les résultats en trois catégories basées sur l'année du CPU :
    -   **Ancien** : < 2015
    -   **Moderne** : 2015 - 2019
    -   **Récent** : >= 2020
3.  **Génération HTML** : Pour chaque catégorie trouvée, le système génère :
    -   Un **Tableau HTML** (`.data-table`) avec les moyennes de temps/performance par méthode et par CPU.
    -   Un **Graphique Highcharts** interactif inséré juste après le tableau.
4.  **Injection de Scripts** : Si (et seulement si) un benchmark est présent sur la page, `build.php` injecte automatiquement les bibliothèques `highcharts.js` et `graph.js`.

---

## 3. Utilisation du Framework `ez_web.php`

Bien que le build Markdown soit privilégié, le site repose sur `ez_web.php` qui fournit les fonctions de structure et de mise en forme.

### 3.1 Structure d'une Page
Toute page générée suit cette structure :
```php
<?php
require_once('ez_web.php');
document_begin(); // <head>, <nav>, début <body>
?>
<div class="row">
    <section class="cours">
        <!-- Contenu -->
    </section>
</div>
<?php document_end(); // Pied de page, scripts, fin <body> ?>
```

### 3.2 Fonctions de Contenu
- **`chapter($titre, $num)`** : Définit un titre H1 de chapitre.
- **`section($titre)`** : Définit une section numérotée (ex: 1.1).
- **`subsection($titre)`** : Définit une sous-section (ex: 1.1.1).
- **`chapter_aim($obj, $keyw, $pre, $know)`** : Affiche le bloc d'objectifs en début de chapitre.
- **`begin_exercise()` / `end_exercise()`** : Encadre une zone d'exercice.
- **`do_math("formule")`** : Affiche une formule via jqMath.

---

## 4. Affichage du Code (GeSHi)

Le framework utilise **GeSHi** pour la coloration syntaxique. Dans le Markdown, utilisez les blocs de code standards :

````markdown
```cpp
#include <iostream>
int main() { return 0; }
```
````

Le build exporte automatiquement chaque bloc de code dans un fichier physique (ex: `site_web/code/chapitre_15/code_001.cpp`) et crée un bloc dépliable (`<details>`) avec un lien de téléchargement.

---

## 5. Maintenance et Ajout de Données

Pour ajouter un nouveau benchmark :
1.  Insérez les résultats dans la base `benchmarks.db` (tables `test_results`, `cpus`, `benchmarks`).
2.  Assurez-vous que le champ `nom_benchmark` (ou chapitre dans la vue) correspond bien à l'identifiant que vous utiliserez.
3.  Ajoutez `[BENCHMARK:votre_nom]` dans le fichier Markdown correspondant.
4.  Lancez le build : `php site_web/markdown_to_php/build.php`.
