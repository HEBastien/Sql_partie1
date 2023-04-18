-- Ex1

INSERT INTO employe (noemp, nom, prenom, dataemb, nosup, titre, nodep, salaire, tauxcom) 
VALUES (26, 'jean', 'michel', '2000000000', 19, 'vendeur', 0.10, NULL), 
(27, 'Sara', 'Decastro', '2000000001', 20, 'dir.vente', 1500, NULL),
(28, 'Chaloupe', 'bateau', '2000000002', 04, 'vendeur', 0.15, NULL);

INSERT INTO dept (nodept, nom , noregion ) VALUES ('23', 'vente', '9' );;;;;;

-- Ex2

UPDATE employe SET salaire = salaire * 1.1 WHERE noemp = 17 ;

UPDATE dept SET nom = 'Logistique' WHERE nodept = 45 ;

-- EX3

DELETE FROM employe WHERE noemp = 28;

DELETE FROM employe WHERE noemp=(SElECT MAX(noemp)FROM employe);

