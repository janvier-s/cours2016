<?php
function liste_categories() {
	global $connexion;
	try {
		$query = $connexion->prepare("SELECT * FROM categories
									order by descr");
		$query->execute();
		$categories = $query->fetchAll();

	} catch (Exception $e) {
		die('Errur Mysql : '.$e->getMessage());
	}
	return $categories;
}