<?php
function lire_article($id) {
	global $connexion;
	try {
		$query = $connexion->prepare("SELECT *
									FROM 		posts, users
									WHERE 		users_idusers = idusers
									AND 		idposts  = :id");
		$query->bindValue(':id', $id, PDO::PARAM_INT);
		$query->execute();
		$article = $query->fetch();

	} catch (Exception $e) {
		die('Errur Mysql : '.$e->getMessage());
	}
	return $article;
}