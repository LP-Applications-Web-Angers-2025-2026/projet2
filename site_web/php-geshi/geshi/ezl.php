<?php
/*************************************************************************************
 * pascal.php
 * ----------
 * Author: Jean-Michel Richer (jean-michel.richer@univ-angers.fr)
 * Copyright: (c) 2015 Jean-Michel Richer (jean-michel.richer@univ-angers.fr)
 * Release Version: 1.0.8.4
 * Date Started: 2015/07/28
 *
 * Easy language file for GeSHi.
 *
 * -------------------------
 *
 *************************************************************************************
 *
 *     This file is part of GeSHi.
 *
 *   GeSHi is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   (at your option) any later version.
 *
 *   GeSHi is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with GeSHi; if not, write to the Free Software
 *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 ************************************************************************************/

$language_data = array (
    'LANG_NAME' => 'EZL',
    'COMMENT_SINGLE' => array(1 => '#', 2 => '#'),
    'COMMENT_MULTI' => array('##' => '##'),
    'CASE_KEYWORDS' => GESHI_CAPS_NO_CHANGE,
    'QUOTEMARKS' => array('"'),
    'HARDQUOTE' => array("'", "'"),
    'HARDESCAPE' => array("''"),
    'ESCAPE_CHAR' => '\\',
    'KEYWORDS' => array(
        1 => array(
        	'arguments', 'class', 'range',
            'const', 'var',
            'end', 
			'func', 'global', 'import', 
            'module', 
            'proc', 'prog', 'of', 'do',
            'type', 'and', 'or', 'not', 
            'exit'
            ),
        2 => array(
            'local', 'null',  'as', 'print', 'println', 'ask', 'dump', 'read', 'return'
              
            ),
        3 => array(
            'if', 'then', 'else', 'elsif',
            'for', 'in',
            'while', 'do', 'repeat', 'until', 'on', 'loop',
            'print', 'ask', 'dump', 'to', 'switch', 'case', 'default'
            ),
        4 => array(
            'bool', 'char','file',
            'int', 'real', 'stack', 'string', 
			'array', 'grid', 'mesh', 'vector', 'matrix', 'volume', 'true', 'false'
            ),
        ),
    'SYMBOLS' => array(
        ',', ':', '=', '+', '-', '*', '/', '%', "!=", '-=', '+=', '*=', '/=', '<', '>', '++', '--'
        ),
    'CASE_SENSITIVE' => array(
        GESHI_COMMENTS => false,
        1 => false,
        2 => false,
        3 => false,
        4 => false,
        ),
    'STYLES' => array(
        'KEYWORDS' => array(
            1 => 'color: #383;font-weight:bold;',    
            2 => 'color: #833;font-weight:bold;',                    
            3 => 'color: #338;font-weight:bold;',                    
            4 => 'color: #A96805;font-weight:bold;'                     
            ),
        'COMMENTS' => array(
            1 => 'color: #338;',
            'MULTI' => 'color: #338;'
            ),
        'ESCAPE_CHAR' => array(
            0 => 'color: #003366; font-weight: bold;',
            'HARD' => 'color: #003366; font-weight: bold;'
            ),
        'BRACKETS' => array(
            0 => 'color: #538; font-weight: bold;'
            ),
        'STRINGS' => array(
            0 => 'color: #B03A2E;',
            'HARD' => 'color: #B03A2E;'
            ),
        'NUMBERS' => array(
            0 => 'color: #AF601A;'
            ),
        'METHODS' => array(
            1 => 'color: #003366;'
            ),
        'SYMBOLS' => array(
            0 => 'color: #9E342E; font-weight: bold;'
            ),
        'REGEXPS' => array(
            ),
        'SCRIPT' => array(
            )
        ),
    'URLS' => array(
        1 => '',
        2 => '',
        3 => '',
        4 => ''
        ),
    'OOLANG' => true,
    'OBJECT_SPLITTERS' => array(
        1 => '.'
        ),
    'REGEXPS' => array(
        ),
    'STRICT_MODE_APPLIES' => GESHI_NEVER,
    'SCRIPT_DELIMITERS' => array(
        ),
    'HIGHLIGHT_STRICT_BLOCK' => array(
        ),
    'TAB_WIDTH' => 4,
    'PARSER_CONTROL' => array(
        'KEYWORDS' => array(
            'DISALLOWED_BEFORE' => "(?<![a-zA-Z0-9\$_\|\#])",
            'DISALLOWED_AFTER' => "(?![a-zA-Z0-9_\|%\\-])"
        )
    )
);

?>
