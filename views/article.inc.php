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
?>
<html>
	<head>
		<title><?php echo $article->title; ?> | incendiary.ws</title>
		<style type="text/css" rel="stylesheet" media="all">
.article_box { border: 1px solid #aaa; width: 40em; padding: 15px 30px 15px 30px; margin: 10px 0 10px 0; }
		</style>
	</head>
	<body>
		<h1>Incendiary.ws</h1>
		<div class="article_box">
			<h2><a href="<?php echo url_a("index.php?view=article&id={$article->id}"); ?>"><?php echo $article->title; ?></a></h2>
			<ul>
				<li>Created: <?php echo $article->created; ?></li>
				<li>Last modified: <?php echo $article->changed; ?></li>
			</ul>
			<p class="artible_body"><?php echo nl2p($article->body); ?></p>
		</div>
	</body>
</html>