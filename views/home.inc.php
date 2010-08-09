<html>
	<head>
		<title>incendiary.ws</title>
		<style type="text/css" rel="stylesheet" media="all">
.article_box { border: 1px solid #aaa; width: 40em; padding: 15px 30px 15px 30px; margin: 10px 0 10px 0; }
		</style>
	</head>
	<body>
		<h1>Incendiary.ws</h1>
		<ol>
<?php
	foreach ($summaries as $summary)
	{
?>
			<li class="article_box">
				<h2><?php echo $summary->title; ?></h2>
				<ul>
					<li>Created: <?php echo $summary->created; ?></li>
					<li>Last modified: <?php echo $summary->changed; ?></li>
				</ul>
				<p class="artible_body"><?php echo $summary->body; ?></p>
			</li>
<?php
	}	
?>
		</ol>
	</body>
</html>