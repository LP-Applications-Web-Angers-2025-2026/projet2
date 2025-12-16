<?php

function document_begin($class = "", $includes = "", $root_path = "") {
    
    // Ensure root_path ends with a slash if it's not empty and not already ending with one
    if (!empty($root_path) && substr($root_path, -1) !== '/') {
        $root_path .= '/';
    }

    $header_html_code_part1 = <<<HEREDOC
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="Enseignement, Recherche, Université, Angers, Jean-Michel, Richer, JMR70" />
<meta name="author" content="Jean-Michel Richer" />
<meta name="description" content="Site de Jean-Michel RICHER Maître de Conférence en Informatique JMR70" />
<title>Site de Jean-Michel RICHER</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link rel="icon" type="image/png" href="{$root_path}img/classroom.png" />
<link rel="stylesheet" href="{$root_path}style.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=UnifrakturMaguntia">
<link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fred-wang.github.io/MathFonts/LatinModern/mathfonts.css">
<link rel="stylesheet" href="https://fred-wang.github.io/MathFonts/STIX/mathfonts.css">

<link rel="stylesheet" href="{$root_path}javascript/mathscribe/jqmath-0.4.3.css">
<script src="{$root_path}javascript/jquery-3.4.1.min.js"></script>
<script src="{$root_path}javascript/mathscribe/jqmath-etc-0.4.6.min.js" charset="utf-8"></script>
<script>M.MathPlayer = false; M.trustHtml = true;</script>
<style>
.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 400,
  'GRAD' 0,
  'opsz' 24
}
math {
  font-size: 110%;
  line-height: 1.6;
}
</style>
HEREDOC;

    $header_html_code_part2=<<<HEREDOC
</head>
<body>

<header>
  <h1>Site de Jean-Michel RICHER</h1>
  <p>Maître de Conférences en Informatique à l'Université d'Angers</p>
</header>

<div id="main_menu" class="menu-btn material-icons" onclick="toggleMenu()">menu</div>

<nav id="main_menu_nav">
  <a href="{$root_path}index.php"><i class="material-icons">home</i>Accueil</a>
  <a href="{$root_path}ens.php"><i class="material-icons">school</i>Enseignement</a>
  <a href="{$root_path}rec.php"><i class="material-icons">science</i>Recherche</a>
  <a href="{$root_path}conferences.php"><i class="material-icons">public</i>Conférences IA</a>
  <a href="{$root_path}dev.php"><i class="material-icons">build</i>Développement</a>
  <a href="{$root_path}div.php"><i class="material-icons">category</i>Divers</a>
  <a href="{$root_path}contact.php"><i class="material-icons">mail</i>Contact</a>
</nav>
HEREDOC;

    $header_html_code_part3=<<<HEREDOC
<div class="row">

<div class="cadre_alerte" style="display: flex;">
<p style="margin: 10px auto; text-align: center; padding: 20px;">
Ce site est en cours de reconstruction certains liens peuvent ne pas fonctionner ou 
certaines images peuvent ne pas s'afficher.
</p>
</div>
<br/>
</div>
HEREDOC;

    echo $header_html_code_part1;
    echo "\n" . $includes . "\n";
    echo $header_html_code_part2;
    if (empty($class)) {
        echo "<main>\n";
    } else {
        echo "<main class=\"$class\">\n";
    }
    echo $header_html_code_part3;

}

function document_end($code="") {
    global $footer_html_code;

    $today = date('Y');
    $footer_html_code1=<<<HEREDOC
<br /><br /><br />
</main>
<footer>
    <p>2000-$today (&copy;) Jean-Michel Richer - All rights reserved</p>
</footer>
<script>
  function toggleMenu() {
    document.getElementById('main_menu_nav').classList.toggle('show');
  }
</script>
HEREDOC;

    echo $footer_html_code1;
	if (!empty($code)) {
		echo "\n".$code."\n";
	}

	$footer_html_code2=<<<HEREDOC
</body>
</html>
HEREDOC;
	echo $footer_html_code2;
}



function simple_table_column_header($title, $data, $alignment)
{
	echo "<div class=\"center\">\n";
	echo "<table>\n";
	$rows = explode("$", $data);
	foreach ($rows as $row) {
		$row = trim($row);
		if (empty($row)) continue;
		$columns = explode("|", $row);
		echo "<tr>\n";
		$i = 0;
		foreach ($columns as $column) {
			echo "\t<td>&nbsp;";
			if ($i == 0) echo "<strong>";
			echo trim($column);
			if ($i == 0) echo "</strong>";
			echo "&nbsp;</td>\n";
			++$i;
		}
		echo "</tr>\n";
	}
	echo "<caption>$title</caption>";
	echo "</table>\n";
	echo "</div>";
}

