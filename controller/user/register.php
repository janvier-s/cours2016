<?php
	if (!isset($_POST["login"])) {
		include_once("view/user/register.php");
	} else {
		include_once("model/user/register_user.php");

		ajouter_user($_POST["login"], $_POST["password"], $_POST["mail"], $_POST["display_name"]);

		include_once("model/user/login_user.php");
		login_user($_POST["login"], $_POST["password"]);
		header("location:?module=user&action=register&conf=ok");
	}

 ?>