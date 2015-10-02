<?php include("view/layout/header.php") ?>
<body>
	<div class="container">
		<h1>Page d'accueil</h1>
	</div>
	<div class="menu">
	<h2>Catégories</h2>
		<ul>
			<?php foreach ($categories as $categorie) { ?>
			<li>
			<a href="?cat=<?php echo $categorie['idcategories']; ?>"><?php echo $categorie["descr"];?></a>
			</li>
			<?php } ?>
			<li><a href="?cat=0">all</a></li>
			<br>
		</ul>
	</div>
	<h2>Articles</h2>
	<div class="article">
		<?php foreach ($articles as $article) { ?>
		<p>
			Titre :
			<a href="?action=article&amp;id=<?php echo $article['idposts']; ?>"><?php echo $article["title"]; ?></a>
			<br/>
			Article :
			<?php echo substr($article["content"],0, MAXCHAR); ?>
			<br/>
			Auteur :
			<?php echo $article["display_name"]; ?>
			<br/>
			Catégorie :
			<?php echo $article["descr"]; ?>
			<br/>
		</p>
		<?php } ?>
	</div>

	<div>
		<a href="?page=1">1</a>
		<a href="?page=2">2</a>
		<a href="?page=3">3</a>
		<a href="?page=4">4</a>
		<a href="?page=5">5</a>
	</div>
<?php include("view/layout/footer.php") ?>