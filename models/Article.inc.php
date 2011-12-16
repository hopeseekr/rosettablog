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
* The Article class is responsible for holding the data of articles and making
* sure its properly formatted and validated, among other things.
* It is a Struct datatype, and that is why its properties are public.
*/
class Article
{
    public $id;
    public $title;
    public $creationDate;
    public $lastModified;
    public $teaser;
    public $body;
	public $format;
	public $teaserEqualsBody = false;
}