/**
  Example:
  simple_table_row_header("Comparaison CPU vs. GPU", 
  	$data, 
  	"CCC", 
  	array("12"=>"highlight1_bold", "odd" => "", "even" => ""));
 */

function simple_table_row_header($title, $data, $alignment, $attributes = null, $line_sep = "$", $col_sep = "|")
{
	if ($attributes == null) $attributes = array();
	$data = preg_replace("/[" . $col_sep . "]+/", $col_sep, $data);
	
	echo "<table>\n";
	$rows = explode($line_sep, $data);
	$row_id = 0;
	foreach ($rows as $row) {
		++$row_id;
		$row = trim($row);
		if (empty($row)) continue;
		$columns = explode($col_sep, $row);
		if ($row_id == 1) {
			echo "<tr>\n";
		} else {
			$n = ($row_id % 2) + 1;
			if (isset($attributes[$row_id])) {
				$extra = $attributes[$row_id];
				echo "<tr class=\"simple_$extra\">\n";
			} else {
				if (isset($attributes["odd"]) && (($row_id % 2) == 1)) {
					echo "<tr class=\"simple_row$n\">\n";
				} else if (isset($attributes["even"]) && (($row_id % 2) == 0)) {
					echo "<tr class=\"simple_row$n\">\n";
				} else {
					$found = false;
					if (isset($attributes)) {

						if (count($attributes) != 0) {
							foreach ($attributes as $k => $v) {
								$pos = strpos($k, '-');
								if ($pos !== false) {
									$ndx1 = intval(substr($k, 0, $pos));
									$ndx2 = intval(substr($k, $pos + 1));

									if (($ndx1 <= $row_id) && ($row_id <= $ndx2)) {
										$found = true;
										break;
									}
								}
							}
						}
					}
					if ($found) {
						echo "<tr class=\"simple_$v\">\n";
					} else {
						echo "<tr>\n";
					}
				}
			}
		}
		$col_id = 0;
		foreach ($columns as $column) {
			if (isset($alignment[$col_id])) {
				switch ($alignment[$col_id]) {
					case "C":
						$v = "center";
						break;
					case "L":
						$v = "left";
						break;
					case "R":
						$v = "right";
						break;
					default:
						$v = "center";
						break;
				}
			} else {
				$v = "center";
			}
			if ($row_id == 1) {
				echo "\t<th style=\"text-align: $v\">&nbsp;";
				echo trim($column);
				echo "&nbsp;</th>\n";
			} else {
				echo "\t<td style=\"text-align: $v\">&nbsp;";
				echo trim($column);
				echo "&nbsp;</td>\n";
			}
			++$col_id;
		}
		echo "</tr>\n";
	}
	echo "<caption>$title</caption>";
	echo "</table>\n";
}

function contents_def_begin($title)
{
	echo "<div class=\"definition\"><h6>D&eacute;finition : $title</h6>";
}

function contents_def_end($title = "")
{
	echo "</div>";
}

$chapter_num = 1;
$section_num = 0;
$subsection_num = 0;
$subsubsection_num = 0;
$subsubsubsection_num = 1;
$exercise_num = 0;

function chapter($title, $num=1)
{
	global $chapter_num;
	global $section_num;

	$chapter_num = $num;
	$section_num = 0;
	if ($chapter_num == 0) {
		echo "<h1 class=\"chapter\">$title</h1>\n";
	} else {
		echo "<h1 class=\"chapter\">$chapter_num. $title</h1>\n";
	}
	for ($i = 0; $i < 5; ++$i) echo "<!-- $title -->\n";
}

function chapter_aim($obj, $keyw, $pre, $know, $links = null)
{
	$s = <<<HEREDOC
<div class="lbox">
<h3>Objectif :</h3><p>$obj</p>
</div>
<div class="rbox">
<h3>Mots-cl&eacute;s :</h3><p>$keyw</p>
</div>
<div class="cbox"></div>
<div class="lbox">
<h3>Pr&eacute;requis :</h3><p>$pre</p>
</div>
<div class="rbox">
<h3>Finalit&eacute; :</h3><p>$know</p>
</div>
<div class="cbox"></div>

HEREDOC;
	echo $s;

	if ($links != null) {
		echo "<div class=\"lbox\"><h3>Liens</h3>\n<ul>";
		foreach ($links as $title => $url) {
			echo "<li><a href=\"$url\">$title</a></li>";
		}
		echo "</ul></div><div class=\"cbox\"></div>";
	}
}

