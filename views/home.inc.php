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
<?php require '_header.tpl.php'; ?>
		<ol>
<?php
	$articleNum = count($summaries);
	foreach ($summaries as $summary)
	{
?>
			<li class="article_box" value="<?php echo $articleNum; ?>">
				<h2><a href="<?php echo url_a("index.php?view=article&id={$summary->id}"); ?>"><?php echo $summary->title; ?></a></h2>
				<div class="article_body"><?php echo $summary->teaser; ?></div>
				<table class="date_box">
					<tr>
						<td><?php echo $summary->creationDate; ?></td>
<?php
		if ($summary->lastModified != $summary->creationDate)
		{
?>
						<td>Last modified: <?php echo $summary->lastModified; ?></td>
<?php
		}
?>

					</tr>
				</table>
			</li>
<?php
		--$articleNum;
	}
?>
		</ol>
<?php require '_footer.tpl.php'; ?>
