<?php

/** Single Page MVC
* MVC stands for the Model View Controller Design Pattern.
* 
* This is a very popular design pattern for websites because it 
*    * allows for far less cluttered and more organized code
*    * makes it far more easier to share code between pages and to add new pages
*    * separates XHTML, CSS and JavaScript (the Views), allowing for
*      XHTML editing by persons unfamiliar with PHP (important for businesses)
*    * separates business logic (Model) from the View
*    * acts as a defacto standard for organizing a site that professionals readily comprehend.
*/

/* This file, index.php, will be our Front-Controller.  This file's responsibility will be to
   make the MVC work by acting as the front glue that ties the various components together.
   
   Every page in our web app will be determined based on what view it is calling and what action
   it is performing.  Let's call our default view "home" and our default action "index".
*/

// Front Controller: 1. Find out what view and action we will display.

// The code below means, "If the URL parameter view= is set, grab its sanitized value via the input 
// filter, or use the default value 'home'."
$view = isset($_GET['view']) ? filter_input(INPUT_GET, 'view', FILTER_SANITIZE_STRING) : 'home';
$action = isset($_GET['action']) ? filter_input(INPUT_GET, 'action', FILTER_SANITIZE_STRING) : 'index';

// ViewController: 1. Move isValidView() into the ViewController.
class ViewController
{
	// 1a. Let's rewrite the constants as class constants.
	// ProTip: Use constants to define things like status codes to make your source code far easier
	//         to understand.  Per the PHP standard, return true on success.
	const VALID_VIEW = true;
	const ERROR_INVALID_FILE_NAME = 1;
	const ERROR_FILE_NOT_FOUND = 2;

	// 2. Let's create a function to determine whether a view exists or not.
	private function isValidView($view)
	{
		// 2a. Make sure the view file does not contain any inappropriate characters.
		//    This is *vitally* important, as otherwise hackers would be able to arbitrarily
		//    view any file on the system that your PHP process has access to, which would be bad.
		if (preg_match('/[^\w\d._-]/', $view) !== 0)
		{
			return self::ERROR_INVALID_FILE_NAME;
		}

		// 2b. Let's see if the view exists.
		$filename = "../views/$view.inc.php";
		if (file_exists($filename) === false)
		{
			return self::ERROR_FILE_NOT_FOUND;
		}
		
		// 2c. If it got this far, it must be a valid view!
		return self::VALID_VIEW;
	}
	
	// 3. Create a function to actually load the view.
	public function displayView($view, $action)
	{
		// 3a. Test if the requested view exists.  If not, direct the user to the 404 page.

		// Pro Tip: Try not to "over develop" by trying to code every feature you think the
		//          client *might* want in the future, and just do the most pragmatic first.
		//          It will be easier to add on later and you won't waste any time.

		// Pro Tip: If you use != instead of !== here, then every view will return true, as
		//          every isValidView() status message is greater than 0.
		if ($this->isValidView($view) !== self::VALID_VIEW)
		{
			$url = 'http://' . $_SERVER['HTTP_HOST'] . '/rosettablog/index.php?view=404';
			header('Location: ' . $url);

			// Pro Tip: Always put an exit after an HTTP redirect, or your PHP app will
			//          chugging along, with sometimes disasterous results.
			exit;
		}
		
		// If we got this far, we must have a valid view.

		// Before the views can be loaded, however, we really need to run all the code that 
		// needs to be processed before the page is loaded.  For instance, if the user is 
		// attempting to log in, we would need to run this through the UserController first.
		// If they are trying to access restricted pages, such as their  user preferences, 
		// we would need to run them through SecurityController first.

		// 3b: Run any code that needs to be pre-executed based on the view/action.
		$this->preExecute($view, $action);
		
		// 3c. Load the view.
		$filename = "../views/$view.inc.php";
		include $filename;
	}
	
	// 4. Create a function to facilitate running all the code that needs to execute before
	//    the view is loaded.
	public function preExecute($view, $action)
	{
		// 4a. Figure out if anything needs to be pre-executed at all.
		// 4b. Nothing needs to be pre-executed at the moment.
	}
}

// Front Controller 2: Load the appropriate view.
$viewController = new ViewController;
$viewController->displayView($view, $action);






