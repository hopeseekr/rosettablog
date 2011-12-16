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

$baseURL = url_a('baseURL');
?>
<html>
	<head>
        <base href="<?php echo $baseURL; ?>"/>
		<title><?php echo $page_title; ?></title>
		<link href='http://fonts.googleapis.com/css?family=Ubuntu' rel='stylesheet' type='text/css'/>
		<link type="text/css" rel="stylesheet" href="css/main.css"/>
	</head>
	<body>
		<h1><?php echo $config['blog_name']; ?></h1>
<?php
	if (!empty($config['mission'])) {
?>
		<h4 id="mission"><?php echo $config['mission']; ?></h4>
<?php } ?>
        <div class="breadcrumbs"><a href="">Home</a></div>
