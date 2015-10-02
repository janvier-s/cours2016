<?php
//Controller
include_once("model/user/login_user.php");
if (!isset($_SESSION["user"]) || !$_SESSION["user"]) {
		if (isset($_COOKIE["mem"])) {
			$data = explode("|", $_COOKIE["mem"]);
			$login = $data[0];
			$password = $data[1];
			login_user($login, $password);
		}
	}

if (!isset($_GET["page"])) {
	$page = 1;
} else {
	$page = $_GET["page"];
}

if (!isset($_GET["cat"])) {
	$cat = 0;
} else {
	$cat = $_GET["cat"];
}

$offset = ($page - 1) * MAXART;

include_once("model/blog/lire_articles.php");
$articles = lire_articles($cat, MAXART, $offset);

include_once("model/blog/liste_categories.php");
$categories = liste_categories();

include_once("view/blog/index.php");