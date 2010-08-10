<?php
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

