<?php
// Inclusion des librairies nécessaires
require_once dirname(__DIR__, 2) . '/ez_web.php';
// Inclusion de GeSHi pour la coloration syntaxique (optionnel si pas de code à afficher)
require_once dirname(__DIR__, 2) . '/php-geshi/geshi.php';

// Début du document HTML (Header, navigation, etc.)
document_begin();
?>

    <main>
        <?= $content ?>
    </main>

<?php
// Fin du document HTML (Footer, fermeture des balises)
document_end();
?>