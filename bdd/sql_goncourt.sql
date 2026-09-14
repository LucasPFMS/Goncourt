-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 08 sep. 2024 à 16:48
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `goncourt`
--

CREATE DATABASE IF NOT EXISTS `goncourt`

CREATE TABLE `main_character`(
   m_id INT,
   m_firstname VARCHAR(30),
   m_lastname VARCHAR(30),
   PRIMARY KEY(m_id)
);


CREATE TABLE author(
   a_id INT,
   a_firstname VARCHAR(30),
   a_lastname VARCHAR(30),
   a_biography TEXT,
   PRIMARY KEY(a_id)
);


CREATE TABLE jury(
   j_id INT,
   j_is_president BOOLEAN NOT NULL,
   j_a_id INT NOT NULL,
   PRIMARY KEY(j_id),
   UNIQUE(j_a_id),
   FOREIGN KEY(j_a_id) REFERENCES author(a_id)
);


CREATE TABLE book(
   b_id INT,
   b_summary VARCHAR(400),
   b_editor VARCHAR(30) NOT NULL,
   b_publication_date DATE NOT NULL,
   b_nb_pages INT NOT NULL,
   b_isbn INT NOT NULL,
   b_price DECIMAL(5,2) NOT NULL,
   b_a_id INT NOT NULL,
   PRIMARY KEY(b_id),
   FOREIGN KEY(b_a_id) REFERENCES author(a_id)
);

CREATE TABLE include(
   i_b_id INT,
   i_m_id INT,
   PRIMARY KEY(i_b_id, i_m_id),
   FOREIGN KEY(i_b_id) REFERENCES book(b_id),
   FOREIGN KEY(i_m_id) REFERENCES main_character(m_id)
);

