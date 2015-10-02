-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- GÃ©nÃ©rÃ© le :  Lun 03 Novembre 2014 Ã  10:42
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de donnÃ©es :  `sabates`
--

-- --------------------------------------------------------

--
-- Structure de la table `blog_categories`
--

CREATE TABLE IF NOT EXISTS `blog_categories` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_descr` varchar(50) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `blog_categories`
--

INSERT INTO `blog_categories` (`cat_id`, `cat_descr`) VALUES
(1, 'La gauche'),
(2, 'La droite'),
(3, 'Les autres'),
(5, 'Le centre');

-- --------------------------------------------------------

--
-- Structure de la table `blog_comments`
--

CREATE TABLE IF NOT EXISTS `blog_comments` (
  `comment_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ClÃ© primaire',
  `comment_post_ID` int(11) NOT NULL COMMENT 'ClÃ© vers le post',
  `comment_author` int(11) NOT NULL COMMENT 'ClÃ© vers l''auteur',
  `comment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date du commentaire',
  `comment_content` text NOT NULL COMMENT 'Texte du commentaire',
  PRIMARY KEY (`comment_ID`),
  KEY `fk_blog_comments_blog_posts1` (`comment_post_ID`),
  KEY `fk_blog_comments_blog_users1` (`comment_author`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `blog_comments`
--

INSERT INTO `blog_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_date`, `comment_content`) VALUES
(1, 1, 2, '2012-04-11 12:27:00', 'Cette campagne est ennuyeuse Ã  mourir !'),
(2, 1, 2, '2012-04-10 11:27:34', '30% d''abstension attendue ...'),
(3, 2, 2, '2012-04-10 12:29:23', 'Les commentaires sur les blogs ne sont que rarement intÃ©ressants'),
(4, 2, 2, '2012-06-07 09:35:28', 'Test de commentaire');

-- --------------------------------------------------------

--
-- Structure de la table `blog_posts`
--

CREATE TABLE IF NOT EXISTS `blog_posts` (
  `post_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ClÃ© primaire',
  `post_author` int(11) NOT NULL COMMENT 'ClÃ© vers l''auteur',
  `post_category` int(11) NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date du post',
  `post_content` longtext NOT NULL COMMENT 'Contenu du post',
  `post_title` text NOT NULL COMMENT 'Titre du post',
  PRIMARY KEY (`post_ID`),
  KEY `fk_blog_posts_blog_users` (`post_author`),
  KEY `fk_blog_posts_blog_categories1` (`post_category`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Contenu de la table `blog_posts`
--

INSERT INTO `blog_posts` (`post_ID`, `post_author`, `post_category`, `post_date`, `post_content`, `post_title`) VALUES
(1, 1, 2, '2012-04-10 10:00:00', 'Â« Nous irons au pouvoir car câ€™est que veulent les FranÃ§ais, jâ€™en suis certaine. Câ€™est ce que nous voulons tous Â». Nous Ã©tions alors en janvier 2011, et la prÃ©sidente du Front National, Ã  peine investie Ã  la tÃªte de son parti, nâ€™hÃ©sitait pas Ã  afficher clairement son objectif : faire sortir lâ€™extrÃªme droite de sa fonction dâ€™agitatrice politique pour lâ€™amener aux portes de lâ€™ElysÃ©e. Alors poussÃ©e par des sondages incroyablement favorables, lâ€™hÃ©ritiÃ¨re rÃªve dÃ©jÃ  de renouveller Â« lâ€™exploit Â» du 21 avril et, mieux encore, de mener un second tour au coude Ã  coude contre lâ€™un des candidats de Â« lâ€™UMPS Â».\r\n\r\nDÃ©jÃ  trÃ¨s active dans la campagne de 2007, celle qui Ã©tait alors la fille du chef a eu tout le temps dâ€™observer et de comprendre les complexes ressorts du vote frontiste. Ainsi capable dâ€™analyser le lien entre peur de lâ€™Ã©tranger et malaise social, elle refonde totalement le discours Ã©conomique de son parti, en nâ€™hÃ©sitant pas Ã  convoquer pour lâ€™occasion Marx ou Roosevelt dans ses argumentaires. Le FN nâ€™est ainsi plus tellement perÃ§u comme le dÃ©fenseur du franÃ§ais de souche que comme celui du Â« peuple opprimÃ© Â» par les ravages dâ€™un Â« mondialisme aveugle Â». La fameuse Â« dÃ©diabolisation Â» est en marche, et elle passera par lâ€™exclusion des Ã©lements les plus sulfureux de son partiâ€¦ prÃ©sidentialisation oblige.\r\n\r\nLâ€™opÃ©ration semble rÃ©ussirâ€¦ ouvriers, cadres, artisans sâ€™avouant dÃ©sormais sÃ©duits par une candidate Â« plus ouverte que son pÃ¨re Â», sur les sujets qui fÃ¢chent. Peu Ã  peu, la Â« vague bleue Marine Â», forte dâ€™une nouvelle respectabilitÃ©, prend son Ã©lan et finit par inquiÃ©ter les Ã©tats-majors des grands partis. La premiÃ¨re onde de choc tombera le 20 mars 2011, au soir du premier tour des Ã©lections cantonales, alors que lâ€™extrÃªme droite progresse sur lâ€™ensemble du territoire et arrache un premier canton, celui de Carpentras.\r\n\r\nGalvanisÃ©e par des rÃ©sultats supposÃ©s prometteurs, la candidate se satisfait dâ€™une stratÃ©gie jusque lÃ  rÃ©ussie : renvoyer dos Ã  dos UMP et PS pour mieux promouvoir Â« la nouvelle Ã©lite Â», celle qui se souciera du sort dâ€™un Ã©lectorat oubliÃ© par la mondialisation et victime de lâ€™appÃ©tit vorace dâ€™une finance toute-puissante. Quelques mois plus tard, Jean-Luc MÃ©lenchon reconnaÃ®tra lui mÃªme quâ€™elle Ã©tait alors, dans lâ€™esprit des Ã©lecteurs, la seule reprÃ©sentante de la France du non, et par extension celle des classes populaires dÃ©Ã§ues de la mondialisation.\r\n\r\nLa Â« prÃ©sidente Â», malgrÃ© un retour parfois violent sur ce que lâ€™on appelle pudiquement les fondamentaux de son Ã©lectorat, ne bougera dÃ©sormais plus dâ€™un iota : elle est, selon elle, devenue Â« la seule candidate de la rÃ©volte populaire Â», ou encore Â« la seule voie de lâ€™exception franÃ§aise Â», en clair : la seule qui changera vraiment la gouvernance du pays. Histoire dâ€™appuyer la parole par lâ€™image, elle rythme sa campagne par des bains de foule visant Ã  la dÃ©peindre en vÃ©ritable star du peupleâ€¦ Illustration\r\n\r\n\r\n\r\nEn plein cÅ“ur dâ€™HÃ©nin-Beaumont, petite ville du Pas-de-Calais devenue la vitrine dâ€™une extrÃªme droite en phase avec les angoisses des ouvriers, la frontiste joue la partition au millimÃ¨tre et sâ€™affiche tout sourire avec des tÃªtes blondes arborant fiÃ¨rement leur t-shirts Â« Marine 2012 Â»â€¦ histoire de dire que le Front National nâ€™effraie pas les enfants. DÃ©diabolisation, encore et toujours.\r\n\r\nMais, comme nous lâ€™avions dÃ©jÃ  vu, les diffÃ©rents partis ont beaucoup appris de 2002 en dÃ©veloppant Ã  leur tour un discours rassurant et protecteur, tandis que Jean Luc MÃ©lenchon a su rebattre les cartes en ressuscitant la gauche anti-libÃ©rale. A 12 jours du premier tour, et alors que la candidate stagne Ã  dix points derriÃ¨re FranÃ§ois Hollande, on peut ainsi prÃ©sumer sans risque quâ€™elle ne crÃ©era pas la surprise cette annÃ©e. Il nâ€™en reste pas moins le troisiÃ¨me parti de France, et le simple fait quâ€™il occupe cette position constitue en soi un dÃ©fi majeur pour la classe politique Â« traditionnelle Â». Le Front National peut en attendant toujours tabler sur un scÃ©nario dÃ©jÃ  plus probable et qui lâ€™avantagerait considÃ©rablement aux lÃ©gislatives, Ã  savoir la possible explosion de lâ€™UMP en cas de dÃ©faite de Nicolas Sarkozy le 6 maiâ€¦', 'Lâ€™ambition rÃ©publicaine du Front National'),
(2, 2, 1, '2012-04-05 12:00:00', 'Il serait dÃ©sormais le troisiÃ¨me homme de cette prÃ©sidentielle, autrement dit celui capable de peser de tout son poids pour rebattre les cartes dâ€™une campagne jusque lÃ  trÃ¨s binaire. Jean Luc MÃ©lenchon, fort de sa nouvelle position, le martÃ¨le tant quâ€™il peut, il ne veut pas dâ€™une Â« Ã©lection Ã  la papa Â» ou lâ€™austÃ©ritÃ© sociale-dÃ©mocrate donnerait platement la rÃ©plique Ã  lâ€™austÃ©ritÃ© libÃ©rale. Tout semblait pourtant bien balisÃ© jusque lÃ  : les socialistes pouvaient compter sur un anti-sarkozisme fort pour se laisser pousser vers lâ€™ElysÃ©e en prÃ©sentant un programme Â« solidaire Â» mais aussi Â« gestionnaire Â»â€¦ histoire dâ€™Ãªtre de gauche sans avoir Ã  froisser les prÃ©cieuses voix du centre.\r\n\r\nPreuve que les Ã©lections nâ€™aiment pas les scÃ©narios Ã©crits Ã  lâ€™avance, cette stratÃ©gie se retrouve aujourdâ€™hui bousculÃ©e par les grosses caisses du Front de Gauche, qui sâ€™est accomodÃ© au mieux dâ€™un Ã©lectorat qui refuse de rÃ©sumer lâ€™avenir politique Ã  la simple rÃ©duction des dÃ©ficits. RÃ©unissant peu Ã  peu les syndicats, les trotskistes, les communistes, les dÃ©Ã§us du socialisme ou encore les Ã©cologistes radicaux, lâ€™ancien sÃ©nateur aura ainsi rempli un objectif presque utopique : fÃ©dÃ©rer la gauche radicale sous un mÃªme Ã©tendard, tout en renouant avec des scores dignes de Georges Marchais.\r\n\r\nRÃ©sultat dâ€™une alliance politique et dâ€™une synthÃ¨se idÃ©ologique sÃ©duisante, la dynamique Front de Gauche doit aussi, pour beaucoup, Ã  une personnalitÃ© peu commune et talentueuse.\r\n\r\nIci Ã  la Bastille, fin fÃ©vrier, pour un rassemblement visant Ã  contrer lâ€™adoption du traitÃ© europÃ©en de rigueur budgÃ©taire, lâ€™ancien socialiste affichait dÃ©jÃ  une attitude des plus optimistes.\r\n\r\n\r\n\r\nAlors que FranÃ§ois Hollande venait dâ€™annoncer quâ€™il comptait taxer les gros revenus Ã  hauteur de 75%, le candidat du Front de Gauche Ã©tait aux anges : lâ€™acte reprÃ©sentait en soi la reconnaissance de son mouvement comme force politique influente. Dans une manifestation initialement dÃ©diÃ©e Ã  la politique de lâ€™Union EuropÃ©enne, lâ€™homme du jour profite de ce tremplin en distillant un message pluriel et efficace. Railleur envers Hollande, flatteur avec les Ã©colos et solidaire de la cause ouvriÃ¨re, Jean Luc MÃ©lenchon a su dÃ©passer avec talent son rÃ´le de leader communiste pour sâ€™imposer comme un tribun rassembleur. Câ€™est dâ€™ailleurs lÃ  tout le talent du monsieur : savoir Ãªtre Â« de gauche en gÃ©nÃ©ral et de gauche en particulier Â».\r\n\r\nDÃ©sormais lâ€™autre visage de lâ€™opposition peut parler dâ€™une mÃªme voix, et fort de cette union, il nâ€™est pas impossible que quelques pages estampillÃ©es Â« Front de Gauche Â» puissent venir se greffer aux 60 propositions de FranÃ§ois Hollande au lendemain du premier tour. Dâ€™ici lÃ  le principal enjeu reste de tenir la distance, et de sâ€™assurer que lâ€™alliance nouvellement forgÃ©e rÃ©siste Ã  la diversitÃ© de lâ€™Ã©lectorat rassemblÃ©.', 'Lâ€™attrape-tout MÃ©lenchon'),
(3, 1, 3, '2012-03-31 09:00:00', 'FranÃ§ois Bayrou hibernait-il ces derniÃ¨res semaines? La question mÃ©rite dâ€™Ãªtre posÃ©e. Il aura fallu attendre le 25 mars pour que le candidat Â« central Â» tienne son premier, oui, son premier grand meeting, en prÃ©sence de tous ses soutiens officiels. A vingt-huit jours du premier tour, il Ã©tait temps. Car aprÃ¨s son envolÃ©e du mois de dÃ©cembre suite Ã  lâ€™annonce de sa candidature, FranÃ§ois Bayrou est en perte de vitesse dans les sondages qui le placent dÃ©sormais en cinquiÃ¨me position. Il fallait rÃ©pliquer.\r\nAlors, aprÃ¨s lâ€™effet Bourget de FranÃ§ois Hollande, lâ€™effet Villepinte de Nicolas Sarkozy et surtout juste aprÃ¨s lâ€™effet Bastille de Jean-Luc MÃ©lenchon, le prÃ©sident du MoDem, a profitÃ© du passage Ã  lâ€™heure dâ€™Ã©tÃ© pour remettre les pendules Ã  lâ€™heure et crÃ©er lâ€™effet ZÃ©nith. Plus de six mille personnes et un message dâ€™espoir pour lancer, ou plutÃ´t relancer la campagne au centre et dÃ©livrer les Ã©lecteurs du dÃ©bat imposÃ© Droite-Gauche. Et pas question de se laisser impressionner par les enquÃªtes dâ€™opinion dÃ©favorables. Une dÃ©monstration de force, oui, mais toujours tranquille.\r\n\r\nEn coulisses, juste avant dâ€™entrer en scÃ¨ne pour prÃªcher la bonne parole dans un discours quasi mystique, FranÃ§ois Bayrou affiche devant les camÃ©ras dâ€™Â« ElysÃ©e 2012, la vraie campagne Â» sa sÃ©rÃ©nitÃ©.\r\n\r\n\r\n\r\nÂ« Il nâ€™y a pas dâ€™espoir du cÃ´tÃ© de chez eux Â». Ainsi parlait FranÃ§ois Bayrou qui, dans un lyrisme Â« Proustien Â», sâ€™en prenait une fois encore au bipartisme UMP-PS. Un bipartisme dont le prÃ©sident du MoDem ne saurait pourtant se passer, car sa position stratÃ©gique dâ€™homme du centre ne pourrait exister aujourdâ€™hui sans cette gÃ©ographie politique.\r\nÂ« Un pas en avant, deux pas en arriÃ¨re Â»â€¦ FranÃ§ois le FranÃ§ais abandonne Proust pour emprunter Ã  la lutte sociale un vocabulaire contestataire et tenter de sâ€™imposer comme le premier opposant aux deux Â« grands Â» de cette Ã©lection. Mais la situation de 2012 nâ€™est pas celle dâ€™il y a cinq ans. Le parti socialiste, cette fois-ci, est en ordre de bataille, uni derriÃ¨re son candidat ; prÃ©cieux atout dont avait Ã©tÃ© privÃ©e SÃ©golÃ¨ne Royal. Et MÃ©lenchon, plus fort que jamais, semble, pour lâ€™instant, voler la vedette Ã  celui qui fÃ»t lâ€™arbitre de 2007.\r\nAlors, FranÃ§ois Bayrou est venu parler dâ€™espoir. Peut-Ãªtre est-il venu en chercher aussi, au milieu de ces milliers de sympathisants rassemblÃ©s. Nos camÃ©ras ont filmÃ© ce jour-lÃ  un meeting en grand. Lâ€™effet ZÃ©nith est Ã  nos yeux rÃ©ussi. Mais de ces six mille personnes venues des quatre coins de la France par navettes mises Ã  disposition par le parti, quâ€™en est-il vraiment de lâ€™Ã©lectorat du centre. Les Ã©lectrons libres qui ne veulent ni dâ€™Hollande, ni de Sarkozy, auront-ils cette fois-ci encore le rÃ©flexe consensuel et Â« gÃ©ographique Â» du vote centriste ? Mieux encore pour le candidat du Modem, se laisseront-ils envoÃ»ter par lâ€™espoir portÃ©, ou du moins invoquÃ©, par le BÃ©arnais ? Une chose est sÃ»re pour lâ€™homme du Â« milieu Â», il faudra bien regarder du cÃ´tÃ© de chez euxâ€¦.', 'Lâ€™espoir fait vivreâ€¦ FranÃ§ois Bayrou'),
(10, 1, 2, '2012-06-14 09:42:00', 'contenu de texte', 'titre de test'),
(11, 2, 1, '2012-06-14 10:23:29', 'texte1sdfdsfsdf', 'titre1'),
(17, 2, 3, '2013-05-28 07:44:49', 'test 234', 'titre 234'),
(18, 2, 1, '2013-05-28 08:26:20', 'contenu 333', 'titre 333'),
(19, 2, 3, '2013-05-28 09:44:27', 'contenu du 666', 'titre 666'),
(20, 1, 3, '2013-05-28 10:27:00', 'contenu du 555', 'titre 555'),
(21, 2, 1, '2013-05-28 13:43:12', 'contenu classe 2', 'titre classe 2'),
(22, 1, 1, '2013-05-28 13:47:29', 'utrdtdkyks', 'testtttt'),
(23, 2, 1, '2013-05-28 15:10:28', 'contenu de texte classe 1', 'titre classe 1'),
(24, 1, 3, '2013-05-28 15:12:31', 'Test envoie de donnÃ©es', 'TEST 1'),
(25, 1, 3, '2013-05-28 15:14:47', 'test donnÃ©e', 'TEST 1'),
(26, 1, 3, '2013-05-28 15:16:22', 'addaad', 'TEST 1'),
(27, 2, 3, '2014-01-27 17:32:36', 'Le texte de l''article', 'test aut 2 cat 3'),
(28, 1, 1, '2014-01-27 17:36:46', 'Test de message sur l''auteur 1 et la catÃ©gorie 1', 'aut 1 cat 1'),
(29, 1, 1, '2014-01-28 11:28:40', 'test1', 'aut1 cat1'),
(30, 1, 1, '2014-01-28 11:30:40', 'test1', 'aut1 cat1'),
(31, 1, 1, '2014-01-28 11:33:53', 'test1', 'aut1 cat1'),
(32, 2, 2, '2014-05-26 08:20:00', 'le texte de dupont qui parle de la droite', 'dupont droite'),
(33, 1, 1, '2014-05-26 10:26:50', 'le texte de admin sur la gauche', 'admin la gauche'),
(34, 2, 3, '2014-05-26 13:15:31', 'texte de dupont', 'les autres pour dupont');

-- --------------------------------------------------------

--
-- Structure de la table `blog_users`
--

CREATE TABLE IF NOT EXISTS `blog_users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ClÃ© primaire',
  `user_login` varchar(60) NOT NULL COMMENT 'Login',
  `user_pass` varchar(64) NOT NULL COMMENT 'Password',
  `user_email` varchar(100) NOT NULL COMMENT 'Email',
  `display_name` varchar(250) NOT NULL COMMENT 'Nom affichÃ©',
  `user_photo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `blog_users`
--

INSERT INTO `blog_users` (`ID`, `user_login`, `user_pass`, `user_email`, `display_name`, `user_photo`) VALUES
(1, 'admin', 'admin', 'admin@blog.com', 'Administrateur 2', NULL),
(2, 'dupont', '123456', 'dupont@lemail.com', 'Jean Dupont', NULL),
(3, 'test', 'pass', 'test@mail.com', 'test display', NULL),
(5, 'test', 'pass', 'test@mail.com', 'test display3', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;