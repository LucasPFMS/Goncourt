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
   b_title VARCHAR(50) NOT NULL,
   b_summary TEXT,
   b_editor VARCHAR(30) NOT NULL,
   b_publication_date DATE NOT NULL,
   b_nb_pages INT NOT NULL,
   b_isbn BIGINT  NOT NULL,
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
(1, 'Philippe','Jaenada',"Philippe Jaenada est l'auteur d'une douzaine de romans, dont Le Chameau sauvage (Julliard, 1997, prix de Flore), La Petite Femelle (2015) et La Serpe (2017, prix Femina) et plus récemment, chez Mialet-Barrault Éditeurs, Au printemps des monstres et La désinvolture est une bien belle chose (2021 et 2024). Il rejoint en cette rentrée littéraire les Éditions Flammarion."),
(2, 'Anne', 'Godard', "Anne Godard est née à Paris en 1971, elle enseigne la littérature et l'écriture créative à l'université Sorbonne-Nouvelle. Elle a publié aux Éditions de Minuit L'Inconsolable en 2006 (prix RTL-Lire) et Une chance folle en 2017 (prix Alain Spiess du deuxième roman). Nous aussi est son troisième roman."),
(3,'Yannick','Haenel',"Yannick Haenel a notamment publié Cercle (prix Décembre 2007 et prix Roger Nimier 2008), Jan Karski (prix Interallié et prix du Roman Fnac 2009) et Tiens ferme ta couronne (prix Médicis 2017)."),
(4, 'Lilia', 'Hassaine',"Lilia Hassaine est notamment l'autrice de Panorama (2023, prix Renaudot des lycéens). JEest son quatrième roman."),
(5,'Sonia','Devillers',"Sonia Devillers est journaliste dans la matinale de France Inter et présentatrice du « Dessous des images » sur Arte. Son premier livre, Les Exportés (Flammarion, 2022), raconte comment sa famille a fui la Roumanie communiste."),
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
(8,'Ananda','Devi',"Née à l'île Maurice, Ananda Devi est l'autrice d'une oeuvre récompensée par de nombreux prix et traduite en une douzaine de langues. Parmi ses livres les plus marquants, on peut citer Ève de ses décombres (Gallimard, 2006, prix des Cinq Continents, prix RFO, prix Télévision Suisse Romande), Le Sari vert (Gallimard 2009, prix Louis Guilloux), Le Rire des déesses (Grasset, 2021, prix Femina des lycéens) et Le Jour des caméléons (Grasset, 2023, prix de la Langue française). Elle a reçu le prestigieux prix américain Neustadt 2024 pour l'ensemble de son oeuvre."),
(9,'Sylvain', 'Prudhomme', "Sylvain Prudhomme est l'auteur de romans, récits et reportages salués par la critique et traduits à l'étranger. Il a reçu le prix Femina en 2019 pour Par les routes. L'Enfant dans le taxi a paru en 2023 aux Éditions de Minuit. Coyote, récit d'un voyage le long de la frontière américano-mexicaine, a reçu le prix Nicolas Bouvier 2025."),
(10,'Clémentine', 'Mélois',"Clémentine Mélois est née en 1980. Elle est notamment l'autrice, aux Editions Grasset, de Cent titres. Sinon j'oublie, Dehors, la tempête, ainsi que du très remarqué Alors c'est bien (« L'Arbalète », Editions Gallimard, 2024)."),
(11,'Boris', 'Bergmann',"Boris Bergmann est né à Paris en 1992. Il est l'auteur de cinq romans dont Nage Libre (prix de la Vocation 2018) et Les Corps insurgés (Prix Fénéon 2020). Il a été pensionnaire de la Villa Medicis et de la Villa Kujoyama. Il a organisé des expositions en France et à l'étranger (autour de l'oeuvre de René Daumal, notamment) et collabore en tant qu'éditeur associé à la revue d'art et de littérature Magma.
Minotaure est son premier roman autobiographique."),
(12,'Jean-Yves', 'Jouannais',"Jean-Yves Jouannais, né en 1964, est professeur à l'École nationale supérieure des beaux-arts de Paris. Il a publié, notamment, L'Idiotie (Beaux-Arts livres), Artistes sans oeuvres (Verticales), Les Barrages de sable (Grasset). De 2008 à 2024, il est l'auteur du cycle de conférences-performances, L'Encyclopédie des guerres, au Centre Pompidou (Paris)."),
(13, 'Olivier','Grondeau'," Après des études littéraires et des emplois de libraire, Olivier Grondeau est parti huit ans sur les routes, avant d'être arrêté en Iran. Libéré en mars 2025, il poursuit désormais des études d'anthropologie. L'écriture l'a toujours accompagné. Joseph dans la nuit est son premier livre."),
(14,'Emma', 'Marsantes',' '),
(15, 'Patrice', 'Trigano',"Dans les années 2000, Patrice Trigano se tourne de plus en plus vers l’écriture tout en conservant son activité de galeriste. Après un premier livre sur l'art et son itinéraire de collectionneur, il a écrit sur Antonin Artaud - un livre salué par le prix Drouot -, Raymond Roussel et Alfred Jarry. Il a publié deux livres de dialogues, le premier avec Alain Jouffroy (À l'ombre des flammes) et le second avec Fernando Arrabal (Rendez-vous à Zanzibar)."),
(16, 'Thélyson', 'Orélien', "Né en 1988, Thélyson Orélien est un auteur québécois d'origine haïtienne. Poète et critique, il construit une oeuvre habitée par la mémoire, l'exil et la question de l'appartenance. Depuis sa publication au Québec par les Éditions du Boréal, C'était ça ou mourir rencontre un écho international exceptionnel et est en cours de traduction dans plus de vingt langues. Un premier roman phénomène qui révèle une grande voix de la littérature contemporaine.")
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

Ancien responsable du magazine Lire, membre du comité de rédaction de la revue L'Histoire et membre de l'académie Goncourt depuis 2012, il a notamment écrit les biographies de Marcel Dassault, Georges Simenon, Gaston Gallimard, Jean Jardin, Daniel-Henry Kahnweiler, Albert Londres ou encore Hergé. Il est l'auteur de milliers d'articles et de chroniques radio.");


INSERT INTO jury VALUES
(1,FALSE,17),
(2,FALSE,18),
(3,FALSE,19),
(4,FALSE,20),
(5,FALSE,21),
(6,FALSE,22),
(7,FALSE,23),
(8,FALSE,24),
(9,TRUE,25),
(10,FALSE,26);

INSERT INTO book VALUES
(1,'Minotaure',"Être l'indésiré, né hors du désir du père, voilà mon acte de naissance.
J'y réponds par un désir extrême, une surenchère d'histoires vécues... ou racontées.
Après tout, le Minotaure est un Forçat du sentiment. Forcé d'aimer tous ceux qu'il rencontre.
Avant de les dévorer.","Grasset",'2026-08-19',242,9782226511874,20.90,11),
(2,'Faire la peau', "Je dis que l'une des plus tenaces fictions tient tout entière dans ce mot, mère. Que la haine qui circule entre les mères et leurs filles est sauvage, et qu'il faut la regarder droit dans les yeux.",
'POL','2026-08-20',286,9782818063583,21,6),
(3,"Chronique d'un royaume perdu","Au Bouchon, petit village isolé de l’île Maurice, quatre générations se succèdent depuis le temps de l’esclavage. La violence se mêle à l’amour, la tendresse à la haine, les plus nobles passions aux vices les plus vils, les sangs des unes aux sangs des autres…
Les cinq fondateurs viennent d’une plantation lointaine  : trois sont nés dans la puissante et blanche famille Dumontais  ; deux d’une esclave noire. Mais les trois blancs sont en vérité le fruit d’une passion entre Madame et le Vieux Bouc, un esclave magnétique qui revendique aussi la paternité des deux derniers. Bannis pour s’être liés d’amour et d’amitié, les cinq enfants devenus grands trouvent refuge dans ce lieu perdu dont ils font leur royaume, autarcique et magique, qu’ils défendent d’un seul corps, puisqu’ici sont abolies les frontières entre passé, présent et avenir  ; vie et mort  ; réel et fantastique.
Tel homme entend sans le vouloir tous les péchés humains  ; telle femme meurt et renait en déesse protectrice  ; un enfant vit parmi les oiseaux quand son cousin viole et tue sans frein  ; le moulin est hanté par les voix des fantômes, la nature donne les plus beaux fruits mais décapite la chapelle  ; les guerres du monde contemporain rencontrent les combats intérieurs de chaque individu et l’histoire de l’humanité se reproduit dans l’infiniment petit de leurs existences débridées. Parmi eux, un enfant timide sera le chroniqueur de ce royaume hors-norme dont il livre les jours de paix, de luttes, et les nuits de folie pour empêcher l’oubli.
Épopée fabuleuse,  mythologie vibrante, fable majestueuse, cette Chronique d’un Royaume perdu est le chef d’œuvre d’Ananda Devi.",'Grasset','2026-08-19',454,9782246846949,24,8),
(4,'Le fabuleux piano',"Après le succès littéraire et commercial de son récit Les Exportés , Sonia Devillers part à la recherche d'un admirable piano à queue, volé par les nazis en 1943. Ce qu'elle nous raconte est bouleversant, instructif, et magistralement mené.
Le fabuleux piano est un instrument volé par les Allemands, en 1943, à des juifs qui le cherchent encore... Dans ce vide impossible à combler, Sonia Devillers entend une résonance intime, le souvenir d'un instrument que sa propre grand-mère, forcée à l'exil, a regretté toute sa vie. Elle part alors sur les traces des pianos fantômes pillés par milliers sous l'Occupation et transportés jusqu'aux confins du IIIe Reich.
Avec cet instrument de concert ressurgit l'incroyable destin d'une famille d'éditeurs de musique, les Enoch. Un siècle de partitions, des menuets de Ravel aux ritournelles de Prévert. Les nazis se sont acharnés sur les Enoch, mais ils ont échoué à les réduire au silence. Des douleurs de la guerre va naître une chanson portée par Yves Montand, Les Feuilles mortes : un triomphe mondial.
Le piano disparu continue pourtant de hanter les survivants...",'R.Laffont','2026-08-27',280,9782221286807,21,5),
(5,'Nous aussi',"On fait partie d'une grande famille. On sait qu'on est privilégiés. On vit ensemble, dans notre immeuble au centre de Paris, on se retrouve l'été dans notre maison à la montagne. On trouve que c'est normal. C'est chez nous, c'est à nous, c'est pour nous. On se ressemble, on se compare, on se confronte, on ne se quitte pas, on se confond, on s'appartient. On ne sait pas comment dire je, on n'en a pas besoin, puisqu'on est nous. Nous les enfants, les frères et soeurs, les cousins, les cousines, on partage tout, nos écoles, nos chambres, nos habits, nos repas, nos jeux, nos bains, nos lits. On est les membres indissociables du grand corps familial. On n'a jamais vécu dehors. On ne sait pas ce que c'est. On n'en est pas capables. On n'en a même pas envie. Et tout aurait dû continuer ainsi, dans un même immuable recommencement. Le jour où la façade s'est fissurée, on n'a pas compris. Ça n'aurait pas dû se produire, pas dans notre famille. Ce n'était pas possible que ça nous arrive, à nous aussi.",
'Actes Sud','2026-08-19',237,9782330225575,20,2),
(6,'Joseph dans la nuit',"Voyageur épris d'ailleurs, de stop et de liberté, Olivier est en route vers Lahore pour fêter la nouvelle année sur une plage indienne. En traversant l'Iran, il est arrêté à Chiraz alors qu'explose le mouvement Femme, Vie, Liberté. Accusé d'espionnage, il reste deux ans et demi en prison.
Olivier est un poète, habitué à vivre de peu, sans confort ni téléphone portable. En cellule, il mobilise tout ce qui peut lui apporter de la lumière, la poésie persane comme les chansons de Britney Spears.
Derrière ses paupières, installé dans un cinéma dont il est le seul spectateur, il se projette des films. La nuit, il convoque dans ses rêves les êtres aimés.
Un récit lumineux et bouleversant qui nous dit que, même dans la nuit, quelque chose en nous refusera toujours de céder. La découverte d'un écrivain.","l'Iconoclaste",'2026-08-20',230,9782378805975,19.90,13),
(7,'La solitude des professeurs est infinie', "Jean Deichel, jeune professeur de français, fait son stage dans un collège de la banlieue parisienne. La nuit, il loge dans un club de tennis à Deuil-la-Barre ; le jour, il découvre les difficultés du métier en même temps que ses joies profondes, la violence de l'École en même temps que sa beauté.

Jean est aussi un poète ivre d'aventure, attentif à trouver la lumière de la « vraie vie » au coeur du quotidien le plus gris : dans des jardins réels ou rêvés, au bord d'un lac, lors d'évasions à Pompéi et à Tarquinia, mais surtout dans la grâce fragile d'un cours réussi.

Entre réalité politique et mystère existentiel, la vie des profs est un roman.",'Gallimard','2026-08-20',313,9782073161925,21.50,3),
(8,'JE',"« - Que savez-vous de la beauté, Antoinette ? Il se tourna vers moi, suspendu à ma réponse. - Pas grand-chose. Mais je sais la reconnaître quand elle est là. - Eh bien moi, chaque fois que je la vois, elle me blesse. Quand je vois votre visage, par exemple, quelque chose en moi se trouve comme ébranlé. »

île de la Jamaïque, 1831. Antoinette Cosway, créole de bonne famille, s'éprend d'Edward Rochester, un Anglais aussi impénétrable que fascinant. Mais à la séduction enflammée succèdent rapidement des scènes vénéneuses, où les baisers sont des blessures, où toute une société livre la jeune femme à son bourreau.

Des années plus tard, Antoinette tente de conquérir sa propre histoire.

JE se situe à mi-chemin entre roman victorien et thriller intimiste contemporain. Lilia Hassaine s'est inspirée du personnage de la première femme de Rochester dans Jane Eyre, le roman culte de Charlotte Brontë. Elle a choisi de lui donner une voix, un corps, une destinée.",
'Gallimard','2026-08-20',248,9782073099945,21,4),
(9,"L'inconnue du quai de Javel","Le 6 septembre 1949, une jeune femme est retrouvée morte quai de Javel, à Paris, sans sac ni chaussures, manifestement rhabillée à la hâte puis déposée là par son assassin. Elle est identifiée le lendemain : c'est Louise Cansot, le modèle le plus demandé par les peintres de Montparnasse. Rapidement, quatre suspects se détachent, évidents, presque des archétypes. On dirait le début d'un roman de Simenon, mais l'inspecteur-chef Ferrière n'a pas le talent de Maigret, et doit se résoudre à classer l'affaire au bout de six mois, sans avoir arrêté personne.

Soixante-quinze ans plus tard, Philippe Jaenada reprend l'enquête à partir du dossier retrouvé puis, comme à son habitude, sollicite ses contacts aux archives, exhume tous les documents, arpente tous les lieux - remonte le temps.

Pour ce livre, il a lu les soixante-quinze enquêtes de Maigret, s'inspirant humblement et fidèlement des méthodes du commissaire fictif. Et il va résoudre ce meurtre bien réel, laissant le lecteur subjugué par la dextérité de son investigation et fasciné par cette jeune femme à laquelle il redonne un visage et une histoire.",
'Flammarion','2026-08-12',528,9782080490896,23,1),
(10,'Une Forêt',"Le capitaine Lenz finissait par se prendre au jeu. S'il n'avait aucun intérêt dans l'affaire, c'est qu'il ne la comprenait pas. Mais sa curiosité était piquée. Et puis, défendre la cause de ces oiseaux allemands, démontrer qu'ils n'étaient pas de fervents nazis représentait somme toute une occupation préférable à l'ennui. ",
'Albin Michel','2026-01-02',106,9782226499523,16.90,12),
(11,"N'efface pas mes cercles","1980, une femme se suicide dans un appartement cossu. Dans les années cinquante, elle s'était unie avec un jeune homme à qui tout l'opposait.

Explorant son histoire familiale, la narratrice tente de démêler les raisons de ce drame et dresse ce faisant le portrait d'une société aux prises avec ses démons : le patriarcat, la guerre, la colonisation, les injonctions à la réussite et au bonheur.

N'efface pas mes cercles remonte le temps à la recherche des destins brisés et restitue avec force l'atmosphère des époques traversées. Cette saga bouleversante confirme le grand art d'Emma Marsantes.",
'Verdier','2026-08-20',153,9782378562953,19.50,14),
(12,'Choses que je croyais perdues',"« Je voulais te dire : sans le faire exprès, j'ai cassé le verre à moutarde Musclor que lu aimais bien. Le prince sous stéroïdes mal imprimé a perdu sa tête, mais il continue de flatter d'une main distraite l'encolure de son tigre vert de compagnie, Tu avais trouvé ce verre dans un vide-greniers où les gens vendaient pas cher de jolies choses. Après l'avoir regardé longtemps, avec intensité, tu l'avais négocié à deux euros. C'était un souvenir d'enfance et ta joie m'avait attendrie. Ça allait encore entre nous à ce moment-là, enfin je crois. »

Seule dans son appartement, une jeune femme emballe ses affaires. Demain, des déménageurs emporteront ces traces fragiles de son existence. Elle pense à l'homme dont elle vient de se séparer, et des histoires surgissent des objets qu'elle manipule. Une assiette au filet d'or, un ensemble H&M couleur poil de chameau, un rouleau de Sopalin : ces témoins d'une vie ordinaire ont autant à raconter qu'un trépidant roman d'aventures...

Que reste-t-il de ce que nous avons vécu ? De quelles légendes sommes-nous faits ? Les grandes amours comme les petits riens, les désillusions et les désirs sont au coeur de ce roman plein de surprises, à la fantaisie incomparable.",
'Gallimard','2026-08-20',162,9782073162854,19,10),
(13,"C'était ça ou mourir","Le premier roman de Thélyson Orélien est déjà le phénomène littéraire de l’année 2026. En cours de traduction dans plus d’une vingtaine de langues, C’était ça ou mourir a conquis le Québec et bientôt le monde entier, en racontant l’Odyssée de Jonas Dorléon.
Après l’embrasement de son quartier de Port-au-Prince, Jonas n’emporte presque rien avec lui en quittant Haïti : un diplôme, un cahier de poèmes, la photo de sa mère. Toute une vie dans un sac plastique. Se réfugiant d’abord en République dominicaine, puis au Brésil et au Mexique, ce professeur d’histoire franchit les frontières tantôt à bord d’un autobus surchauffé, tantôt en affrontant les profondeurs de la jungle. À chaque étape des visages surgissent, des corps tombent, des solidarités se nouent puis se brisent. Dans l’espoir d’atteindre le Canada et le peu de famille qu’il lui reste, Jonas se retrouve aux portes des États-Unis, seul face aux agents de l’ICE et d’une administration prête à tout pour mener sa chasse aux migrants.
Avec la trajectoire de Jonas, c’est une cartographie intime de la survie qui se dévoile. Aussi contemporain qu’universel, ce roman raconte les migrations au présent — non comme un concept, mais comme une expérience physique : marcher, avoir faim, se blesser, rire devant l’horreur pour ne pas abandonner. Thélyson Orélien y déploie une écriture foisonnante, traversée d’humour et de poésie, une langue d’exil qui s’apprend « sans grammaire, sans dictionnaire, juste avec les os et la peau ».
Porté par un souffle narratif irrésistible, C’était ça ou mourir est un premier roman bouleversant qui révèle un écrivain majeur de notre temps.",'Grasset','2026-08-19',266,9782246847069,21.50,16),
(14,"De l'autre côté du lac","« Paola était comme ça. Elle était entière. Elle voulait toujours que tout soit vrai, les rapports humains, les discussions, les rencontres, les projets dans lesquels elle s’engageait. Elle ne supportait pas les faux-semblants, les demi-mesures. Elle était d’un bloc. Elle disait les mots ont de la valeur. Les actes ont de la valeur. Elle voulait qu’il y ait de l’enjeu. C’est dans l’inconfort qu’on se découvre, elle disait. C’est dans l’inconfort qu’on grandit. »

Aux abords d’un lac de haute montagne, à la lisière d’une réserve interdite aux humains, un groupe de chercheurs s’affaire. Parmi eux, une photographe aperçoit sur un des versants quelque chose qui échappe au regard de tous les autres. Les signes étranges s’accumulent, un corps est retrouvé. La photographe décide de rester là-haut, seule. 
Quelques mois plus tard, c’est elle qui, à son tour, disparaît. 

Avec ce roman tout en tension, Sylvain Prudhomme approfondit plusieurs thèmes qui lui sont chers : le désir d’intensité, l’appel du sauvage, le rêve d’une vie vraie. ",'Minuit','2026-08-27',279,9782707358233,22,9),
(15,"La guerre éternelle: souvenirs de Troie","« Pour donner à ma longue rêverie la forme d'un livre, j'avais besoin de voir. De la terre, des pierres, des arbres, un rivage. J'ai toujours besoin de voir. Je suis allé en Troade à la fin d'un mois de juin, alors que les coquelicots jetaient de grandes flaques rouges au milieu des champs de blé et d'oliviers où jadis s'affrontaient les héros. »

Il y a quelque trente-trois siècles, des guerriers grecs ravagent une cité d'Asie Mineure qu'ils appellent Troïa ou Ilios. Les hommes sont massacrés, les femmes traînées en esclavage. C'était dans la nuit des temps, mais grâce à l'Iliade cela vit toujours dans notre mémoire. C'était, aussi bien, hier, aujourd'hui, demain : la tragédie de la destruction d'une ville n'a cessé d'être réécrite en lettres de feu et de sang, depuis Carthage un siècle et demi avant notre ère jusqu'à Dresde et Hiroshima, Marioupol et Gaza de nos jours. La guerre de Troie est éternelle, et Troie est la Mère de toutes les villes martyrisées.",
'Gallimard','2026-08-20',219,9782073121349,20,7),
(16,'Bataille au procès',"En 1956, Georges Bataille est appelé à témoigner au procès de Jean-Jacques Pauvert, poursuivi pour avoir publié les œuvres de Sade. L’auteur d'Histoire de l'oeil comprend que la morale menace de mort la littérature. L’audience devient le miroir de sa propre vie. Les souvenirs affluent : enfance marquée par la folie d’un père aveugle et paralytique, l’indifférence d’une mère réfugiée dans la religion. Des événements qui ont émaillé son parcours surgissent : expériences limites dans ses amours placées sous l’égide de la transgression, visions de guerre et de sacrifice qui le hantent, traversée du mal, liens tourmentés avec le parti communiste, haine du fascisme… Réflexions et fulgurances se mêlent en un vertige où pensée et vie s’entrelacent, entre érotisme et sacré, extase et mort. Mais derrière ces éclats affleure aussi une énigme plus obscure. Refusera-t-elle de se dévoiler ?À travers cet épisode de la vie littéraire, Patrice Trigano accompagne Bataille au plus près de son vertige intérieur. Il explore ce point où l’écriture n’obéit plus à l’auteur, où l’œuvre surgit comme une puissance étrangère, excessive, qui le dépasse.Patrice Trigano a fait des études de droit et de philosophie avant de consacrer sa vie à l’art en tant que galeriste, écrivain et dramaturge. Ses livres sont publiés aux éditions de la Différence, Léo Scheer, Mercure de France et Maurice Nadeau. Il a publié en 2024, La Promesse de l’art, Mémoires d’un galeriste aux Éditions du Canoë.",
'M.Nadeau','2026-08-21',136,9782862316857,19,15);