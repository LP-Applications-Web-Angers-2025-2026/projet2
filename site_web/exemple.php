<?php
require_once('ez_web.php');
require_once('php-geshi/geshi.php');

document_begin();
?>

<div class="row">
<section class="cours">

<?php chapter("Titre", 0); ?>

<?php section("Section"); ?>

<div class="cadre_info">
    <p>Cadre pour une information importante</p>
</div>

<?php subsection("Subsection"); ?>

<p>Code C++ depuis un fichier</p>

<?php do_geshi("code/code1.cpp", "cpp" ); ?>

<?php subsection("Subsection"); ?>

<p>Code assembleur depuis un fichier</p>

<?php do_geshi("code/code1.asm", "asm" ); ?>

<?php subsubsection("Subsubsection"); ?>

<p>Code assembleur inline</p>
<?php
$code=<<<CODE
push	eax
push	ebx
call	fib
add	esp, 8
CODE;
do_geshi_inline($code,"asm");
?>
  

</section>
</div>
	
<?php
document_end();
?>
