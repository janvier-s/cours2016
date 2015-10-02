<?php
function lire_commentaires($id) {
	global $connexion;
	try {
		$query = $connexion->prepare("SELECT *
									FROM 	 comments, users
									WHERE 	 posts_idposts = :id
									and 	 users_idusers 	= idusers
									ORDER BY idcomments DESC");
		$query->bindValue(':id', $id, PDO::PARAM_INT);
		$query->execute();
		$commentaires = $query->fetchAll();

	} catch (Exception $e) {
		die('Errur Mysql : '.$e->getMessage());
	}
	var_dump($commentaires);
	return $commentaires;
}