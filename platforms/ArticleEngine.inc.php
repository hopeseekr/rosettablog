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

interface ArticleEngine
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
	public function fetchArticleSummaries($articleLimit = 10000000, $offset = 0);
}
