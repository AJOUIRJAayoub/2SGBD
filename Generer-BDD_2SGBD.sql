-- Création de la table des utilisateurs
CREATE TABLE Utilisateurs (
    UtilisateurID INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(255) NOT NULL,
    Prenom VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    DateInscription DATE NOT NULL
);

-- Création de la table des catégories
CREATE TABLE Categories (
    CategorieID INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(255) NOT NULL
);

-- Création de la table des produits
CREATE TABLE Produits (
    ProduitID INT AUTO_INCREMENT PRIMARY KEY,
    Titre VARCHAR(255) NOT NULL,
    Description TEXT,
    PrixUnitaire DECIMAL(10, 2) NOT NULL CHECK(PrixUnitaire >= 0),
    StockRestant INT NOT NULL
);

-- Table de liaison entre Produits et Catégories
CREATE TABLE ProduitCategorie (
    ProduitID INT,
    CategorieID INT,
    PRIMARY KEY (ProduitID, CategorieID),
    FOREIGN KEY (ProduitID) REFERENCES Produits(ProduitID),
    FOREIGN KEY (CategorieID) REFERENCES Categories(CategorieID)
);

-- Création de la table des promotions
CREATE TABLE Promotions (
    PromotionID INT AUTO_INCREMENT PRIMARY KEY,
    ProduitID INT,
    DateDebut DATE,
    DateFin DATE,
    PrixPromotion DECIMAL(10, 2) NOT NULL CHECK(PrixPromotion >= 0),
    FOREIGN KEY (ProduitID) REFERENCES Produits(ProduitID)
);

-- Création de la table des commandes
CREATE TABLE Commandes (
    CommandeID INT AUTO_INCREMENT PRIMARY KEY,
    UtilisateurID INT,
    DateAchat DATETIME,
    FOREIGN KEY (UtilisateurID) REFERENCES Utilisateurs(UtilisateurID)
);

-- Création de la table des articles vendus
CREATE TABLE ArticlesVendus (
    ArticleID INT AUTO_INCREMENT PRIMARY KEY,
    CommandeID INT,
    ProduitID INT,
    QuantiteVendue INT NOT NULL,
    PrixUnitaire DECIMAL(10, 2) NOT NULL CHECK(PrixUnitaire >= 0),
    FOREIGN KEY (CommandeID) REFERENCES Commandes(CommandeID),
    FOREIGN KEY (ProduitID) REFERENCES Produits(ProduitID)
);
