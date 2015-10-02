<?php
function lire_articles($cat, $limit, $offset) {
	global $connexion;
	try {
		if ($cat == 0) {
			$query = $connexion->prepare("SELECT * FROM posts, categories, posts_has_categories, users
										where posts_idposts 			= idposts
										and users_idusers 				= idusers
										and categories_idcategories 	= idcategories
										ORDER BY date desc
									 	LIMIT :offset, :limit");
			$query->bindValue(':limit', $limit, PDO::PARAM_INT);
			$query->bindValue(':offset', $offset, PDO::PARAM_INT);
			$query->execute();
			$articles = $query->fetchAll();
		} else {
			$query = $connexion->prepare("SELECT * FROM posts, categories, posts_has_categories, users
										where posts_idposts 			= idposts
										and users_idusers 				= idusers
										and categories_idcategories 	= idcategories
										and idcategories = :cat
										ORDER BY date desc
									 	LIMIT :offset, :limit");
			$query->bindValue(':cat', $cat, PDO::PARAM_INT);
			$query->bindValue(':limit', $limit, PDO::PARAM_INT);
			$query->bindValue(':offset', $offset, PDO::PARAM_INT);
			$query->execute();
			$articles = $query->fetchAll();
		}
	}
	catch (Exception $e) {
		die('Errur Mysql : '.$e->getMessage());
	}
	return $articles;
}