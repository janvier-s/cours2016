<?php
try {
	global $connexion;
	$dns = 'mysql:host=localhost;dbname=3A1';
	$utilisateur = 'sabates';
	$mot_de_passe = '564426';

	$options = array(
		PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8",
		PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION);

	$connexion = new PDO($dns, $utilisateur, $mot_de_passe, $options);


} catch (Exception $e) {
	echo "connexion impossible :", $e->getMessage();
	die();
}