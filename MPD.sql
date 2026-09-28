CREATE DATABASE Pizza_HUB

USE DATABASE Pizza_HUB

CREATE TABLE 'CLIENT'(
'id_client' int,
'nom_client' VARCHAR(50),
'prenom_client' VARCHAR(50),
'telephone' int,
'email' VARCHAR(50),
'adresse' VARCHAR(50),
PRIMARY KEY (id_client);
)

CREATE TABLE 'COMMANDE'(
'id_commande' int,
'date_heure_commande' TIMESTAMP CURRENT_TIMESTAMP,
'mode_retrait' VARCHAR(50),
'statut_avancement' VARCHAR(50),
PRIMARY KEY (id_commande);
FOREIGN KEY (id_client) REFERENCES CLIENT(id_client);
FOREIGN KEY (id_employee) REFERENCES EMPLOYEE(id_employee);

)

CREATE TABLE 'EMPLOYEE'(
'id_employee' int,
'nom_employee' VARCHAR(50),
'prenom_employee' VARCHAR(50),
'role_occupe' VARCHAR(50),
PRIMARY KEY (id_employee);
)

CREATE TABLE 'PLAT'(
'id_plat' int,
'nom_plat' VARCHAR(50),
'description_plat' VARCHAR(50),
'recette_plat' VARCHAR(50),
'prix' DECIMAL,
PRIMARY KEY (id_plat);
FOREIGN KEY ();
)

CREATE TABLE 'FACTURE'(
'id_facture' int,
'date_emission' TIMESTAMP CURRENT_TIMESTAMP,
'montant_ht' DECIMAL,
'montant_tva' DECIMAL,
'montant_ttc' DECIMAL,
PRIMARY KEY (id_facture);
)