function section($title, $num = true)
{
	global $chapter_num;
	global $section_num;
	global $subsection_num;

	$subsection_num = 0;
	if ($num) {
		++$section_num;
		if ($chapter_num == 0) {
			echo "<h1>$section_num. $title</h1>\n";
		} else {
			echo "<h1>$chapter_num.$section_num. $title</h1>\n";
		}
	} else {
		echo "<h1>$title</h1>\n";
	}
	for ($i = 0; $i < 5; ++$i) echo "<!-- $title -->\n";
}

function empty_section($title)
{
	echo "<h1>$title</h1>\n";
	for ($i = 0; $i < 5; ++$i) echo "<!-- $title -->\n";
}


function subsection($title)
{
	global $chapter_num;
	global $section_num;
	global $subsection_num;
	global $subsubsection_num;

	++$subsection_num;
	$subsubsection_num = 0;
	if ($chapter_num == 0) {
		echo "<h2>$section_num.$subsection_num. $title</h2>\n";
	} else {
		echo "<h2>$chapter_num.$section_num.$subsection_num. $title</h2>\n";
	}
	for ($i = 0; $i < 5; ++$i) echo "<!-- $title -->\n";
}

function subsubsection($title)
{
	global $chapter_num;
	global $section_num;
	global $subsection_num;
	global $subsubsection_num;
	global $subsubsubsection_num;

	++$subsubsection_num;
	$car = chr(96 + $subsubsection_num);
	echo "<!-- SubSubSection -->\n";
	if ($chapter_num == 0) {
		echo "<h3>$section_num.$subsection_num.$car&nbsp; $title</h3>\n";
	} else {
		echo "<h3>$chapter_num.$section_num.$subsection_num.$car&nbsp; $title</h3>\n";
	}
	
	$subsubsubsection_num = 1;
}

function subsubsubsection($title)
{
	global $subsubsubsection_num;

	echo "<!-- SubSubSubSection -->\n";
	echo "<h4>";
	switch($subsubsubsection_num) {
		case 1: echo "&alpha;"; break;
		case 2: echo "&beta;"; break;
		case 3: echo "&gamma;"; break;
		case 4: echo "&delta;"; break;
		case 5: echo "&epsilon;"; break;
		case 6: echo "&zetta;"; break;
	}
	echo ")&nbsp; $title</h4>\n";
	++$subsubsubsection_num;
}


function begin_exercise($eid = "")
{
	global $chapter_num;
	global $exercise_num;
	++$exercise_num;
	echo "<div class=\"exercise\" ";
	if (empty($eid)) {
		echo " exercise_id=\"$chapter_num.$exercise_num\" ";
	} else {
		echo " exercise_id=\"$eid\" ";
	}
	echo ">";
	echo "<p><b>Exercice $chapter_num.$exercise_num</b><br />";
}

function end_exercise()
{
	echo "\n</div> <!-- end exercise -->\n";
}

function do_geshi($file_name, $language, $highlight = null)
{
    $contents = file_get_contents($file_name);
    
    echo "\n<details>\n";
    echo "\n<summary>Afficher le code &nbsp;&nbsp; <a href=\"$file_name\">$file_name</a></summary>";

    $geshi = new GeSHi($contents, $language);
    
    $geshi->enable_line_numbers(GESHI_NORMAL_LINE_NUMBERS);
    $geshi->set_header_type(GESHI_HEADER_DIV);
    $geshi->set_tab_width(2);
    

    if ($highlight != null) {
      $geshi->highlight_lines_extra($highlight);
      $geshi->set_highlight_lines_extra_style("background: #ffe06f;");
    }

    echo $geshi->parse_code();
    echo "\n</details>\n";
}

function do_geshi_inline($contents, $language, $highlight = null)
{
        
    echo "\n<details>\n";
    echo "\n<summary>Afficher le code <a href=\"$file_name\">$file_name</a></summary>";

    $geshi = new GeSHi($contents, $language);
    
    $geshi->enable_line_numbers(GESHI_NORMAL_LINE_NUMBERS);
    $geshi->set_header_type(GESHI_HEADER_DIV);
    $geshi->set_tab_width(2);
    

    if ($highlight != null) {
      $geshi->highlight_lines_extra($highlight);
      $geshi->set_highlight_lines_extra_style("background: #ffe06f;");
    }

    echo $geshi->parse_code();
    echo "\n</details>\n";
}


function do_math($string)
{
	echo '<span class="doc_math">$' . $string . '$</span>';
}

function newlines($nbr)
{
	while ($nbr) {
		echo "<br />";
		--$nbr;
	}
	echo "\n";
}

?>
