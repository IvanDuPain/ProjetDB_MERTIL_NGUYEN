CREATE DATABASE Pizza_HUB;
USE Pizza_HUB;

CREATE TABLE CLIENT (
    id_client INT AUTO_INCREMENT,
    nom_client VARCHAR(50) NOT NULL,
    prenom_client VARCHAR(50) NOT NULL,
    telephone VARCHAR(15),
    email VARCHAR(100),
    adresse VARCHAR(100),
    PRIMARY KEY (id_client)
);

CREATE TABLE EMPLOYEE (
    id_employee INT AUTO_INCREMENT,
    nom_employee VARCHAR(50) NOT NULL,
    prenom_employee VARCHAR(50) NOT NULL,
    role_occupe VARCHAR(50),
    PRIMARY KEY (id_employee)
);

CREATE TABLE PLAT (
    id_plat INT AUTO_INCREMENT,
    nom_plat VARCHAR(50) NOT NULL,
    description_plat TEXT,
    recette_plat TEXT,
    prix DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (id_plat)
);

CREATE TABLE COMMANDE (
    id_commande INT AUTO_INCREMENT,
    date_heure_commande TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    mode_retrait VARCHAR(50),
    statut_avancement VARCHAR(50),
    id_client INT NOT NULL,
    id_employee INT NOT NULL,
    PRIMARY KEY (id_commande),
    FOREIGN KEY (id_client) REFERENCES CLIENT(id_client),
    FOREIGN KEY (id_employee) REFERENCES EMPLOYEE(id_employee)
);

CREATE TABLE FACTURE (
    id_facture INT AUTO_INCREMENT,
    date_emission TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    montant_ht DECIMAL(8,2) NOT NULL,
    montant_tva DECIMAL(8,2) NOT NULL,
    montant_ttc DECIMAL(8,2) NOT NULL,
    id_commande INT NOT NULL UNIQUE,
    PRIMARY KEY (id_facture),
    FOREIGN KEY (id_commande) REFERENCES COMMANDE(id_commande)
);

CREATE TABLE CONTENIR (
    id_commande INT,
    id_plat INT,
    quantite INT NOT NULL DEFAULT 1,
    PRIMARY KEY (id_commande, id_plat),
    FOREIGN KEY (id_commande) REFERENCES COMMANDE(id_commande),
    FOREIGN KEY (id_plat) REFERENCES PLAT(id_plat)
);