USE Pizza_HUB;

-- Format de l'email
ALTER TABLE CLIENT
ADD CONSTRAINT chk_client_email 
CHECK (email LIKE '%@%.%');

-- Format du numéro de téléphone
ALTER TABLE CLIENT
ADD CONSTRAINT chk_client_telephone 
CHECK (
    telephone LIKE '__________' 
    AND telephone NOT LIKE '%[a-zA-Z]%'
);

-- Prix du plat > 0
ALTER TABLE PLAT
ADD CONSTRAINT chk_plat_prix 
CHECK (prix > 0);

-- Detail mode de retrait
ALTER TABLE COMMANDE
ADD CONSTRAINT chk_commande_mode_retrait 
CHECK (mode_retrait IN ('livraison', 'emporter', 'sur place'));

-- Commande = (quantite >= 1)
ALTER TABLE CONTENIR
ADD CONSTRAINT chk_contenir_quantite 
CHECK (quantite >= 1);

-- Les montants >= 0
ALTER TABLE FACTURE
ADD CONSTRAINT chk_facture_montant_ht 
CHECK (montant_ht >= 0);

ALTER TABLE FACTURE
ADD CONSTRAINT chk_facture_montant_tva 
CHECK (montant_tva >= 0);

ALTER TABLE FACTURE
ADD CONSTRAINT chk_facture_montant_ttc 
CHECK (montant_ttc >= montant_ht);