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

interface ThemeManagerI
{
    public function setTheme($themeName);
    public function translateViewData(&$viewData);
    public function initializeTheme();
    public function showTheme($section);
}

/* Delegate pattern. */
class ThemeManager implements ThemeManagerI
{
    /** @var ThemeManagerI **/
    private $themeManager;

    public function __construct($blogPlatform)
    {
        // Pick the right theme.
        $className = $blogPlatform . 'ThemeManager';
        $this->themeManager = new $blogPlatform();
    }

    public function setTheme($themeName)
    {
        return $this->themeManager->setTheme($themeName);
    }
}