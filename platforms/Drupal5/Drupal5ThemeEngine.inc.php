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

// Compatibility functions.
if (!function_exists('base_path'))
{
	function base_path()
	{
		$base_path = substr($_SERVER['SCRIPT_NAME'], 0, strpos($_SERVER['SCRIPT_NAME'], 'index.php'));
		return $base_path;
	}
}

if (!function_exists('path_to_theme'))
{
	function path_to_theme()
	{
		// FIXME: Is there a better way?
		return $GLOBALS['themePath'];
	}
}

class Drupal5ThemeEngine implements ThemeEngine
{
    const THEME_BASE_DIR = 'themes/drupal';

    private $themeName;
    private $themePath;
	private $viewData;

    public function setTheme($themeName)
    {
        $this->themePath = self::THEME_BASE_DIR . '/' . $themeName;

        if (!file_exists('web/' . $this->themePath))
        {
            throw new RuntimeException('Cannot find theme "' . $themeName . '".');
        }

        $this->themeName = 'web/' . $themeName;

		// Needed for path_to_theme(). Frack drupal for forcing me to do this!!
		$GLOBALS['themePath'] = $this->themePath;
    }

    public function constructPage($view, array $viewData = null)
	{
		// a. Convert the view variables to the theme engine's standard.
		$this->translateViewData($viewData);
		$this->viewData =& $viewData;

		// b. Load the template bootstrapper, if present.
		$bootstrap_path = $this->themePath . '/' . 'template.php';
		if (file_exists('web/' . $bootstrap_path))
		{
			include 'web/' . $bootstrap_path;
		}

		// c. Load the main content.
		if ($view == 'article')
		{
			$viewData['content'] = $this->loadBlock('node');
		}

		// d. Load the page HTML.
		$html = $this->loadBlock('page');

		return $html;
	}

    private function translateViewData(&$viewData)
	{
		$origData = $viewData;
		$viewData = array('head_title' => $origData['page_title'],
		                  'content' => $origData['main_content']);
	}

    private function initializeTheme()
	{

	}

	private function loadBlock($block)
	{
		$filename = 'web/' . $this->themePath . '/' . $block . '.tpl.php';
		if (!file_exists($filename))
		{
			throw new RuntimeException('Couldnt load block "' . $block . '"');
		}

		ob_start();
		extract($this->viewData);
		include $filename;
		$html = ob_get_contents();
		ob_end_clean();

		return $html;
	}
}
