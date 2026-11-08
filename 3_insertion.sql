USE Pizza_HUB;

-- Désactivation temporaire des vérifications de clés étrangères pour l'insertion
SET FOREIGN_KEY_CHECKS = 0;

-- Vidage optionnel des tables pour repartir sur une base propre
TRUNCATE TABLE FACTURE;
TRUNCATE TABLE CONTENIR;
TRUNCATE TABLE COMMANDE;
TRUNCATE TABLE PLAT;
TRUNCATE TABLE EMPLOYEE;
TRUNCATE TABLE CLIENT;

SET FOREIGN_KEY_CHECKS = 1;

-- =========================================================================
-- 1. INSERTION DES TABLES SANS CLÉS ÉTRANGÈRES (EMPLOYEE, PLAT, CLIENT)
-- =========================================================================

-- Insertion des employés
INSERT INTO EMPLOYEE (nom_employee, prenom_employee, role_occupe) VALUES
('Dupuis', 'Thomas', 'Pizzaiolo'),
('Martin', 'Sophie', 'Manager'),
('Bernard', 'Lucas', 'Livreur'),
('Petit', 'Emma', 'Caissière'),
('Robert', 'Hugo', 'Livreur');

-- Insertion des plats (Pizzas, desserts et boissons uniquement)
INSERT INTO PLAT (nom_plat, description_plat, recette_plat, prix) VALUES
('Pizza Margherita', 'Sauce tomate, mozzarella fraîche, basilic', 'Pâte à pizza, sauce tomate bio, mozzarella, huile d''olive', 10.50),
('Pizza 4 Fromages', 'Mozzarella, gorgonzola, chèvre, emmental', 'Pâte à pizza, crème fraîche, mélange 4 fromages', 13.00),
('Pizza Reine', 'Sauce tomate, mozzarella, jambon, champignons', 'Pâte à pizza, sauce tomate, mozzarella, jambon blanc, champignons', 12.00),
('Pizza Calzone', 'Pizza soufflée, jambon, œuf, mozzarella', 'Pâte à pizza pliée, sauce tomate, mozzarella, jambon, œuf', 13.50),
('Pizza Pepperoni', 'Sauce tomate, mozzarella, saucisse pepperoni épicée', 'Pâte à pizza, sauce tomate, mozzarella, pepperoni', 12.50),
('Tiramisu Maison', 'Dessert italien traditionnel au café et mascarpone', 'Biscuits cuillère, café, mascarpone, œufs, cacao', 5.50),
('Fondant au Chocolat', 'Gâteau moelleux avec cœur coulant au chocolat noir', 'Chocolat noir, beurre, œufs, sucre, farine', 6.00),
('Panna Cotta', 'Crème cuite à la vanille et coulis de fruits rouges', 'Crème fraîche, vanille, gélatine, coulis de fruits rouges', 5.00),
('Coca-Cola 33cl', 'Boisson gazeuse rafraîchissante', 'Eau gazéifiée, sucre, extraits de végétaux, arôme caféine', 3.50),
('Ice Tea Pêche 33cl', 'Thé glacé saveur pêche', 'Eau, extrait de thé, sucre, jus de pêche à base de concentré', 3.50),
('Bière Pression 50cl', 'Bière blonde pression rafraîchissante', 'Malt d''orge, houblon, eau, levure', 6.00),
('Eau Minérale 50cl', 'Bouteille d''eau plate', 'Eau de source naturelle', 2.50);

