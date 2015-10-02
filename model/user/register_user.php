<?php
function ajouter_user($login, $pass, $mail, $display_name) {
	global $connexion;
	try {
		$insert = $connexion -> prepare("insert into users(login, pass, email, display_name)
										values
										(:login, :pass, :email, :display_name)");
		$insert->bindValue(':login', $login, PDO::PARAM_STR);
		$insert->bindValue(':pass', md5($pass), PDO::PARAM_STR);
		$insert->bindValue(':email', $mail, PDO::PARAM_STR);
		$insert->bindValue(':display_name', $display_name, PDO::PARAM_STR);

		$insert->execute();

		return true;

	} catch (Exception $e) {
		echo("Une erreur est survenue : ".$e -> getMessage());
		return false;
	}
}