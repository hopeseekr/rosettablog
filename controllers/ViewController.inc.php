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
* The ViewController is responsible for marshalling the appropriate controllers and views
* for any given view/action combo.
*/
class ViewController
{
    // 1. Setup constants for class-specific return statutes. 
    // ProTip: Use constants to define things like status codes to make your source code far easier
    //         to understand.  Per the PHP standard, return true on success.
    const VALID_VIEW = true;
    const ERROR_INVALID_FILE_NAME = 1;
    const ERROR_FILE_NOT_FOUND = 2;
 
    private $view;
    private $action;
    private $viewFilename;
 
    private $viewData;
 
    // 2. Initialize the object.
    public function __construct()
    {
        // 2a. Set the view/action combo.
        $this->fetchViewActionCombo();
    }
 
    // 3. Create a function to fetch the view/action combo.
    private function fetchViewActionCombo()
    {
        // The code below means, "If the URL parameter view= is set, grab its sanitized value via the input 
        // filter, or use the default value 'home'."
        $this->view = isset($_GET['view']) ? filter_input(INPUT_GET, 'view', FILTER_SANITIZE_STRING) : 'home';
        $this->action = isset($_GET['action']) ? filter_input(INPUT_GET, 'action', FILTER_SANITIZE_STRING) : 'index';
    }
 
    // 2. Let's create a function to determine whether a view exists or not.
    private function isValidView()
    {
        $view = $this->view;
        // 2a. Make sure the view file does not contain any inappropriate characters.
        //    This is *vitally* important, as otherwise hackers would be able to arbitrarily
        //    view any file on the system that your PHP process has access to, which would be bad.
        if (preg_match('/[^\w\d._-]/', $view) !== 0)
        {
            return self::ERROR_INVALID_FILE_NAME;
        }
 
        // 2b. Let's see if the view exists.
        $filename = "./views/$view.inc.php";
        if (file_exists($filename) === false)
        {
            return self::ERROR_FILE_NOT_FOUND;
        }
 
        // 2c. If it got this far, it must be a valid view!
        $this->viewFilename = $filename;
 
        return self::VALID_VIEW;
    }
 
    // 3. Create a function to actually load the view.
    public function displayView()
    {
        // 3a. Test if the requested view exists.  If not, direct the user to the 404 page.
 
        // Pro Tip: Try not to "over develop" by trying to code every feature you think the
        //          client *might* want in the future, and just do the most pragmatic first.
        //          It will be easier to add on later and you won't waste any time.
 
        // Pro Tip: If you use != instead of !== here, then every view will return true, as
        //          every isValidView() status message is greater than 0.
        if ($this->isValidView($this->view) !== self::VALID_VIEW)
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
        $this->preExecute();
 
        // 3c. Explode out all of the data from self::preExecute() into the view's scope.
        if (!is_null($this->viewData) && is_array($this->viewData))
        {
            extract($this->viewData);
        }
 
        // 3d. Load the view.
        header('Content-Type: text/html; charset=utf-8');
        include $this->viewFilename;
    }
 
    // 4. Create a function to facilitate running all the code that needs to execute before
    //    the view is loaded.
    public function preExecute()
    {
        // 4a. Figure out if anything needs to be pre-executed at all.
        // 4b. If the view/action combo is home/index, load the summaries of the first five
        //     articles.
        if ($this->view == 'home' and $this->action == 'index')
        {
            $articleManager = new ArticleManager;
            $summaries = $articleManager->fetchArticleSummaries(5);
 
            // 4c. Tweak the results received.
            foreach ($summaries as $summary)
            {
                $summary->reformat();
            }
 
            $this->viewData = array('summaries' => $summaries);
        }
        else if ($this->view == 'article' and $this->action == 'index')
        {
            // 4d. Get the article ID.
            $articleID = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
 
            // 4e. Get the article.
            $articleManager = new ArticleManager;
            $article = $articleManager->fetchArticleByID($articleID);
 
            // 4f. If the article can't be found, set the view to the 404 page.
            if ($article === ArticleManager::ERROR_ARTICLE_NOT_FOUND)
            {
                $this->view = '404';
                $this->action = 'index';
 
                // FIXME: This is a crude hack to get the 404 page to work.
                $this->isValidView($this->view);
 
                return;
            }
 
            $article->reformat();
            $this->viewData = array('article' => $article);
        }
    }
}
