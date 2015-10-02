
<?php include("view/layout/header.php") ?>
<body>
	<div class="container">
		<h1>Page d'article</h1>
	</div>
	<div>
		<a href="?">Retour à l'accueil</a>
	</div>
	<div>
		<p>
			Titre :
			<strong><?php echo $article["title"]; ?></strong>
			</a>
			<br/>
			Article :
			<?php echo substr($article["content"],0, MAXCHAR); ?>
			<br/>
			Auteur :
			<?php echo $article["display_name"]; ?>
			<br/>
		</p>
	</div>
	<div>
		<h2>Commentaires</h2>
		<?php foreach ($commentaires as $commentaire) { ?>
		<p>
			Commentaire :
			<?php echo $commentaire["content"]; ?>
			<br/>
			Publié le :
			<?php echo $commentaire["date"]; ?>
			<br/>
			Par :
			<?php echo $commentaire["display_name"]; ?>

		</p>
		<?php } ?>
	</div>
	<div id="sidebar2">
		<h2>Commentez !</h2>
		<form id="formu" name="formu" action="" method="post">
			<input type="hidden" name="id" size="3" value="<?php echo $_GET["id"]; ?>" />
			<div><textarea name="commentaire" rows="5" cols="40"></textarea></div>
			<div><input type="submit" value="Envoyer" /></div>
		</form>
	</div>
<?php include("view/layout/footer.php") ?>