-- Insertion de 15 clients (respect des regex pour email et téléphone à 10 chiffres)
INSERT INTO CLIENT (nom_client, prenom_client, telephone, email, adresse) VALUES
('Leroy', 'Alice', '0612345678', 'alice.leroy@gmail.com', '12 rue de la République, 75001 Paris'),
('Moreau', 'Julien', '0723456789', 'julien.moreau@yahoo.fr', '45 avenue Victor Hugo, 75116 Paris'),
('Simon', 'Chloé', '0634567890', 'chloe.simon@outlook.com', '8 boulevard Saint-Germain, 75005 Paris'),
('Michel', 'Antoine', '0645678901', 'antoine.michel@hotmail.com', '23 rue Oberkampf, 75011 Paris'),
('Lefebvre', 'Marie', '0756789012', 'marie.lefebvre@gmail.com', '15 rue de Rivoli, 75004 Paris'),
('Roux', 'Nicolas', '0667890123', 'nicolas.roux@orange.fr', '56 boulevard Voltaire, 75011 Paris'),
('David', 'Camille', '0778901234', 'camille.david@free.fr', '3 rue de Belleville, 75020 Paris'),
('Bertrand', 'Maxime', '0689012345', 'maxime.bertrand@sfr.fr', '78 rue de la Roquette, 75011 Paris'),
('Garnier', 'Laura', '0690123456', 'laura.garnier@gmail.com', '10 passage des Panoramas, 75002 Paris'),
('Faure', 'Romain', '0701234567', 'romain.faure@yahoo.com', '34 rue du Faubourg Saint-Antoine, 75012 Paris'),
('Andre', 'Sarah', '0611223344', 'sarah.andre@gmail.com', '9 rue des Martyrs, 75009 Paris'),
('Mercier', 'Alexandre', '0722334455', 'alexandre.mercier@outlook.fr', '67 boulevard de Magenta, 75010 Paris'),
('Blanc', 'Manon', '0633445566', 'manon.blanc@free.fr', '4 rue de Parme, 75009 Paris'),
('Guerin', 'Lucas', '0744556677', 'lucas.guerin@orange.fr', '19 rue de Bretagne, 75003 Paris'),
('Boyer', 'Charlotte', '0655667788', 'charlotte.boyer@gmail.com', '88 rue Monge, 75005 Paris');


-- =========================================================================
-- 2. INSERTION DES TABLES AVEC CLÉS ÉTRANGÈRES (COMMANDE, CONTENIR, FACTURE)
-- =========================================================================

-- Insertion de 15 commandes (modes de retrait valides : 'livraison', 'emporter', 'sur place')
INSERT INTO COMMANDE (date_heure_commande, mode_retrait, statut_avancement, id_client, id_employee) VALUES
('2026-06-01 19:30:00', 'livraison', 'Livrée', 1, 3),
('2026-06-01 20:00:00', 'emporter', 'Terminée', 2, 4),
('2026-06-02 12:15:00', 'sur place', 'Terminée', 3, 2),
('2026-06-02 19:45:00', 'livraison', 'Livrée', 4, 5),
('2026-06-03 20:10:00', 'emporter', 'Terminée', 5, 4),
('2026-06-04 12:30:00', 'sur place', 'Terminée', 6, 2),
('2026-06-04 20:00:00', 'livraison', 'Livrée', 7, 3),
('2026-06-05 19:15:00', 'emporter', 'Terminée', 8, 4),
('2026-06-06 20:30:00', 'livraison', 'Livrée', 9, 5),
('2026-06-07 12:45:00', 'sur place', 'Terminée', 10, 2),
('2026-06-08 19:00:00', 'livraison', 'Livrée', 11, 3),
('2026-06-09 20:20:00', 'emporter', 'Terminée', 12, 4),
('2026-06-10 12:00:00', 'sur place', 'Terminée', 13, 2),
('2026-06-11 19:50:00', 'livraison', 'Livrée', 14, 5),
('2026-06-12 20:00:00', 'emporter', 'Terminée', 15, 4);

-- Insertion du détail des commandes dans CONTENIR (quantité >= 1)
-- Commande 1 : Margherita (10.50) + Coca (3.50) = 14.00 € TTC
INSERT INTO CONTENIR (id_commande, id_plat, quantite) VALUES (1, 1, 1), (1, 9, 1);

-- Commande 2 : 4 Fromages (13.00) + Tiramisu (5.50) = 18.50 € TTC
INSERT INTO CONTENIR (id_commande, id_plat, quantite) VALUES (2, 2, 1), (2, 6, 1);

-- Commande 3 : Reine (12.00) + Ice Tea (3.50) = 15.50 € TTC
INSERT INTO CONTENIR (id_commande, id_plat, quantite) VALUES (3, 3, 1), (3, 10, 1);

-- Commande 4 : 2x Calzone (13.50 * 2) = 27.00 € TTC
INSERT INTO CONTENIR (id_commande, id_plat, quantite) VALUES (4, 4, 2);

