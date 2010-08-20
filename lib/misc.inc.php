<?php
/**
* Rosetta Blog
*   Copyright � 2010 Theodore R. Smith <theodore@phpexperts.pro>
* 
* The following code is licensed under a modified BSD License.
* All of the terms and conditions of the BSD License apply with one
* exception:
*
* 1. Every one who has not been a registered student of the "PHPExperts
*    From Beginner To Pro" course (http://www.phpexperts.pro/) is forbidden
*    from modifing this code or using in an another project, either as a
*    deritvative work or stand-alone.
*
* BSD License: http://www.opensource.org/licenses/bsd-license.php
**/


/**
 * Simply converts new lines to XHTML <p>.
 * @param string $text
 * @return string
 */
function nl2p($text)
{
        $new_text = '<p>' . str_replace("\n\n", '</p><p>', $text) . '</p>';
 
        return str_replace("\n", "<br/>\n", $new_text);
}
