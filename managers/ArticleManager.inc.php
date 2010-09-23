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

class ArticleManagerException extends Exception
{
	const INVALID_PARAM = 1;
	const ARTICLE_NOT_FOUND = 2;
}

interface ArticleManagerI
{
	/**
	*  1. Fetch an article based on its ID.
	* 
	* @param int $articleID
	* @return Article
	*/
	public function fetchArticleByName($articleName);

	// 2. Fetch the summaries of x articles, offset by y positions.
	public function fetchArticleByID($articleID);
	public function fetchArticleSummaries($articleLimit, $offset = 0);
}

/**
* The ArticleManager is responsible for creating, reading, updating, and deleting blog 
* articles, among other responsibilities.
* Uses the delegate pattern.
*/
class ArticleManager implements ArticleManagerI
{
	/** @var ArticleManagerI **/
	private $articleManager;

	public function __construct($blogPlatform)
	{
		$className = $blogPlatform . 'ArticleManager';
		$this->articleManager = new $className();
	}

	public function fetchArticleByName($articleName)
	{
		return $this->articleManager->fetchArticleByName($articleName);
	}

	// 2. Fetch the summaries of x articles, offset by y positions.
	/**
	 *
	 * @param mixed $articleID
	 * @return Article
	 */
	public function fetchArticleByID($articleID)
	{
		return $this->articleManager->fetchArticleByID($articleID);
	}

	public function fetchArticleSummaries($articleLimit, $offset = 0)
	{
		return $this->articleManager->fetchArticleSummaries($articleLimit, $offset);
	}
}

