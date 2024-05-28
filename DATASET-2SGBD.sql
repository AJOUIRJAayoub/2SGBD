-- Utilisateurs
INSERT INTO Utilisateurs (Nom, Prenom, Email, DateInscription) VALUES 
('Doe', 'John', 'john.doe@example.com', '2023-01-01'),
('Smith', 'Jane', 'jane.smith@example.com', '2023-01-05'),
('Johnson', 'Bob', 'bob.johnson@example.com', '2023-02-10');

-- Produits
INSERT INTO Produits (Titre, Description, PrixUnitaire, StockRestant) VALUES 
('Ordinateur portable', 'Puissant ordinateur portable', 999.99, 20),
('Casque sans fil', 'Casque audio de haute qualité', 149.99, 30),
('Smartphone', 'Dernier modèle de smartphone', 699.99, 15),
('Montre connectée', 'Montre intelligente', 199.99, 10);

-- Catégories
INSERT INTO Categories (Nom) VALUES ('Électronique'), ('Accessoires');

-- Associer les produits aux catégories
INSERT INTO ProduitCategorie (ProduitID, CategorieID) VALUES (1, 1), (2, 2), (3, 1), (4, 2);

-- Périodes de promotion
INSERT INTO Promotions (ProduitID, DateDebut, DateFin, PrixPromotion) VALUES (1, '2023-01-01', '2023-01-15', 899.99);

-- Commandes
INSERT INTO Commandes (UtilisateurID, DateAchat) VALUES 
(1, '2023-01-02 10:30:00'),
(2, '2023-01-05 15:45:00'),
(1, '2023-01-08 09:00:00');

-- Articles vendus
INSERT INTO ArticlesVendus (CommandeID, ProduitID, QuantiteVendue, PrixUnitaire) VALUES 
(1, 1, 1, 999.99),
(1, 2, 2, 149.99),
(2, 3, 1, 699.99),
(3, 4, 1, 199.99);
