-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 07 juil. 2024 à 20:05
-- Version du serveur : 8.0.31
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bio-app-metier`
--

-- --------------------------------------------------------

--
-- Structure de la table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
CREATE TABLE IF NOT EXISTS `equipment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `equipment`
--

INSERT INTO `equipment` (`id`, `name`) VALUES
(4, 'Spectrophotomètre UV-Vis'),
(5, 'Chromatographe en phase liquide'),
(6, 'Centrifugeuse réfrigérée'),
(7, 'pH-mètre'),
(8, 'Microscope électronique'),
(9, 'Analyseur de gaz'),
(10, 'Système d’électrophorèse'),
(11, 'Balance analytique'),
(12, 'Autoclave'),
(13, 'Réacteur biochimique');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE IF NOT EXISTS `project` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `project`
--

INSERT INTO `project` (`id`, `name`, `description`, `start_date`, `end_date`, `status`) VALUES
(2, 'Projet Eau Pure', 'Analyse de la qualité de l\'eau dans différentes régions.', '2024-01-01 00:00:00', '2024-06-30 00:00:00', 0),
(3, 'Projet Air Propre', 'Évaluation de la pollution de l\'air dans les zones urbaines.', '2024-02-15 00:00:00', '2024-08-15 00:00:00', 1),
(4, 'Projet Sol Sain', 'Étude de la contamination des sols agricoles.', '2024-03-01 00:00:00', '2024-09-01 00:00:00', 2),
(5, 'Projet Aliment Sûr', 'Contrôle de la sécurité alimentaire dans les produits transformés.', '2024-04-01 00:00:00', '2024-10-01 00:00:00', 0),
(6, 'Projet Eau de Mer', 'Examen de la pollution chimique dans les eaux marines.', '2024-05-01 00:00:00', '2024-11-01 00:00:00', 1),
(7, 'Projet BioAir', 'Surveillance des bioaérosols dans les hôpitaux.', '2024-06-01 00:00:00', '2024-12-01 00:00:00', 2),
(8, 'Projet Agriculture Verte', 'Analyse des résidus de pesticides dans les produits agricoles.', '2024-07-01 00:00:00', '2025-01-01 00:00:00', 0),
(9, 'Projet Eaux Usées', 'Évaluation de la charge polluante des eaux usées industrielles.', '2024-08-01 00:00:00', '2025-02-01 00:00:00', 1),
(10, 'Projet Air des Montagnes', 'Mesure de la pureté de l\'air en haute altitude.', '2024-09-01 00:00:00', '2025-03-01 00:00:00', 2),
(11, 'Projet BioSol', 'Étude des microorganismes présents dans les sols forestiers.', '2024-10-01 00:00:00', '2025-04-01 00:00:00', 0),
(12, 'Projet Eau Pure', 'Analyse de la qualité de l\'eau dans différentes régions.', '2024-01-01 00:00:00', '2024-06-30 00:00:00', 0),
(13, 'Projet Air Propre', 'Évaluation de la pollution de l\'air dans les zones urbaines.', '2024-02-15 00:00:00', '2024-08-15 00:00:00', 1),
(14, 'Projet Sol Sain', 'Étude de la contamination des sols agricoles.', '2024-03-01 00:00:00', '2024-09-01 00:00:00', 2),
(15, 'Projet Aliment Sûr', 'Contrôle de la sécurité alimentaire dans les produits transformés.', '2024-04-01 00:00:00', '2024-10-01 00:00:00', 0),
(16, 'Projet Eau de Mer', 'Examen de la pollution chimique dans les eaux marines.', '2024-05-01 00:00:00', '2024-11-01 00:00:00', 1),
(17, 'Projet BioAir', 'Surveillance des bioaérosols dans les hôpitaux.', '2024-06-01 00:00:00', '2024-12-01 00:00:00', 2),
(18, 'Projet Agriculture Verte', 'Analyse des résidus de pesticides dans les produits agricoles.', '2024-07-01 00:00:00', '2025-01-01 00:00:00', 0),
(19, 'Projet Eaux Usées', 'Évaluation de la charge polluante des eaux usées industrielles.', '2024-08-01 00:00:00', '2025-02-01 00:00:00', 1),
(20, 'Projet Air des Montagnes', 'Mesure de la pureté de l\'air en haute altitude.', '2024-09-01 00:00:00', '2025-03-01 00:00:00', 2),
(21, 'Projet BioSol', 'Étude des microorganismes présents dans les sols forestiers.', '2024-10-01 00:00:00', '2025-04-01 00:00:00', 0);

