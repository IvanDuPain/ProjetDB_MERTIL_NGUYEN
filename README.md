Prompt IA utilisé:

Tu travailles dans le domaine de la pizzeria. Ta Pizza HUB a comme activité de vente de pizza. C’est une entreprise comme Dominos Pizza, Pizza HUT. Les commandes, les employés, plats, client, Administrateur, facture. Inspire-toi de l’enseigne suivant : pepe chicken ( dark kitchen) 
Ton entreprise veut appliquer MERISE pour concevoir un système d'information. Tu es chargé de la partie analyse, c’est-à-dire de collecter les besoins auprès de l’entreprise. Elle a fait appel à un étudiant en ingénierie informatique pour réaliser ce projet, tu dois lui fournir les informations nécessaires pour qu’il applique ensuite lui-même les étapes suivantes de conception et développement de la base de données. D’abord, établis les règles de gestions des données de ton entreprise, sous la forme d'une liste à puce. Elle doit correspondre aux informations que fournit quelqu’un qui connaît le fonctionnement de l’entreprise, mais pas comment se construit un système d’information. 
Ensuite, à partir de ces règles, fournis un dictionnaire de données brutes avec les colonnes suivantes, regroupées dans un tableau : signification de la donnée, type, taille en nombre de caractères ou de chiffres. Il doit y avoir entre 25 et 35 données. Il sert à fournir des informations supplémentaires sur chaque donnée (taille et type) mais sans a priori sur comment les données vont être modélisées ensuite. Fournis donc les règles de gestion et le dictionnaire de données.

================================================================================
PROJET PIZZA HUB - RECUEIL DES BESOINS ET DICTIONNAIRE DE DONNÉES
================================================================================

I. RÈGLES DE GESTION
--------------------------------------------------------------------------------
- Un client doit obligatoirement se créer un compte avec ses coordonnées pour pouvoir commander.
- Un client peut passer plusieurs commandes au fil du temps. En revanche, une commande précise n'appartient toujours qu'à un seul et unique client.
- Une commande contient au moins un plat (pizza, tenders, boisson...), et un même plat peut se retrouver dans plusieurs commandes différentes.
- Tous les travailleurs signent le même type de contrat : ce sont des employés.
- Chaque employé est sous la responsabilité d'un superviseur direct. Ce superviseur est lui-même un employé de Pizza HUB.
- Une fois validée, une commande est assignée à un seul cuisinier pour la préparation, mais ce cuisinier prépare plusieurs commandes durant son service.
- Seul le rôle "Administrateur" possède les droits pour mettre à jour les recettes, les prix ou gérer les fiches des employés.
- Dès qu'une commande part en livraison, le système génère une et une seule facture.
- Pour la comptabilité, la facture est découpée en plusieurs lignes de détail. Une ligne de détail n'a aucune existence par elle-même : si la facture globale est annulée ou supprimée, toutes les lignes qui la composent disparaissent.


II. DICTIONNAIRE DE DONNÉES BRUTES
--------------------------------------------------------------------------------
| Signification de la donnée | Type | Taille |
| :--- | :--- | :--- |
| Identifiant unique du client | Numérique | 8 chiffres |
| Nom de famille du client | Alphabétique | 50 caractères |
| Prénom du client | Alphabétique | 50 caractères |
| Numéro de téléphone portable du client | Numérique | 10 chiffres |
| Adresse e-mail de contact | Alphanumérique | 100 caractères |
| Adresse postale de livraison | Alphanumérique | 250 caractères |
| Numéro unique de la commande | Numérique | 10 chiffres |
| Date et heure exactes de la commande | Date/Heure | N/A |
| Mode de retrait (Livraison/Click&Collect) | Alphabétique | 20 caractères |
| Statut d'avancement | Alphabétique | 30 caractères |
| Matricule unique de l'employé | Numérique | 6 chiffres |
| Nom de l'employé | Alphabétique | 50 caractères |
| Prénom de l'employé | Alphabétique | 50 caractères |
| Rôle occupé (Cuisinier, Admin...) | Alphabétique | 30 caractères |
| Code d'identification du plat | Numérique | 5 chiffres |
| Nom commercial du plat | Alphanumérique | 60 caractères |
| Description ou recette du plat | Alphanumérique | 255 caractères |
| Prix de vente unitaire du plat | Décimal | 5 chiffres |
| Catégorie (Pizza, Finger Food...) | Alphabétique | 30 caractères |
| Quantité d'un plat dans une commande | Numérique | 2 chiffres |
| Numéro d'édition de la facture | Alphanumérique | 15 caractères |
| Date d'émission de la facture | Date | N/A |
| Montant total hors taxes (HT) à payer | Décimal | 6 chiffres |
| Montant de la TVA appliquée | Décimal | 5 chiffres |
| Montant total toutes taxes comprises (TTC) | Décimal | 6 chiffres |
| Numéro d'ordre de la ligne de détail | Numérique | 3 chiffres |
| Sous-total facturé pour cette ligne | Décimal | 6 chiffres |
================================================================================
