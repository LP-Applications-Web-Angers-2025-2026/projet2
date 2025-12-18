<?php
function cpp_to_asm(string $cppCode, string $compiler = 'g122'): string
{
    $payload = [
        "source" => $cppCode,
        "lang" => "c++",
        "options" => [
            "userArguments" => "-O2 -std=c++20",
            "filters" => [
                "intel" => true,
                "demangle" => true,
                "comments" => false,
                "labels" => false,
                "directives" => false,
                "libraryCode" => false
            ]
        ]
    ];

    $jsonPayload = json_encode($payload);

    $context = stream_context_create([
        'http' => [
            'method'  => 'POST',
            'header'  =>
                "Content-Type: application/json\r\n" .
                "Content-Length: " . strlen($jsonPayload) . "\r\n",
            'content' => $jsonPayload,
            'timeout' => 10
        ]
    ]);

    $url = "https://godbolt.org/api/compiler/$compiler/compile";

    $response = @file_get_contents($url, false, $context);

    if ($response === false) {
        return "; Erreur : requête HTTP échouée (file_get_contents)";
    }

    $json = json_decode($response, true);

    if (!is_array($json)) {
        return "; Erreur : réponse JSON invalide";
    }

    if (!isset($json['asm'])) {
        // Affiche les erreurs de compilation si présentes
        if (isset($json['stderr'])) {
            return "; Erreur de compilation :\n; " . implode("\n; ", $json['stderr']);
        }
        return "; Erreur : assembleur non généré";
    }

    $asm = '';
    foreach ($json['asm'] as $line) {
        if (isset($line['text'])) {
            $asm .= $line['text'] . "\n";
        }
    }

    return trim($asm);
}
?>