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

	const ARTICLE_FORMAT_FILTERED = 1;
	const ARTICLE_FORMAT_PHP = 2;
	const ARTICLE_FORMAT_HTML = 3;

	/** @var ThemeManager **/
	private $themeEngine;

	private $view;
    private $action;
    private $viewFilename;

    private $viewData;

    // 2. Initialize the object.
    public function __construct($themeEngine)
    {
		// 2a. Set the theme engine.
		$this->themeEngine = $themeEngine;

		// 2b. Set the view/action combo.
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

        return self::VALID_VIEW;
    }

    public function display404()
    {
		header('HTTP/1.1 404 Not Found');
        $this->view = '404';
        $this->action = 'index';
        $this->displayView();
		exit;
    }

    // 3. Create a function to actually load the view.
    public function displayView()
    {
        // 3a. Test if the requested view exists.  If not, show the 404 page.

        // Pro Tip: Try not to "over develop" by trying to code every feature you think the
        //          client *might* want in the future, and just do the most pragmatic first.
        //          It will be easier to add on later and you won't waste any time.

        // Pro Tip: If you use != instead of !== here, then every view will return true, as
        //          every isValidView() status message is greater than 0.
        if ($this->isValidView($this->view) !== self::VALID_VIEW)
        {
            $this->display404();
            return;
        }

        // If we got this far, we must have a valid view.

        // Before the views can be loaded, however, we really need to run all the code that 
        // needs to be processed before the page is loaded.  For instance, if the user is 
        // attempting to log in, we would need to run this through the UserController first.
        // If they are trying to access restricted pages, such as their  user preferences, 
        // we would need to run them through SecurityController first.

        // 3b: Run any code that needs to be pre-executed based on the view/action.
        $this->preExecute();

        // 3c. Load the view.
        header('Content-Type: text/html; charset=utf-8');
		$html = $this->themeEngine->constructPage($this->view, $this->viewData);
		echo $html;
    }

    // 4. Create a function to facilitate running all the code that needs to execute before
    //    the view is loaded.
    public function preExecute()
    {
        $config = SimpleConfig::getInstance();

        // 4a. Figure out if anything needs to be pre-executed at all.
        // 4b. If the view/action combo is home/index, load the summaries of the first five
        //     articles.
        if ($this->view == 'home' and $this->action == 'index')
        {
            $articleManager = new ArticleManager($config['blog_platform']);
            $summaries = $articleManager->fetchArticleSummaries(5);

            // 4c. Tweak the results received.
            foreach ($summaries as /** @var Article **/ $summary)
            {
                $this->reformatArticleProperties($summary);
            }

            $this->viewData = array('summaries' => $summaries);
        }
        else if ($this->view == 'article' and $this->action == 'index')
        {
            // 4d. Get the article ID.
            $articleID = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);

            // 4e. Get the article.
            $articleManager = new ArticleManager($config['blog_platform']);
            try
            {
                $article = $articleManager->fetchArticleByID($articleID);

				// 4f. Reformat the data.
				$this->reformatArticleProperties($article);

				//$this->viewData = array('article' => $article);
				$this->viewData = array('page_title'    => $article->title . ' | ' . $_SERVER['HTTP_HOST'],
				                        'article_id'    => $article->id,
				                        'article_title' => $article->title,
				                        'main_content'  => $article->body,
				                        'creation_date' => $article->creationDate,
				                        'last_modified' => $article->lastModified);
            }
            catch (ArticleManagerException $e)
            {            
                // 4f. If the article can't be found, set the view to the 404 page.
                if ($e->getCode() === ArticleManagerException::ARTICLE_NOT_FOUND)
                {
                    $this->display404();
                }
                else
                {
                    throw new $e;
                }
            } 
        }
    }

	/**
	 * @param Article $article
	 */
	private function reformatArticleProperties(&$article)
	{
        $article->creationDate = date('Y-m-d h:i:s', $article->creationDate);
        $article->lastModified = date('Y-m-d h:i:s', $article->lastModified);

		if ($article->format == self::ARTICLE_FORMAT_FILTERED)
		{
			$article->teaser = !empty($article->teaser) ? nl2p($article->teaser) : null;
			$article->body = !empty($article->body) ? nl2p($article->body) : null;
		}
	}
}


