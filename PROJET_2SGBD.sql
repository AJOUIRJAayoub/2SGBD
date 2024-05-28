-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 27 déc. 2023 à 00:27
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet-2sgbd`
--

-- --------------------------------------------------------

--
-- Structure de la table `articlesvendus`
--

DROP TABLE IF EXISTS `articlesvendus`;
CREATE TABLE IF NOT EXISTS `articlesvendus` (
  `ArticleID` int NOT NULL,
  `CommandeID` int DEFAULT NULL,
  `ProduitID` int DEFAULT NULL,
  `QuantiteVendue` int NOT NULL,
  `PrixUnitaire` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ArticleID`),
  KEY `CommandeID` (`CommandeID`),
  KEY `ProduitID` (`ProduitID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `articlesvendus`
--

INSERT INTO `articlesvendus` (`ArticleID`, `CommandeID`, `ProduitID`, `QuantiteVendue`, `PrixUnitaire`) VALUES
(1, 1, 1, 2, '20.99'),
(2, 2, 2, 1, '30.50');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `CategorieID` int NOT NULL,
  `Nom` varchar(255) NOT NULL,
  PRIMARY KEY (`CategorieID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`CategorieID`, `Nom`) VALUES
(1, 'Catégorie1'),
(2, 'Catégorie2'),
(0, 'Électronique');

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
CREATE TABLE IF NOT EXISTS `commandes` (
  `CommandeID` int NOT NULL,
  `UtilisateurID` int DEFAULT NULL,
  `DateAchat` datetime DEFAULT NULL,
  PRIMARY KEY (`CommandeID`),
  KEY `UtilisateurID` (`UtilisateurID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`CommandeID`, `UtilisateurID`, `DateAchat`) VALUES
(1, 1, '2023-01-05 00:00:00'),
(2, 2, '2023-01-10 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `produitcategorie`
--

DROP TABLE IF EXISTS `produitcategorie`;
CREATE TABLE IF NOT EXISTS `produitcategorie` (
  `ProduitID` int NOT NULL,
  `CategorieID` int NOT NULL,
  PRIMARY KEY (`ProduitID`,`CategorieID`),
  KEY `CategorieID` (`CategorieID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `produitcategorie`
--

INSERT INTO `produitcategorie` (`ProduitID`, `CategorieID`) VALUES
(1, 1),
(1, 2),
(2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `ProduitID` int NOT NULL AUTO_INCREMENT,
  `Titre` varchar(255) NOT NULL,
  `Description` text,
  `PrixUnitaire` decimal(10,2) NOT NULL,
  `StockRestant` int NOT NULL,
  PRIMARY KEY (`ProduitID`)
) ;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`ProduitID`, `Titre`, `Description`, `PrixUnitaire`, `StockRestant`) VALUES
(1, 'Produit1', 'Description1', '20.99', 15),
(2, 'Produit2', 'Description2', '30.50', 5),
(3, 'Ordinateur portable', 'Puissant ordinateur portable pour le travail et le jeu', '999.99', 20),
(4, 'Smartphone', 'Dernier modèle de smartphone avec des fonctionnalités avancées', '699.99', 15),
(5, 'Casque sans fil', 'Casque audio de haute qualité avec suppression de bruit', '149.99', 30),
(6, 'Montre connectée', 'Montre intelligente avec suivi de la condition physique', '199.99', 10),
(7, 'Ordinateur portable', 'Puissant ordinateur portable pour le travail et le jeu', '999.99', 20),
(8, 'Smartphone', 'Dernier modèle de smartphone avec des fonctionnalités avancées', '699.99', 15),
(9, 'Casque sans fil', 'Casque audio de haute qualité avec suppression de bruit', '149.99', 30),
(10, 'Montre connectée', 'Montre intelligente avec suivi de la condition physique', '199.99', 10),
(11, 'Ordinateur portable', 'Puissant ordinateur portable pour le travail et le jeu', '999.99', 20),
(12, 'Smartphone', 'Dernier modèle de smartphone avec des fonctionnalités avancées', '699.99', 15),
(13, 'Casque sans fil', 'Casque audio de haute qualité avec suppression de bruit', '149.99', 30),
(14, 'Montre connectée', 'Montre intelligente avec suivi de la condition physique', '199.99', 10);

-- --------------------------------------------------------

--
-- Structure de la table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
CREATE TABLE IF NOT EXISTS `promotions` (
  `PromotionID` int NOT NULL,
  `ProduitID` int DEFAULT NULL,
  `DateDebut` date NOT NULL,
  `DateFin` date NOT NULL,
  `PrixPromotion` decimal(10,2) NOT NULL,
  PRIMARY KEY (`PromotionID`),
  KEY `ProduitID` (`ProduitID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `promotions`
--

INSERT INTO `promotions` (`PromotionID`, `ProduitID`, `DateDebut`, `DateFin`, `PrixPromotion`) VALUES
(1, 1, '2023-01-01', '2023-01-15', '15.99');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `UtilisateurID` int NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Prenom` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `DateInscription` date NOT NULL,
  PRIMARY KEY (`UtilisateurID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`UtilisateurID`, `Nom`, `Prenom`, `Email`, `DateInscription`) VALUES
(1, 'Nom1', 'Prenom1', 'email1@example.com', '2023-01-01'),
(2, 'Nom2', 'Prenom2', 'email2@example.com', '2023-01-02');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
