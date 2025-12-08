# Documentation du Framework Web PHP (`ez_web.php`)

Ce document décrit comment utiliser les outils fournis dans `ez_web.php` pour générer les pages du site web de ce projet. Ce "micro-framework" facilite la création de pages au design cohérent avec support pour l'affichage de code et de formules mathématiques.

## 1. Structure de Base d'une Page

Chaque page PHP doit suivre ce squelette de base :

```php
<?php
// Inclusion des librairies nécessaires
require_once('ez_web.php');
// Inclusion de GeSHi pour la coloration syntaxique (optionnel si pas de code à afficher)
require_once('php-geshi/geshi.php');

// Début du document HTML (Header, navigation, etc.)
document_begin();
?>

<div class="row">
    <!-- Votre contenu HTML/PHP commence ici -->
    <section class="cours">
        
        <?php chapter("Titre du Chapitre", 1); ?>
        
        <p>Votre texte ici...</p>

    </section>
</div>

<?php
// Fin du document HTML (Footer, fermeture des balises)
document_end();
?>
```

### Fonctions Globales
*   **`document_begin($class="", $includes="")`** : Génère le début du HTML (`<head>`, `<nav>`, ouverture de `<body>` et `<main>`).
    *   `$class` : Classe CSS optionnelle à ajouter à la balise `<main>`.
    *   `$includes` : Code HTML/JS/CSS supplémentaire à ajouter dans le `<head>`.
*   **`document_end($code="")`** : Génère le pied de page et ferme le document.
    *   `$code` : Code HTML/JS supplémentaire à placer juste avant la fermeture de `</body>`.

---

## 2. Hiérarchie et Titres

Le framework gère automatiquement la numérotation des chapitres et sections.

*   **`chapter($title, $num=1)`** : Titre de niveau 1 (H1). Réinitialise les compteurs de section.
    *   Si `$num` vaut 0, le numéro de chapitre n'est pas affiché (ex: pour l'intro).
*   **`chapter_aim($obj, $keyw, $pre, $know, $links=null)`** : Affiche un bloc structuré décrivant les objectifs du chapitre.
    *   `$obj` : Objectifs.
    *   `$keyw` : Mots-clés.
    *   `$pre` : Prérequis.
    *   `$know` : Connaissances visées (Finalité).
    *   `$links` : Tableau associatif `["Titre" => "URL"]` pour des liens externes.
*   **`section($title, $num=true)`** : Titre de niveau 1 (H1) mais hiérarchiquement sous le chapitre (ex: 1.1).
*   **`empty_section($title)`** : Section sans numérotation.
*   **`subsection($title)`** : Sous-section (H2), numérotée (ex: 1.1.2).
*   **`subsubsection($title)`** : Sous-sous-section (H3), numérotée avec des lettres (ex: 1.1.2.a).
*   **`subsubsubsection($title)`** : Niveau 4 (H4), numérotée avec des lettres grecques ($\alpha, \beta...$).

---

## 3. Mise en Forme et Contenu

### Blocs d'Exercice
Pour encadrer des exercices :

```php
<?php begin_exercise(); ?>
    <p>Énoncé de l'exercice...</p>
<?php end_exercise(); ?>
```
Vous pouvez passer un ID spécifique à `begin_exercise("monId")`.

### Définitions
```php
<?php contents_def_begin("Nom du concept"); ?>
    Texte de la définition...
<?php contents_def_end(); ?>
```

### Tableaux
Deux fonctions facilitent la création de tableaux structurés à partir de chaînes de caractères brutes.

1.  **`simple_table_column_header($title, $data, $alignment)`**
    *   `$data` : Chaîne où les lignes sont séparées par `$` et les cellules par `|`. La première ligne est l'en-tête.
    *   `$alignment` : (Non utilisé dans l'implémentation actuelle, par défaut centré).

2.  **`simple_table_row_header($title, $data, $alignment, $attributes=null)`**
    *   Tableau plus complexe avec gestion des styles de lignes (pair/impair ou spécifique).
    *   `$alignment` : Chaîne indiquant l'alignement par colonne (ex: "LCR" pour Left, Center, Right).

### Mathématiques
Affiche une formule mathématique formatée (utilise jqMath).

```php
<?php do_math("a^2 + b^2 = c^2"); ?>
```

---

## 4. Affichage de Code (GeSHi)

Le framework intègre GeSHi pour la coloration syntaxique.

### À partir d'un fichier
```php
<?php do_geshi("chemin/vers/fichier.cpp", "cpp", "10-15"); ?>
```
*   `$highlight` (3ème arg) : Lignes à surligner (tableau ou chaîne "10-15").

### Code "Inline" (dans le fichier PHP)
```php
<?php
$monCode = <<<CODE
#include <iostream>
int main() { return 0; }
CODE;

do_geshi_inline($monCode, "cpp"); 
?>
```

---

## 5. UtILitaires

*   **`newlines($nbr)`** : Affiche `$nbr` balises `<br />`.