-- --------------------------------------------------------

--
-- Structure de la table `result`
--

DROP TABLE IF EXISTS `result`;
CREATE TABLE IF NOT EXISTS `result` (
  `id` int NOT NULL AUTO_INCREMENT,
  `test_id` int DEFAULT NULL,
  `observation` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_136AC1131E5D0459` (`test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `result`
--

INSERT INTO `result` (`id`, `test_id`, `observation`) VALUES
(2, 3, 'Observation du test d\'eau de rivière : Présence élevée de nitrates.'),
(3, 4, 'Observation du test d\'air extérieur : Concentration normale de particules fines.'),
(4, 5, 'Observation du test de sol agricole : Faible teneur en matière organique.'),
(5, 6, 'Observation du test de produit laitier : Teneur élevée en matières grasses.'),
(6, 7, 'Observation du test d\'eau de mer côtière : Présence de microplastiques détectée.'),
(7, 8, 'Observation du test d\'air de salle blanche : Pureté conforme aux normes.'),
(8, 9, 'Observation du test de tomates : Faible taux de résidus de pesticides.'),
(9, 10, 'Observation du test d\'eaux usées industrielles : Charge polluante élevée en métaux lourds.'),
(10, 11, 'Observation du test d\'air des Alpes : Air pur avec faible concentration en particules.'),
(11, 12, 'Observation du test de sol forestier : Richesse en humus et microorganismes.');

-- --------------------------------------------------------

--
-- Structure de la table `sample`
--

DROP TABLE IF EXISTS `sample`;
CREATE TABLE IF NOT EXISTS `sample` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` int DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_date` datetime DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F10B76C3166D1F9C` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sample`
--

INSERT INTO `sample` (`id`, `project_id`, `type`, `source`, `collection_date`, `status`) VALUES
(57, 2, 'Eau de rivière', '0', '2024-01-10 00:00:00', '1'),
(58, 3, 'Eau de lac', '1', '2024-01-15 00:00:00', '2'),
(59, 4, 'Air extérieur', '2', '2024-02-20 00:00:00', '0'),
(60, 5, 'Air intérieur', '1', '2024-02-25 00:00:00', '1'),
(61, 6, 'Air industriel', '0', '2024-03-05 00:00:00', '2'),
(62, 7, 'Sol agricole', '0', '2024-03-10 00:00:00', '1'),
(63, 8, 'Sol forestier', '1', '2024-03-15 00:00:00', '2'),
(64, 9, 'Produit laitier', '0', '2024-04-10 00:00:00', '0'),
(65, 10, 'Produit carnés', '1', '2024-04-15 00:00:00', '1'),
(66, 11, 'Produit céréaliers', '2', '2024-04-20 00:00:00', '2'),
(67, 12, 'Eau de mer côtière', '0', '2024-05-10 00:00:00', '1'),
(68, 13, 'Eau de mer profonde', '1', '2024-05-15 00:00:00', '2'),
(69, 14, 'Eau de mer de surface', '2', '2024-05-20 00:00:00', '0'),
(70, 15, 'Air de salle blanche', '0', '2024-06-10 00:00:00', '1'),
(71, 16, 'Air de bloc opératoire', '1', '2024-06-15 00:00:00', '2'),
(72, 17, 'Tomates', '0', '2024-07-10 00:00:00', '0'),
(73, 18, 'Pommes de terre', '1', '2024-07-15 00:00:00', '1'),
(74, 19, 'Eaux usées industrielles', '0', '2024-08-10 00:00:00', '2'),
(75, 20, 'Eaux usées domestiques', '1', '2024-08-15 00:00:00', '0'),
(76, 21, 'Eaux usées agricoles', '2', '2024-08-20 00:00:00', '1'),
(77, 2, 'Air des Alpes', '0', '2024-09-10 00:00:00', '2'),
(78, 3, 'Air des Pyrénées', '1', '2024-09-15 00:00:00', '0'),
(79, 4, 'Sol forestier', '0', '2024-10-10 00:00:00', '1'),
(80, 5, 'Sol de prairie', '1', '2024-10-15 00:00:00', '2');

-- --------------------------------------------------------

--
-- Structure de la table `test`
--

DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sample_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scenario` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_D87F7E0C1B1FEA20` (`sample_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `test`
--

INSERT INTO `test` (`id`, `sample_id`, `title`, `scenario`) VALUES
(3, 57, 'Analyse de la concentration en nitrates', 'Mesure de la concentration en nitrates dans un échantillon d\'eau de rivière pour évaluer la pollution agricole.'),
(4, 58, 'Détection de métaux lourds', 'Détection et quantification de métaux lourds comme le plomb et le mercure dans des échantillons de sol.'),
(5, 59, 'Quantification des protéines', 'Utilisation de la méthode de Bradford pour mesurer la concentration en protéines dans un extrait cellulaire.'),
(6, 60, 'Test de pH', 'Mesure du pH de différents échantillons d\'eau pour surveiller l\'acidité ou l\'alcalinité.'),
(7, 61, 'Analyse des gaz dissous', 'Analyse de la présence et de la concentration de gaz dissous comme l\'oxygène et le dioxyde de carbone dans des échantillons d\'eau.'),
(8, 62, 'Test de pureté de l\'air', 'Analyse de la qualité de l\'air intérieur en mesurant les niveaux de particules et de composés organiques volatils.'),
(9, 63, 'Dosage des glucides', 'Quantification des glucides présents dans des échantillons alimentaires à l\'aide de la méthode de l\'antrone.'),
(10, 64, 'Test de la dureté de l\'eau', 'Mesure de la dureté de l\'eau par titration avec de l\'EDTA pour déterminer la concentration en ions calcium et magnésium.'),
(11, 65, 'Analyse microbiologique', 'Identification et dénombrement de bactéries et de moisissures dans des échantillons alimentaires.'),
(12, 66, 'Test de toxicité', 'Évaluation de la toxicité d\'un échantillon de sol en utilisant des bioessais avec des organismes modèles.');

-- --------------------------------------------------------

--
-- Structure de la table `test_equipment`
--

DROP TABLE IF EXISTS `test_equipment`;
CREATE TABLE IF NOT EXISTS `test_equipment` (
  `test_id` int NOT NULL,
  `equipment_id` int NOT NULL,
  PRIMARY KEY (`test_id`,`equipment_id`),
  KEY `IDX_51A542491E5D0459` (`test_id`),
  KEY `IDX_51A54249517FE9FE` (`equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `test_equipment`
--

INSERT INTO `test_equipment` (`test_id`, `equipment_id`) VALUES
(3, 4),
(3, 5),
(3, 6),
(4, 5),
(4, 6),
(4, 7),
(5, 6),
(5, 7),
(5, 8),
(6, 7),
(6, 8),
(6, 9),
(7, 8),
(7, 9),
(7, 10),
(8, 9),
(8, 10),
(8, 11),
(9, 10),
(9, 11),
(9, 12),
(10, 4),
(10, 11),
(10, 12),
(11, 4),
(11, 5),
(11, 12),
(12, 4),
(12, 5),
(12, 6);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'test@mail.fr', '[]', '$2y$13$WR2ebo7zclg6RFXjtSy5FuXovoUBZ6j0FkqWhd6a6cGhj0kU.lLXK');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `FK_136AC1131E5D0459` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`);

--
-- Contraintes pour la table `sample`
--
ALTER TABLE `sample`
  ADD CONSTRAINT `FK_F10B76C3166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`);

--
-- Contraintes pour la table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `FK_D87F7E0C1B1FEA20` FOREIGN KEY (`sample_id`) REFERENCES `sample` (`id`);

--
-- Contraintes pour la table `test_equipment`
--
ALTER TABLE `test_equipment`
  ADD CONSTRAINT `FK_51A542491E5D0459` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_51A54249517FE9FE` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
