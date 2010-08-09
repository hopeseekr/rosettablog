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
   make the MVC work by acting as the front glue that ties the various components together. */
   
/* Every page in our web app will be determined based on what view it is calling and what action
   it is performing.  Let's call our default view "home" and our default action "index".
   
   1. Now, let's add the code necessary to find out what view and action we will display. */

// This means, "If the URL parameter view= is set, grab its sanitized value via the input filter, or 
// use the default value 'home'."
$view = isset($_GET['view']) ? filter_input(INPUT_GET, 'view', FILTER_SANITIZE_STRING) : 'home';
$action = isset($_GET['action']) ? filter_input(INPUT_GET, 'action', FILTER_SANITIZE_STRING) : 'index';

// 2. Let's create a function to determine what our available views are.
function isValidView($view)
{
	// ProTip: Use constants to define things like status codes to make your source code far easier
	//         to understand.  Per the PHP standard, return true on success.
	define('VALID_VIEW', true);
	define('ERROR_INVALID_FILE_NAME', 1);
	define('ERROR_FILE_NOT_FOUND', 2);

	// a. Let's make sure the view file does not contain any inappropriate characters.
	//    This is *vitally* important, as otherwise hackers would be able to arbitrarily
	//    view any file on the system that your PHP process has access to, which would be bad.
	if (preg_match('/[^\w\d._-]/', $view) !== 0)
	{
		return ERROR_INVALID_FILE_NAME;
	}

	// b. Let's see if the view exists.
	$filename = "views/$view";
	if (file_exists($filename) === false)
	{
		return ERROR_FILE_NOT_FOUND;
	}
	
	// c. If it got this far, it must be a valid view!
	return VALID_VIEW;
}










