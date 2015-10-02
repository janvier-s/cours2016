<?php
//contolleur article
if (!isset($_POST["id"])) {
	include_once("model/blog/lire_article.php");
	$article = lire_article($_GET["id"]);

	include_once("model/blog/lire_commentaires.php");
	$commentaires = lire_commentaires($_GET["id"]);

	include_once("view/blog/article.php");
} else {
	include_once("model/blog/ajouter_commentaire.php");
	ajouter_commentaire($_POST);

	header("location:?module=blog&action=article&id=". $_GET["id"]);
}
