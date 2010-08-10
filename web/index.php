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
// 1. Initialize the web application.
// 1a. Change the active path to the root directory of the project.
chdir('..');

// 1b. Load the database abstraction library.
require './lib/MyDB.inc.php';

// 1c. Load helper functions.
require './lib/misc.inc.php';

// 2. Setup the __autoload magic function to handle loading all of our
//    required files.
function __autoload($name)
{
	if (strpos($name, 'Controller') !== false)
	{
		require './controllers/' . $name . '.inc.php';
	}
	else if (strpos($name, 'Manager') !== false)
	{
		require './managers/' . $name . '.inc.php';
	}
	else
	{
		// Let's see if it's a model.
		$filename = './models/' . $name . '.inc.php';
		if (file_exists($filename))
		{
			require $filename;
		}
	}

	// If all else fails...
	return false;
}

// 3. Load the appropriate view.
$viewController = new ViewController;
$viewController->displayView();

