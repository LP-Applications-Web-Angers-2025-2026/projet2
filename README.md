# projet2 - Documentation complete du site

Ce depot contient un site pedagogique genere a partir de Markdown, avec injection automatique de benchmarks (SQLite + Highcharts), extraction de contenu depuis PDF et mise en forme via un layout PHP commun.

## 1) Objectif du projet

Le site presente des etudes de cas autour de l'assembleur (x86 32/64), avec :

- des chapitres rediges en Markdown ;
- des blocs de code exportes automatiquement ;
- des tableaux + graphiques de performances injectes depuis une base SQLite ;
- un pipeline d'extraction/import depuis un PDF source.

## 2) Architecture du depot

Principaux repertoires :

- `site_web/` : site genere (HTML statique), styles, JS, data, templates ;
- `site_web/pages-md/` : sources Markdown des chapitres ;
- `site_web/markdown_to_php/build.php` : pipeline principal Markdown -> HTML ;
- `site_web/markdown_to_php/templates/layout.php` : layout commun ;
- `site_web/ez_web.php` : header/footer/menu + helpers historiques ;
- `site_web/data/benchmarks.db` : base SQLite des benchmarks ;
- `site_web/data/graph.js` : rendu des graphiques Highcharts ;
- `pdf_extract/` : scripts d'analyse/extraction/import depuis PDF ;
- `lar/` : dossiers de travaux benchmarks assembleur/C/C++ (sources et scripts de perf).

## 3) Prerequis

Minimum recommande :

- PHP 8.x ;
- Composer ;
- extension PDO SQLite active dans PHP ;
- `sqlite3` (CLI, utile pour debug base) ;
- `pdftotext` (`poppler-utils`) pour certains scripts d'extraction ;
- dependances Composer installees (`smalot/pdfparser`).

## 4) Installation rapide

Depuis la racine du projet :

```bash
cd /home/etud/PhpstormProjects/projet2
composer install
```

Optionnel (outils extraction PDF) :

```bash
sudo apt install -y poppler-utils sqlite3
```

## 5) Comment le site est genere

Le flux principal est :

1. lire chaque fichier `site_web/pages-md/*.md` ;
2. detecter/remplacer les balises speciales (ex: `[BENCHMARK:...]`) ;
3. convertir Markdown vers HTML (Parsedown) ;
4. post-traiter le HTML (titres, tableaux, blocs de code, nettoyage) ;
5. injecter le layout via `templates/layout.php` ;
6. ecrire le resultat dans `site_web/*.html`.

Commande :

```bash
php site_web/markdown_to_php/build.php
```

### Details importants du build

- Les formules mathematiques `$...$` et `$$...$$` sont protegees avant parsing pour eviter la corruption des `_` par le parser Markdown.
- Les blocs de code Markdown sont exportes vers `site_web/code/chapitre_X/` puis affiches dans des `<details>` avec coloration GeSHi.
- Si un benchmark est present, `highcharts.js` et `site_web/data/graph.js` sont injectes automatiquement dans la page.
- Le lien Accueil du header pointe vers `/` (force dans `site_web/ez_web.php`).

## 6) Systeme de benchmark dynamique

### 6.1 Balisage dans le Markdown

Dans un chapitre, il suffit d'ecrire :

```markdown
[BENCHMARK:nom_du_benchmark]
```

Exemples utilises :

- `[BENCHMARK:asm_selfdesc]`
- `[BENCHMARK:asm_bsr_lzcnt]`

### 6.2 Source des donnees

Le build interroge `site_web/data/benchmarks.db`, vue `v_resultats`, en filtrant :

- `chapitre = nom_du_benchmark`
- `type_test IN ('temps moyen', 'performance')`

Vue disponible dans la base :

- `v_resultats(id_resultat, nom_cpu, marque, annee, chapitre, type_test, nom_test, valeur_resultat, validation, remarque)`

### 6.3 Segmentation des graphiques

Par defaut, un benchmark est split en 3 groupes :

- `ancien` : annee < 2015
- `moderne` : 2015 <= annee < 2020
- `recent` : annee >= 2020

Cas special : `asm_bsr_lzcnt` est affiche en vue globale unique.

## 7) Pipeline PDF (extraction/import)

Repertoire : `pdf_extract/`

Scripts principaux :

- `pdf_probe.php` : inspection structure PDF ;
- `extract_pdf_to_markdown.php` : extraction PDF -> fichiers Markdown ;
- `extract_chapter_data.php` : generation JSON de donnees chapitres ;
- `import_benchmark.php` : insertion/maj benchmarks dans SQLite.

Configuration centralisee : `pdf_extract/config.php` (+ `pdf_extract/.env`).

Variables supportees :

- `PDF_PATH`
- `DB_PATH`
- `OUTPUT_DIR`
- `DATA_DIR`

Exemples :

```bash
php pdf_extract/import_benchmark.php --config
php pdf_extract/pdf_probe.php --config
php pdf_extract/extract_pdf_to_markdown.php --config
php pdf_extract/import_benchmark.php
```

## 8) Lancer le site en local

Le site genere est statique (HTML/CSS/JS). Pour le consulter localement :

```bash
cd site_web
php -S 127.0.0.1:8080
```

Puis ouvrir :

- `http://127.0.0.1:8080/index.html`
- ou directement un chapitre (ex: `chapitre_17.html`).

## 9) Workflow mainteneur recommande

1. Modifier un chapitre dans `site_web/pages-md/`.
2. Ajouter/mettre a jour les donnees benchmark via SQLite ou `pdf_extract/import_benchmark.php`.
3. Regenerer : `php site_web/markdown_to_php/build.php`.
4. Verifier visuellement les pages modifiees.
5. Commit des fichiers source + HTML regeneres si votre process le demande.

## 10) Depannage courant

### Le graphique ne s'affiche pas

Verifier :

- presence de la balise `[BENCHMARK:...]` dans le Markdown ;
- presence de donnees correspondantes dans `v_resultats` (`chapitre` identique) ;
- chargement de `highcharts.js` et `data/graph.js` dans la page generee.

### Le tableau benchmark est vide

- Verifier que `type_test` est bien `temps moyen` ou `performance` ;
- Verifier l'existence du benchmark dans la table `Chapitre` + `Test` + `Resultat`.

### Erreurs sur les formules

Le build protege les formules math avant parsing Markdown. Si une formule casse, verifier que les delimiteurs `$...$` ou `$$...$$` sont bien fermes.

### Scripts PDF en erreur

- verifier le chemin du PDF (`PDF_PATH`) ;
- verifier `pdftotext` installe ;
- verifier les droits d'ecriture des repertoires de sortie.

## 11) Fichiers de reference

- `site_web/markdown_to_php/build.php`
- `site_web/markdown_to_php/templates/layout.php`
- `site_web/ez_web.php`
- `site_web/data/graph.js`
- `site_web/SITE_WEB_DOC.md`
- `pdf_extract/config.php`
- `pdf_extract/import_benchmark.php`

---

