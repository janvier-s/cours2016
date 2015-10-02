<!DOCTYPE html>
<html>
<head>
	<title>Blog</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="./assets/css/styles.css">
</head>
<?php
	if (!isset($_SESSION['user'])){
		echo"<a href='?module=user&amp;action=login'>Login</a>";
		echo"</br>";
		echo"<a href='?module=user&amp;action=register'>S'enregistrer</a>";
		} else {
		echo"Bonjour, ".$_SESSION['user']['1'];
		echo"</br>";
		echo"<a href='?module=user&amp;action=logout'>Logout</a>";
	}
?>
