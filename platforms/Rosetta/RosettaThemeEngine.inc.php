<?php
/**
* Rosetta Blog
*   Copyright © 2010 Theodore R. Smith <theodore@phpexperts.pro>
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

class RosettaThemeEngine implements ThemeEngine
{
    const THEME_BASE_DIR = 'themes/drupal';

    private $themeName;
    private $themePath;
	private $viewData;

    public function setTheme($themeName)
    {
		// TODO: Rosetta themes are not implemented yet.
    }

    public function constructPage($view, array $viewData = null)
	{
//		print '<pre>'; print_r($viewData); exit;
		// a. Get the view's filename.
		$filename = $this->getViewFile($view);

		// b. Get the view's HTML.
		ob_start();

		if (!is_null($viewData) && is_array($viewData))
        {
            extract($viewData);
        }

		include $filename;
		$html = ob_get_contents();
		ob_end_clean();

		return $html;
	}

	private function getViewFile($view)
	{
        // Let's see if the view exists.
        $filename = "./views/$view.inc.php";
        if (file_exists($filename) === false)
        {
            throw new RuntimeException(ViewController::ERROR_FILE_NOT_FOUND);
        }

        return $filename;
	}
}
