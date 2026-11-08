USE Pizza_HUB;

-- Requête 1 : Repérer les plats de la gamme intermédiaire (entre 10€ et 15€) triés par prix croissant
SELECT nom_plat, prix 
FROM PLAT 
WHERE prix BETWEEN 10.00 AND 15.00 
ORDER BY prix ASC;

-- Requête 2 : Lister les clients habitant à Paris pour organiser les zones de livraison
SELECT nom_client, prenom_client, adresse 
FROM CLIENT 
WHERE adresse LIKE '%Paris%';

-- Requête 3 : Suivre les commandes à préparer pour l'extérieur ('livraison' ou 'emporter')
SELECT id_commande, date_heure_commande, mode_retrait 
FROM COMMANDE 
WHERE mode_retrait IN ('livraison', 'emporter');

-- Requête 4 : Afficher les différents postes uniques existants parmi le personnel de la pizzeria
SELECT DISTINCT role_occupe 
FROM EMPLOYEE;

-- Requête 5 : Contrôler les grosses factures (> 25€ TTC), de la plus récente à la plus ancienne
SELECT id_facture, montant_ttc, date_emission 
FROM FACTURE 
WHERE montant_ttc > 25.00 
ORDER BY date_emission DESC;

-- Requête 6 : Calculer le chiffre d'affaires total TTC généré par la pizzeria
SELECT SUM(montant_ttc) AS chiffre_affaires_total_ttc 
FROM FACTURE;

-- Requête 7 : Calculer le prix moyen des produits proposés sur la carte du restaurant
SELECT AVG(prix) AS prix_moyen_plat 
FROM PLAT;

-- Requête 8 : Compter le nombre total de commandes passées par chaque client
SELECT id_client, COUNT(id_commande) AS nombre_commandes 
FROM COMMANDE 
GROUP BY id_client;

-- Requête 9 : Identifier les clients fidèles ayant passé strictement plus d'une commande
SELECT id_client, COUNT(id_commande) AS nb_commandes 
FROM COMMANDE 
GROUP BY id_client 
HAVING COUNT(id_commande) > 1;

-- Requête 10 : Calculer le panier moyen TTC selon le mode de retrait choisi par le client
SELECT c.mode_retrait, AVG(f.montant_ttc) AS panier_moyen_ttc 
FROM COMMANDE c 
JOIN FACTURE f ON c.id_commande = f.id_commande 
GROUP BY c.mode_retrait;

-- Requête 11 : Afficher le registre des commandes avec le nom et prénom du client associé
SELECT c.id_commande, c.date_heure_commande, cl.nom_client, cl.prenom_client 
FROM COMMANDE c 
JOIN CLIENT cl ON c.id_client = cl.id_client;

-- Requête 12 : Traçabilité complète en cuisine (Commande, Client, Employé en charge, Plat et Quantité)
SELECT cmd.id_commande, cl.nom_client, emp.nom_employee AS cuisinier, p.nom_plat, ct.quantite 
FROM COMMANDE cmd 
JOIN CLIENT cl ON cmd.id_client = cl.id_client 
JOIN EMPLOYEE emp ON cmd.id_employee = emp.id_employee 
JOIN CONTENIR ct ON cmd.id_commande = ct.id_commande 
JOIN PLAT p ON ct.id_plat = p.id_plat;

-- Requête 13 : Rapprochement entre chaque commande enregistrée et sa facture émise
SELECT cmd.id_commande, cmd.date_heure_commande, f.montant_ttc, f.date_emission 
FROM COMMANDE cmd 
JOIN FACTURE f ON cmd.id_commande = f.id_commande;

-- Requête 14 : Lister tous les employés de la pizzeria et leurs commandes traitées (y compris ceux sans commande)
SELECT emp.nom_employee, emp.role_occupe, cmd.id_commande 
FROM EMPLOYEE emp 
LEFT JOIN COMMANDE cmd ON emp.id_employee = cmd.id_employee;

-- Requête 15 : Consulter l'historique détaillé des plats commandés par une cliente régulière (Alice Leroy)
SELECT p.nom_plat, ct.quantite, cmd.date_heure_commande 
FROM CLIENT cl 
JOIN COMMANDE cmd ON cl.id_client = cmd.id_client 
JOIN CONTENIR ct ON cmd.id_commande = ct.id_commande 
JOIN PLAT p ON ct.id_plat = p.id_plat 
WHERE cl.nom_client = 'Leroy' AND cl.prenom_client = 'Alice';

-- Requête 16 : Lister les clients actifs ayant déjà passé au moins une commande dans la pizzeria
SELECT nom_client, prenom_client 
FROM CLIENT 
WHERE id_client IN (SELECT id_client FROM COMMANDE);

-- Requête 17 : Identifier les clients inscrits n'ayant jamais commandé afin de leur envoyer une offre de relance
SELECT nom_client, prenom_client 
FROM CLIENT 
WHERE id_client NOT IN (SELECT id_client FROM COMMANDE);

-- Requête 18 : Vérifier les commandes qui possèdent bien une facture émise en comptabilité
SELECT id_commande, date_heure_commande 
FROM COMMANDE c 
WHERE EXISTS (SELECT 1 FROM FACTURE f WHERE f.id_commande = c.id_commande);

-- Requête 19 : Trouver les plats dont le tarif est supérieur à TOUTES les boissons (33cl et 50cl)
SELECT nom_plat, prix 
FROM PLAT 
WHERE prix > ALL (SELECT prix FROM PLAT WHERE nom_plat LIKE '%33cl%' OR nom_plat LIKE '%50cl%');

-- Requête 20 : Trouver les articles dont le prix est supérieur à au moins un des desserts de la carte
SELECT nom_plat, prix 
FROM PLAT 
WHERE prix > ANY (SELECT prix FROM PLAT WHERE nom_plat LIKE '%Tiramisu%' OR nom_plat LIKE '%Panna Cotta%' OR nom_plat LIKE '%Fondant%');