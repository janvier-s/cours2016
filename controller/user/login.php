<?php
	if (!isset($_POST["login"])) {
		include_once("view/user/login.php");
	} else {
		include_once("model/user/login_user.php");
		$login = $_POST["login"];
		$password = $_POST["password"];
		if (login_user($login, ($password)) == false) {
			header("location:?module=user&action=login&log=error");
		} else {
			switch (login_user($login, $password)) {
				case 0:
				echo "unknown user";
				break;

				case 1:
				if (isset($_POST["mem"])) {
					if (!setcookie("mem", $login."|".$password, time()+3600*24*7)) {
						echo "cookie error";
					}
				}

				header('location: ?module=user&action=login&log=ok');

				default:
					echo "error user";
					break;
			}
		}
	}
?>