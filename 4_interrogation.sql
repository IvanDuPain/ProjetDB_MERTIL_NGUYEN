USE Pizza_HUB;

-- Des projections et sélections, avec tri, données uniques et utilisation de masques, IN,BETWEEN

-- Requête 1 : Sélection des plats dont le prix est compris entre 10€ et 15€ avec tri croissant
SELECT nom_plat, prix 
FROM PLAT 
WHERE prix BETWEEN 10.00 AND 15.00 
ORDER BY prix ASC;

-- Requête 2 : Sélection des clients dont l'adresse se trouve à Paris
SELECT nom_client, prenom_client, adresse 
FROM CLIENT 
WHERE adresse LIKE '%Paris%';

-- Requête 3 : Sélection des commandes passées soit en 'livraison', soit en 'emporter'
SELECT id_commande, date_heure_commande, mode_retrait 
FROM COMMANDE 
WHERE mode_retrait IN ('livraison', 'emporter');

-- Requête 4 : Affichage des rôles uniques occupés par les employés de l'entreprise
SELECT DISTINCT role_occupe 
FROM EMPLOYEE;

-- Requête 5 : Sélection des factures dont le montant TTC est supérieur à 15€, triées de la plus récente à la plus ancienne
SELECT id_facture, montant_ttc, date_emission 
FROM FACTURE 
WHERE montant_ttc > 15.00 
ORDER BY date_emission DESC;

-- Des fonctions d’agrégation permettant de calculer des statistiques, utilisées avec GROUP BY et HAVING

-- Requête 6 : Calcul du chiffre d'affaires total TTC généré par toutes les factures
SELECT SUM(montant_ttc) AS chiffre_affaires_total_ttc 
FROM FACTURE;

-- Requête 7 : Calcul du prix moyen des plats proposés sur la carte
SELECT AVG(prix) AS prix_moyen_plat 
FROM PLAT;

-- Requête 8 : Nombre total de commandes passées par chaque client
SELECT id_client, COUNT(id_commande) AS nombre_commandes 
FROM COMMANDE 
GROUP BY id_client;

-- Requête 9 : Identification des clients ayant passé plus d'une commande
SELECT id_client, COUNT(id_commande) AS nb_commandes 
FROM COMMANDE 
GROUP BY id_client
HAVING COUNT(id_commande) > 1;

-- Requête 10 : Calcul du panier moyen par mode de retrait de commande (Jointure + GROUP BY)
SELECT c.mode_retrait, AVG(f.montant_ttc) AS panier_moyen_ttc 
FROM COMMANDE c 
JOIN FACTURE f ON c.id_commande = f.id_commande 
GROUP BY c.mode_retrait;

-- Des jointures internes, externes, simples, multiples,…

-- Requête 11 : Jointure simple entre les commandes et les clients
SELECT c.id_commande, c.date_heure_commande, cl.nom_client, cl.prenom_client 
FROM COMMANDE c 
JOIN CLIENT cl ON c.id_client = cl.id_client;

-- Requête 12 : Jointure multiple complète (Détail d'une commande : Client, Employé/Cuisinier, Plat et Quantité)
SELECT cmd.id_commande, cl.nom_client, emp.nom_employee AS cuisinier, p.nom_plat, ct.quantite 
FROM COMMANDE cmd 
JOIN CLIENT cl ON cmd.id_client = cl.id_client 
JOIN EMPLOYEE emp ON cmd.id_employee = emp.id_employee 
JOIN CONTENIR ct ON cmd.id_commande = ct.id_commande 
JOIN PLAT p ON ct.id_plat = p.id_plat;

-- Requête 13 : Association de chaque commande à sa facture correspondante
SELECT cmd.id_commande, cmd.date_heure_commande, f.montant_ttc, f.date_emission 
FROM COMMANDE cmd 
JOIN FACTURE f ON cmd.id_commande = f.id_commande;

-- Requête 14 : Jointure externe pour lister tous les employés et voir leurs commandes associées s'il y en a
SELECT emp.nom_employee, emp.role_occupe, cmd.id_commande 
FROM EMPLOYEE emp 
LEFT JOIN COMMANDE cmd ON emp.id_employee = cmd.id_employee;

-- Requête 15 : Jointure multiple pour afficher l'historique des pizzas commandées par un client précis (ex: Jean Dupont)
SELECT p.nom_plat, ct.quantite, cmd.date_heure_commande 
FROM CLIENT cl 
JOIN COMMANDE cmd ON cl.id_client = cmd.id_client 
JOIN CONTENIR ct ON cmd.id_commande = ct.id_commande 
JOIN PLAT p ON ct.id_plat = p.id_plat 
WHERE cl.nom_client = 'Dupont' AND cl.prenom_client = 'Jean';

-- Des requêtes imbriquées avec (NOT) IN, (NOT) EXISTS, ANY, ALL,…

-- Requête 16 : Utilisation de IN pour afficher les clients qui ont déjà passé au moins une commande
SELECT nom_client, prenom_client 
FROM CLIENT 
WHERE id_client IN (SELECT id_client FROM COMMANDE);

-- Requête 17 : Utilisation de NOT IN pour identifier les clients enregistrés n'ayant jamais commandé
SELECT nom_client, prenom_client 
FROM CLIENT 
WHERE id_client NOT IN (SELECT id_client FROM COMMANDE);

-- Requête 18 : Utilisation de EXISTS pour lister les commandes qui possèdent bien une facture émise
SELECT id_commande, date_heure_commande 
FROM COMMANDE c 
WHERE EXISTS (SELECT 1 FROM FACTURE f WHERE f.id_commande = c.id_commande);

-- Requête 19 : Utilisation de ALL pour trouver les plats dont le prix est supérieur à TOUTES les boissons
SELECT nom_plat, prix 
FROM PLAT 
WHERE prix > ALL (SELECT prix FROM PLAT WHERE nom_plat LIKE '%33cl%' OR nom_plat LIKE '%50cl%');

-- Requête 20 : Utilisation de ANY pour trouver les plats dont le prix est supérieur à au moins un dessert
SELECT nom_plat, prix 
FROM PLAT 
WHERE prix > ANY (SELECT prix FROM PLAT WHERE nom_plat LIKE '%Tiramisu%' OR nom_plat LIKE '%Panna Cotta%' OR nom_plat LIKE '%Cannoli%');