-- Commande 5 : Pepperoni (12.50) + Panna Cotta (5.00) + Eau (2.50) = 20.00 € TTC
INSERT INTO CONTENIR (id_commande, id_plat, quantite) VALUES (5, 5, 1), (5, 8, 1), (5, 12, 1);

-- Commande 6 : Margherita (10.50) + Fondant (6.00) = 16.50 € TTC
INSERT INTO CONTENIR (id_commande, id_plat, quantite) VALUES (6, 1, 1), (6, 7, 1);

-- Commande 7 : 4 Fromages (13.00) + Bière (6.00) = 19.00 € TTC
INSERT INTO CONTENIR (id_commande, id_plat, quantite) VALUES (7, 2, 1), (7, 11, 1);

-- Commande 8 : Reine (12.00) + Tiramisu (5.50) + Coca (3.50) = 21.00 € TTC
INSERT INTO CONTENIR (id_commande, id_plat, quantite) VALUES (8, 3, 1), (8, 6, 1), (8, 9, 1);

-- Commande 9 : 2x Pepperoni (12.50*2) + 2x Ice Tea (3.50*2) = 32.00 € TTC
INSERT INTO CONTENIR (id_commande, id_plat, quantite) VALUES (9, 5, 2), (9, 10, 2);

-- Commande 10 : Calzone (13.50) + Eau (2.50) = 16.00 € TTC
INSERT INTO CONTENIR (id_commande, id_plat, quantite) VALUES (10, 4, 1), (10, 12, 1);

-- Commande 11 : Margherita (10.50) + Reine (12.00) + 2x Coca (3.50*2) = 29.50 € TTC
INSERT INTO CONTENIR (id_commande, id_plat, quantite) VALUES (11, 1, 1), (11, 3, 1), (11, 9, 2);

-- Commande 12 : 4 Fromages (13.00) + Fondant (6.00) + Bière (6.00) = 25.00 € TTC
INSERT INTO CONTENIR (id_commande, id_plat, quantite) VALUES (12, 2, 1), (12, 7, 1), (12, 11, 1);

-- Commande 13 : Pepperoni (12.50) + Panna Cotta (5.00) = 17.50 € TTC
INSERT INTO CONTENIR (id_commande, id_plat, quantite) VALUES (13, 5, 1), (13, 8, 1);

-- Commande 14 : Calzone (13.50) + Tiramisu (5.50) + Ice Tea (3.50) = 22.50 € TTC
INSERT INTO CONTENIR (id_commande, id_plat, quantite) VALUES (14, 4, 1), (14, 6, 1), (14, 10, 1);

-- Commande 15 : 3x Margherita (10.50 * 3) = 31.50 € TTC
INSERT INTO CONTENIR (id_commande, id_plat, quantite) VALUES (15, 1, 3);

-- Insertion des factures correspondantes (Montants HT, TVA 10% et TTC cohérents avec CONTENIR)
INSERT INTO FACTURE (date_emission, montant_ht, montant_tva, montant_ttc, id_commande) VALUES
('2026-06-01 19:35:00', 12.73, 1.27, 14.00, 1),
('2026-06-01 20:05:00', 16.82, 1.68, 18.50, 2),
('2026-06-02 12:20:00', 14.09, 1.41, 15.50, 3),
('2026-06-02 19:50:00', 24.55, 2.45, 27.00, 4),
('2026-06-03 20:15:00', 18.18, 1.82, 20.00, 5),
('2026-06-04 12:35:00', 15.00, 1.50, 16.50, 6),
('2026-06-04 20:05:00', 17.27, 1.73, 19.00, 7),
('2026-06-05 19:20:00', 19.09, 1.91, 21.00, 8),
('2026-06-06 20:35:00', 29.09, 2.91, 32.00, 9),
('2026-06-07 12:50:00', 14.55, 1.45, 16.00, 10),
('2026-06-08 19:05:00', 26.82, 2.68, 29.50, 11),
('2026-06-09 20:25:00', 22.73, 2.27, 25.00, 12),
('2026-06-10 12:05:00', 15.91, 1.59, 17.50, 13),
('2026-06-11 19:55:00', 20.45, 2.05, 22.50, 14),
('2026-06-12 20:05:00', 28.64, 2.86, 31.50, 15);