<?php
function login_user($login, $password) {
	global $connexion;
	try {
		$query = $connexion->prepare("SELECT *
									FROM 		users
									WHERE 		login  	= :login
									AND			pass 	= :pass");
		$query->bindValue(':login', $login, PDO::PARAM_STR);
		$query->bindValue(':pass', md5($password), PDO::PARAM_STR );
		$query->execute();

		$user = $query->fetch();

		$nb_reponses = $query ->rowCount();

		if ($nb_reponses = 0) {
			return 0;
		}
		elseif ($nb_reponses = 1) {
			$_SESSION["user"] = $user;
			return 1;
		}
		else {
			return 2;
		}

	} catch (Exception $e) {
		die('Errur Mysql : '.$e->getMessage());
	}
}