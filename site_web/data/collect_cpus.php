<?php

/**
 * Script PHP pour récupérer tous les CPU (nom + infos) à partir
 * de tous les fichiers 'processors.txt' présents dans 'lar/**'.
 *
 * Utilisation (depuis la racine du projet) :
 *   php site_web/data/collect_cpus.php
 *
 * Résultat :
 *   - affiche un récapitulatif en texte
 *   - écrit un JSON complet dans site_web/data/cpus.json
 */

$root = realpath(__DIR__ . '/../../'); // .../projet2
if ($root === false) {
    fwrite(STDERR, "Impossible de localiser la racine du projet.\n");
    exit(1);
}

$larDir = $root . '/lar';
if (!is_dir($larDir)) {
    fwrite(STDERR, "Répertoire 'lar' introuvable : $larDir\n");
    exit(1);
}

/**
 * Retourne la liste des fichiers processors.txt trouvés sous lar/**
 */
function find_processors_files(string $larDir): array
{
    $files = [];
    $it = new RecursiveIteratorIterator(
        new RecursiveDirectoryIterator($larDir, FilesystemIterator::SKIP_DOTS)
    );
    foreach ($it as $file) {
        /** @var SplFileInfo $file */
        if (strtolower($file->getFilename()) === 'processors.txt') {
            $files[] = $file->getPathname();
        }
    }
    sort($files);
    return $files;
}

/**
 * Parse un processors.txt.
 * Format général :
 *   # commentaires
 *   name|Brand|Model|SubModel|Year
 * ou
 *   name|Brand|Model|SubModel|Year|ShortName
 */
function parse_processors_file(string $path): array
{
    $cpus = [];
    $fh = fopen($path, 'r');
    if (!$fh) {
        fwrite(STDERR, "Impossible de lire $path\n");
        return $cpus;
    }

    while (($line = fgets($fh)) !== false) {
        $line = trim($line);
        if ($line === '' || $line[0] === '#') {
            continue;
        }
        $parts = explode('|', $line);
        if (count($parts) < 5) {
            // ligne invalide, on ignore
            continue;
        }

        $name      = trim($parts[0]);
        $brand     = trim($parts[1]);
        $model     = trim($parts[2]);
        $submodel  = trim($parts[3]);
        $year      = (int)trim($parts[4]);
        $shortName = isset($parts[5]) ? trim($parts[5]) : null;

        // clé unique : le "name" complet (celui des dossiers results)
        if (!isset($cpus[$name])) {
            $cpus[$name] = [
                'name'       => $name,
                'brand'      => $brand,
                'model'      => $model,
                'submodel'   => $submodel,
                'year'       => $year,
                'short_name' => $shortName,
                'sources'    => [basename(dirname($path))], // ex: asm_vowels_64, asm_popcnt_64...
            ];
        } else {
            // si on tombe plusieurs fois sur le même CPU, on fusionne les sources
            $cpus[$name]['sources'][] = basename(dirname($path));
            $cpus[$name]['sources'] = array_values(array_unique($cpus[$name]['sources']));
        }
    }

    fclose($fh);
    return $cpus;
}

// ------------------------------------------------------------------
// Récupération et fusion de tous les CPU
// ------------------------------------------------------------------

$processorFiles = find_processors_files($larDir);
if (empty($processorFiles)) {
    fwrite(STDERR, "Aucun processors.txt trouvé sous $larDir\n");
    exit(1);
}

$allCpus = [];

foreach ($processorFiles as $file) {
    $cpus = parse_processors_file($file);
    foreach ($cpus as $name => $info) {
        if (!isset($allCpus[$name])) {
            $allCpus[$name] = $info;
        } else {
            // fusion des sources, on garde les premières méta‑données
            $allCpus[$name]['sources'] = array_values(
                array_unique(array_merge($allCpus[$name]['sources'], $info['sources']))
            );
        }
    }
}

// Tri par année puis par marque / modèle pour un JSON plus lisible
usort($allCpus, function ($a, $b) {
    if ($a['year'] === $b['year']) {
        return strcmp($a['name'], $b['name']);
    }
    return $a['year'] <=> $b['year'];
});

// ------------------------------------------------------------------
// Écriture du JSON
// ------------------------------------------------------------------

$outDir  = __DIR__;
$outFile = $outDir . '/cpus.json';

$json = json_encode($allCpus, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
if ($json === false) {
    fwrite(STDERR, "Erreur JSON : " . json_last_error_msg() . "\n");
    exit(1);
}

if (file_put_contents($outFile, $json) === false) {
    fwrite(STDERR, "Impossible d'écrire $outFile\n");
    exit(1);
}

echo "CPU collectés : " . count($allCpus) . PHP_EOL;
echo "Fichier généré : $outFile" . PHP_EOL;