INSERT INTO author VALUES 
(1, 'Philippe','Jaenada',"Philippe Jaenada est né à Saint-Germain-en-Laye où ses grands-parents maternels possédaient le restaurant Le Grand Cerf. Issu d’une famille de pieds-noirs récemment revenue d’Algérie, il grandit dans une banlieue pavillonnaire, à Morsang-sur-Orge en Essonne. Après des études scientifiques, il s’installe à Paris en 1986 où il enchaîne les petits boulots pendant plusieurs années. Sa première nouvelle est publiée en 1990 dans L'Autre Journal. Ses sept premiers romans sont d'inspiration autobiographique. Outre ses livres, il a écrit des articles pour le magazine Voici pendant plusieurs années, avant d’arrêter en 2022 pour se concentrer pleinement à ses romans. Avec sa compagne Anne-Catherine Fath, ils ont un fils, Ernest, né en août 2000. Habitant le 10e arrondissement, il a ses habitudes au Bistrot Lafayette."),
(2, 'Anne', 'Godard', "Anne Godard est la fille d'un père libraire. Après un CAPES et une agrégation de lettres modernes obtenue en 1995, Anne Godard soutient en 2000 sa thèse (sous la direction d'Yves Hersant) sur le thème de « La Renaissance dialogique. Imitation et dialogisme dans les dialogues de la Renaissance ». En 2002, elle devient maitresse de conférence en « Langue et littérature françaises » à l'université Sorbonne-Nouvelle où elle enseigne dans le département de français langue étrangère. Ses travaux portent sur la lecture subjective, l'écriture créative et le plurilinguisme littéraire.

Son premier roman, L'Inconsolable, est publié par Les Éditions de Minuit et obtient le grand prix RTL-Lire en 2006. Ecrit à la deuxième personne, il aborde le thème du deuil et de la mise à distance des vivants.

Plus de dix ans après la sortie de son premier roman – Anne Godard explique passer par des phases de nécessité et d'impossibilité d'écriture – paraît son deuxième roman, Une chance folle, dont la « genèse très longue » a été liée à la difficulté de « trouver une voix, finalement simple, puisqu'il s'agit de laisser parler la jeune fille », Magda, personnage central de l'œuvre, qui s'émancipe progressivement d'une histoire qu'elle porte comme un stigmate.

Elle publie en 2026 Nous aussi chez Actes Sud. Un roman choral écrit au on indéfini, portrait du fonctionnement toxique d’une grande famille bourgeoise, dont les enfants sont comme les membres d’un grand corps indifférencié."),
(3,'Yannick','Haenel',"En 1997, il fonde la revue Ligne de risque, qu'il anime aujourd'hui avec François Meyronnis et Valentin Retz. Il enseigne le français jusqu'en 2005 au lycée La Bruyère de Versailles.

Il publie plusieurs romans, dont Introduction à la mort française et Évoluer parmi les avalanches, ainsi qu'un essai sur les tapisseries de La Dame à la licorne intitulé À mon seul désir. Il codirige également deux volumes d'entretiens avec Philippe Sollers, Ligne de risque et Poker.

En 2007, il publie dans la collection « L'Infini » (éditions Gallimard), dirigée par Philippe Sollers, Cercle, roman qui reçoit le prix Décembre et le prix Roger-Nimier.

En 2008-2009, Haenel est pensionnaire à l'Académie de France à Rome-Villa Médicis.

En 2009, il publie le roman Jan Karski, qui reçoit le prix Interallié.

En 2017, il publie le roman Tiens ferme ta couronne, finaliste du prix Goncourt et lauréat du prix Médicis.

Yannick Haenel est chroniqueur pour le magazine de littérature et de cinéma Transfuge, depuis 2010, et à Charlie Hebdo, depuis la reprise de la publication après les attentats de janvier 2015.

En 2024, il fonde la revue Aventures ainsi qu'une collection éponyme aux éditions Gallimard.

En 2026, il publie La solitude des professeurs est infinie aux éditions Gallimard, le roman est retenu pour la première sélection du Prix Goncourt."),
(4, 'Lilia', 'Hassaine',"Lilia Hassaine, née en 1991, est une romancière, journaliste française et chroniqueuse de télévision. En septembre 2019, elle publie un premier roman fantastique, chez Gallimard, L'Œil du paon. Son livre est retenu dans la sélection du prix de la Vocation 2020.

Son deuxième roman, Soleil amer, publié en août 2021, aborde l'intégration des populations algériennes dans la société française, des années 1960 aux années 1980. Le Figaro estime que « la plume de Lilia Hassaine est fine, singulière, juste, quand elle parle de la solitude ». En septembre 2021, il figure sur la liste des quinze livres retenus pour le prix Goncourt 2021. En mars 2022, Lilia Hassaine reçoit le 41e Prix littéraire de la Ville de Caen. Soleil amer est lauréat du prix lycéen de L'Echappée littéraire 2023.

De 2022 à 2024, Lilia Hassaine est un membre du Prix Méduse ; elle ne l’est plus en 2025.Elle reçoit le prix Renaudot des lycéens pour son troisième roman, Panorama.
Son roman Je, publié en 2026, est sélectionné dans la première liste du prix Goncourt 2026, du prix Jean Giono et du prix du livre Pentu."),
(5,'Sonia','Devillers',"Sonia Devillers, née le 31 janvier 1975 aux Lilas, est une journaliste, animatrice de radio et écrivaine française. Après avoir travaillé pendant dix ans au Figaro, elle poursuit principalement sa carrière à France Inter, où elle se spécialise notamment dans l'analyse des médias avec l'émission L'Instant M, qu'elle présente de 2014 à 2022. À partir de 2022, elle conduit des entretiens dans la matinale de la station. Depuis la rentrée 2025, elle prend en charge la seconde partie de La Grande Matinale, de 9 h à 11 h, et y présente notamment Le Grand Portrait.

Depuis 2022, elle présente également sur Arte l'émission Le Dessous des images. Elle publie en 2022 Les Exportés, premier récit consacré à l'histoire de sa famille maternelle juive roumaine et au système par lequel la Roumanie communiste a monnayé l'émigration de certains de ses citoyens juifs."),
(6,'Louise', 'Chennevière',"À 26 ans, elle sort son premier livre, Comme la chienne, un roman qui donne la parole à plusieurs voix de femmes, à travers leurs expériences douloureuses : psychiatrie, IVG, viol, incestes, pulsions meurtrières, boulimie, culte de l'apparence, transmission des névroses de mère en fille, infanticide, prostitution. Le livre est qualifié de « violent et intelligent, moderne et polyphonique » par le magazine Diacritik.

En 2021, à 28 ans, elle sort son second roman, Mausolée. Il s'agit d'une longue lettre d’amour d’une femme à l’homme qui l’a quittée. Le livre rencontre un grand succès critique et est traduit en espagnol (éditions Dos Manos) et en italien (Giulio Perrone editore).

Elle contribue régulièrement à des ouvrages sur l'histoire de l'art dans lesquels elle déploie une pensée féministe de la représentation. Elle écrit notamment pour le catalogue de l'exposition Suzanne Valadon au Centre Pompidou, pour le musée Delacroix, pour le Louvre. Elle participe à l'ouvrage 100 poètes d'aujourd'hui des Editions du Louvre.

En mai 2024, elle écrit une tribune dans Libération afin de répondre à celle de l'écrivain Arthur Dreyfus, publiée dans le même journal et dans laquelle il condamne l’inscription de «#MeToo» par l’artiste Deborah De Robertis sur la vitre recouvrant le tableau L'origine du monde de Gustave Courbet. Elle a publié d'autres tribunes remarquées, comme celle sur Gérard Depardieu sur le site Lundimatin.

En septembre 2024, elle sort son troisième roman, Pour Britney. L'autrice est également la narratrice de ce livre dans lequel elle raconte sa passion d'enfance pour Britney Spears et évoque la sexualisation subie par l'ancienne star, par Nelly Arcan et par les femmes en général, qui bride leur liberté. Le livre rencontre un grand succès public et installe son œuvre. Il passe en poche en février 2026, sort au Brésil au printemps 2026. D'autres traductions sont en cours.

À la rentrée littéraire 2026, l'autrice publie Faire la peau un témoignage sur sa séparation avec sa mère la designer Odile Soudant. Le livre fait partie de la première sélection du prix Goncourt et du Prix Philippe Sollers.

En septembre 2026, elle intégrera la Villa Médicis en tant que pensionnaire, pour un an."),
(7,'Olivier','Rolin', "Son œuvre est inspirée par Mai 68 et la Gauche prolétarienne, les aventures romanesques au Soudan, ainsi que par ses nombreux voyages, en particulier en Russie.

Il a obtenu le prix Femina pour Port-Soudan en 1994, le prix France Culture pour Tigre en papier en 2003 et le prix du Style pour Le Météorologue en 2014.

Ce dernier roman conte le destin tragique d'Alexéï Féodossévitch Vangengheim, accusé en 1934 de crimes contre l'URSS, et dont la vie, les convictions et les pensées sont décrites et interprétées tout au long de son périple, depuis son poste de dirigeant du service hydro-météorologique unifié de l'URSS à sa mort dans une fosse commune au pied d'une colline en Karélie.

Il reçoit en 2010 le grand prix de littérature Paul-Morand de l'Académie française pour l'ensemble de son œuvre.

Ses œuvres complètes ont été publiées en deux volumes en 2011 et 2012 sous le titre générique Circus. Un important dossier lui a été consacré à l'été 2017 par la revue Europe.

Il a écrit à trois reprises dans la revue Le Meilleur des mondes (un article sur l'assassinat d'Ilan Halimi, un autre intitulé « La métis du roman » et un troisième sur la Kolyma).

En 2015, à la suite des attentats du 13 novembre 2015 en France, il publie dans Le Monde des livres une chronique pour répondre aux jihadistes. Il y affirme :

« Le djihadisme est sans doute une maladie de l'islam, mais il entretient précisément avec cette religion le rapport incontestable qu'a une maladie au corps qu'elle dévore. »

En 2026, son ouvrage La Guerre éternelle fait partie de la première sélection du prix Goncourt, du Prix Renaudot de l'essai et du Prix Philippe Sollers."),
(8,'Ananda','Devi',"Ananda Devi (de son nom complet Ananda Devi Nirsimloo-Anenden), née le 23 mars 1957 à Trois Boutiques dans le district de Grand Port, est une femme de lettres mauricienne. Elle est lauréate du prix Neustadt, le prix littéraire appelé le « Nobel américain »."),
(9,'Sylvain', 'Prudhomme', "Sylvain Prudhomme, né en 1979 à La Seyne-sur-Mer, est un écrivain français.

Il est l'auteur de romans et de reportages, dont plusieurs ont pour cadre l'Afrique contemporaine, où il a vécu et travaillé."),
(10,'Clémentine', 'Mélois',"Son premier livre, Cent Titres, paraît en 2014, préfacé par Jacques Roubaud. Il s'agit d'un recueil de cent couvertures de grands classiques de la littérature, détournées par l’image, dans un jeu sur les habitudes de lecture et les codes éditoriaux traditionnels.

En 2017, Sinon j'oublie est un recueil de textes inspirés de sa collection de listes de courses, reproduites en fac-similé. La structure est déterminée par une contrainte déjà utilisée par Georges Perec dans La Vie mode d'emploi : la polygraphie du cavalier.

Entre 2015 et 2018, elle intervient régulièrement dans l'émission Des Papous dans la tête, sur France Culture.

En 2020 est publié l'essai Dehors la tempête. Par des allers-retours entre la vie des personnages de fiction et la sienne, Clémentine Mélois fait pénétrer au plus près de l'imaginaire du lecteur.

En 2021, Les Six Fonctions du langage se présente comme un précis de linguistique sous la forme d'un roman-photo. Les images sont extraites de romans-photos brésiliens des années 1960, retouchées et repeintes à la main.

En 2024, avec Alors c'est bien, récit sur la vie de son père, ses derniers jours et la préparation de son enterrement, est salué par la critique ; il est notamment lauréat des prix Méduse, Georges Brassens et Eugène Dabit.

Elle écrit aussi pour la jeunesse : en 2015, avec Jean-Loup fait des trucs, aux éditions Les Fourmis rouges, elle signe le texte et les dessins. Ce livre est suivi de nombreux autres, en collaboration avec Rudy Spiessert, publiés à L'École des loisirs, notamment la série Les Chiens pirates et Chère Bertille.

Clémentine Mélois est cooptée à l'Oulipo en juin 2017."),
(11,'Boris', 'Bergmann',"Son premier roman, Viens là que je te tue ma belle, aux éditions Scali, journal imaginaire d'un jeune adolescent qui découvre la nuit et la transgression à travers le rock and roll, reçoit le prix de Flore du lycéen. Ce roman est adapté en 2012 pour Arte par Jean-Stéphane Sauvaire sous le titre de Punk, avec Béatrice Dalle, Paul Bartel, Marie-Ange Casta et Bernie Bonvoisin.

En janvier 2010, il publie son second roman, 1 000 Mensonges, aux éditions Denoël : les confidences d'un menteur qui tombe amoureux.

En août 2016, il sort son troisième roman, Déserteur, aux éditions Calmann-Levy : le récit d'un jeune hacker utilisé par l'armée pour programmer les drones dans la guerre contre le califat. Envoyé en mission dans le désert, il sera forcé de prendre part à des actes terribles qui vont le pousser à s'engager et à se faire face pour la première fois.

Il a également collaboré à de nombreuses revues littéraires (La Règle du Jeu, Edwarda, L'écho d'Orphée, Les Poètes Bodybuildés, Possession Immédiate) ainsi qu'à divers magazines et journaux.

En septembre 2017, il est admis comme pensionnaire de la Villa Medicis, promotion 2017/2018. Son projet porte sur le fanatisme.

En janvier 2018, il sort son quatrième roman, Nage libre : l'histoire d'Issa, jeune d'un Paris populaire, qui va se libérer par la nage, la quête de désirs et d'amitié. Nage Libre reçoit le prix littéraire de la vocation 2018 ainsi que le prix Révélation de la Société des Gens de Lettres."),
(12,'Jean-Yves', 'Jouannais',"Adolescent, Jean-Yves Jouannais fonde la Revue perpendiculaire. La troupe monte à Paris où Jean-Yves Jouannais devient rédacteur en chef de la revue Art Press.

Jean-Yves Jouannais est l'auteur de plusieurs essais, romans et ouvrages collectifs. Il a été le rédacteur en chef de la revue Exhibition (émission d'art contemporain diffusée sur Arte. Production MK2 TV).

Depuis 2009, il anime le spectacle-conférence vidéo L'encyclopédie des guerres visible au Centre national d'art et de culture Georges-Pompidou et au Palais du Tau à Reims entre autres. Son projet est de compiler une encyclopédie de toutes les guerres de l'histoire de l'humanité, et d'en partager uniquement les citations recueillies."),
(13, 'Olivier','Grondeau','   '),
(14,'Emma', 'Marsantes',' '),
(15, 'Patrice', 'Trigano',"Dans les années 2000, Patrice Trigano se tourne de plus en plus vers l’écriture tout en conservant son activité de galeriste. Après un premier livre sur l'art et son itinéraire de collectionneur, il a écrit sur Antonin Artaud - un livre salué par le prix Drouot -, Raymond Roussel et Alfred Jarry. Il a publié deux livres de dialogues, le premier avec Alain Jouffroy (À l'ombre des flammes) et le second avec Fernando Arrabal (Rendez-vous à Zanzibar)."),
(16, 'Thélyson', 'Orélien', "Thélyson Orélien est un écrivain québécois d’origine haïtienne. Poète, romancier, essayiste, chroniqueur et critique, il est notamment l’auteur du roman C’était ça ou mourir, publié en 2026 aux Éditions du Boréal au Québec et annoncé la même année chez Grasset pour l’Europe francophone.")
(17,'Pascal', 'Bruckner',"Pascal Bruckner, né le 15 décembre 1948 dans le 15e arrondissement de Paris, est un philosophe, romancier et essayiste français.

Il se fait connaître dès les années 1970-1980 comme l'un des représentants des « nouveaux philosophes ». Après des études de philosophie à l'université université Paris-I, université Paris-VII et à l'École pratique des hautes études, il soutient une thèse consacrée à l'émancipation sexuelle sous la direction de Roland Barthes.

Bruckner est l'auteur d’une œuvre diverse comprenant des essais philosophiques et sociétaux, des romans, ainsi que des contributions régulières dans la presse française. Son essai Le Nouveau Désordre amoureux, coécrit avec Alain Finkielkraut, est son premier succès. Il a aussi écrit le roman Les Voleurs de beauté, lauréat du prix Renaudot en 1997.

En parallèle de son activité d'écrivain, il a enseigné dans des universités américaines, été maître de conférences à Sciences Po Paris, et collaboré avec de nombreux médias. Ses prises de position publiques lui ont valu reconnaissance et controverses."),
(18,'Eric-Emmanuel','Schmitt',"Éric-Emmanuel Schmitt enseigne un an au lycée militaire de Saint-Cyr pendant son service militaire, puis deux ans à l’université de Besançon en tant qu’assistant-normalien, puis un an dans un lycée de Cherbourg. Il est ensuite élu maître de conférences à l'université de Chambéry, où il enseigne durant quatre ans.

Le succès français puis international de sa pièce Le Visiteur en 1994 lui fait quitter l’université pour se consacrer entièrement à l’écriture.


Éric-Emmanuel Schmitt à la foire du livre de Bruxelles en 2012.
Installé à Bruxelles depuis 2002, il a acquis la nationalité belge en 2008. Le 9 juin 2012 il est élu à l’Académie royale de langue et de littérature françaises de Belgique au fauteuil 33, celui qu’avaient occupé Colette et Cocteau.

En 2016, il devient membre de l'Académie Goncourt et publie un roman d’enquête sur la violence et le sacré, L'Homme qui voyait à travers les visages.

Éric-Emmanuel Schmitt a aussi entrepris un livre qui raconte l'histoire de l'humanité dans une épopée de huit tomes. La série est intitulée La Traversée des Temps et jusqu'à date, seulement les cinq premières parties ont été publiées, soit Paradis perdus en 2021, La Porte du ciel en 2021, Soleil sombre en 2022, La Lumière du bonheur en 2024 et Les deux royaumes en 2025."),
(19,'Didier','Decoin',"Didier Decoin, né le 13 mars 1945 à Boulogne-Billancourt (Seine) et mort le 5 août 2026 à Villejuif (Val-de-Marne), est un écrivain et scénariste français.

Il est lauréat du prix Goncourt en 1977 pour John l'Enfer, membre, de 1995 à 2026, de l'académie Goncourt, qu'il préside de 2020 à 2024.")
(20, 'Paule','Constant',"Paule Michèle Marie-Rose Constant passe une grande partie de sa vie à l'étranger, notamment en Afrique, en Asie et en Amérique du Sud. Elle vit ensuite à Aix-en-Provence.

Son père fut médecin au Cameroun et à Cayenne. Elle grandit enfant à Cayenne puis près de ses grands-parents dans la région de Pau. Elle se marie en 1968 avec le docteur Auguste Bourgeade et s'installe à Abidjan. En 1972, elle donne naissance à son fils au CHU de Cocody où travaille son mari.

Elle entreprend en 1968 une carrière d'universitaire. En 1974 puis 1987, elle soutient une thèse de doctorat ès lettres. Elle fut notamment professeure à l'Université Félix Houphouët-Boigny d'Abidjan et à l'Université d'Aix-Marseille.

Elle reçoit le prix Goncourt en 1998 pour Confidence pour confidence et, le 8 janvier 2013, est élue à l'unanimité à l'Académie Goncourt au couvert de Robert Sabatier.

En 2010, elle est faite officier de la Légion d'honneur, puis en 2015 grand officier de l'ordre national du Mérite."),
(21,'Christine','Angot',"Christine Angot, née Schwartz le 7 février 1959 à Châteauroux (Indre), est une romancière, une dramaturge et une cinéaste française. Elle pratique fréquemment la lecture publique de ses textes, notamment sur scène.

L'œuvre littéraire de cette figure emblématique de l'autofiction — un terme que toutefois elle récuse — ainsi que ses nombreux articles et ses interventions médiatiques suscitent la controverse. Depuis la parution de L'Inceste en 1999, elle est devenue une personnalité de la littérature francophone contemporaine, lauréate du prix France Culture en 2005, du prix de Flore en 2006, du prix Décembre en 2015 et du prix Médicis en 2021. Elle est membre de l’académie Goncourt depuis le 28 février 2023. Son premier film en tant que réalisatrice, Une famille, sort le 20 mars 2024."),
(22,'Tahar', 'Ben Jelloun',"Tahar Ben Jelloun est un écrivain, poète et peintre franco-marocain né le 1er décembre 1944 à Fès (Maroc). Auteur de nouvelles, romans, poèmes et essais, il est lauréat du prix Goncourt pour son roman La Nuit sacrée."),
(23,'Camille', 'Laurens',"Née le 6 novembre 1957 à Dijon (Côte-d'Or), Camille Laurens est agrégée de lettres modernes et docteure en création littéraire et artistique. Elle enseigne à Rouen, puis à partir de 1984 au Maroc, où elle passe douze ans. En 2012-2013, elle enseigne à l'Institut d'études politiques de Paris.

De 2007 à 2019, elle fait partie du jury du prix Femina. Elle est membre de l'Académie Goncourt depuis le 11 février 2020.

Ses ouvrages sont traduits dans une trentaine de langues. Un colloque international est consacré à son œuvre en 2019."),
(24,'Françoise','Chandernagor',"Françoise Chandernagor, née le 19 juin 1945 à Palaiseau (Essonne), est une femme de lettres et haut fonctionnaire française. Membre de l'Académie Goncourt, elle écrit une quinzaine d'ouvrages après avoir travaillé dans la haute administration française."),
(25,'Philippe','Claudel', "Très attaché à la Lorraine où il est né et réside, il est maître de conférences en littérature et anthropologie culturelle à l'université de Lorraine. Il y enseigne à l'Institut européen de cinéma et d'audiovisuel, en particulier l'écriture scénaristique. Philippe Claudel a également été professeur en prison et auprès d'adolescents handicapés physiques. Auteur d'une quarantaine de livres publiés, ses principaux romans sont traduits dans le monde entier. L'univers carcéral et les drames liés à la question migratoire sont deux thématiques qu'il travaille particulièrement depuis quelques années.

Il entre à l'Académie Goncourt le 11 janvier 2012 au couvert de Jorge Semprún. Il est fait docteur honoris causa de la Katholieke Universiteit Leuven, le lundi 2 février 2015. Il est élu membre de l'Académie royale de langue et de littérature françaises de Belgique en avril 2016, au siège d'Assia Djebar. Il y est reçu le samedi 29 avril 2017.

Lundi 13 mai 2024, Philippe Claudel est élu nouveau président de l’académie Goncourt."),
(26, 'Pierre','Assouline',"Pierre Assouline est un journaliste, chroniqueur de radio, romancier et biographe français, né le 17 avril 1953 à Casablanca (alors dans le protectorat français au Maroc).

Ancien responsable du magazine Lire, membre du comité de rédaction de la revue L'Histoire et membre de l'académie Goncourt depuis 2012, il a notamment écrit les biographies de Marcel Dassault, Georges Simenon, Gaston Gallimard, Jean Jardin, Daniel-Henry Kahnweiler, Albert Londres ou encore Hergé. Il est l'auteur de milliers d'articles et de chroniques radio.")