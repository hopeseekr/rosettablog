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
   
   Now, let's add the code necessary to find out what view and action we will display. */

// This means, "If the URL parameter view= is set, grab its sanitized value via the input filter, or 
// use the default value 'home'."
$view = isset($_GET['view']) ? filter_input(INPUT_GET, 'view', FILTER_SANITIZE_STRING) : 'home';
$action = isset($_GET['action']) ? filter_input(INPUT_GET, 'action', FILTER_SANITIZE_STRING) : 'index';