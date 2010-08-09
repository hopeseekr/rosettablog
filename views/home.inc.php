<html>
	<head>
		<title><?php echo $article->title; ?> | incendiary.ws</title>
		<style type="text/css" rel="stylesheet" media="all">
.article_box { border: 1px solid #aaa; width: 40em; padding: 15px 30px 15px 30px; }
		</style>
	</head>
	<body>
		<h1>Incendiary.ws</h1>
		<div class="article_box">
			<h2><?php echo $article->title; ?></h2>
			<ul>
				<li>Created: <?php echo $article->created; ?></li>
				<li>Last modified: <?php echo $article->changed; ?></li>
			</ul>
			<p class="artible_body"><?php echo $article->body; ?></p>
		</div>			
	</body>
</html>