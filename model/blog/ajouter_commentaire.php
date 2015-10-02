<?php
function ajouter_commentaire($post) {
	global $connexion;
	try {
		$insert = $connexion -> prepare("insert into comments
										(posts_idposts, users_idusers, content)
										values
										(:id, :author, :content)");
		$insert->bindValue(':id', $post["id"], PDO::PARAM_INT);
		$insert->bindValue(':author', $_SESSION['user']['0'], PDO::PARAM_INT);
		$insert->bindValue(':content', $post["commentaire"], PDO::PARAM_STR);

		$insert->execute();

		return true;

	} catch (Exception $e) {
		echo("Une erreur est survenue".$e -> getMessage());
		return false;
	}
}