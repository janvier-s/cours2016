
<?php include("view/layout/header.php") ?>
<body>
	<div class="container">
		<h1>Login</h1>
	</div>

	<div>
		<a href="?">Retour à l'accueil</a>
	</div>
	<?php include("view/include/notification.php"); ?>
	<div id="sidebar2">
		<form id="formu" name="formu" action="" method="post">
			<div>Nom</div>
			<div>
				<input type="text" name="login" size="30" value=""/>
			</div>
			<div>Mot de passe</div>
			<div>
				<input type="password" name="password" size="30" value=""/>
			</div>
			<div>
				<input type="checkbox" name="mem" /> Se souvenir de moi
			</div>
			<div>
				<input type="submit" value="Login" />
			</div>
		</form>
	</div>
<?php include("view/layout/footer.php") ?>