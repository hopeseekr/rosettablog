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
?>
<html>
	<head>
		<title>incendiary.ws</title>
		<link href='http://fonts.googleapis.com/css?family=Ubuntu' rel='stylesheet' type='text/css'/>
		<link type="text/css" rel="stylesheet" href="/css/main.css"/>
	</head>
	<body>
		<h1>Incendiary.ws</h1>
		<h4 id="mission">A needle of <em>Hope</em> amid a monstrous haystack of <em>Chaotic Order</em>.</h4>
		<ol>
<?php
	foreach ($summaries as $summary)
	{
?>
			<li class="article_box">
				<h2><a href="<?php echo url_a("index.php?view=article&id={$summary->id}"); ?>"><?php echo $summary->title; ?></a></h2>
				<ul>
					<li>Created: <?php echo $summary->creationDate; ?></li>
					<li>Last modified: <?php echo $summary->lastModified; ?></li>
				</ul>
				<p class="artible_body"><?php echo $summary->teaser; ?></p>
			</li>
<?php
	}	
?>
		</ol>
	</body>
</html>
