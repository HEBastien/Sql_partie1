-- Ex1

SELECT commande.date_commande, commande.nom_client, plat.libelle, commande.total
FROM commande
JOIN plat 
ON plat.id = commande.id_plat;

-- Ex2

SELECT plat.libelle AS plat, categorie.libelle AS nom_categorie
FROM plat
JOIN categorie
ON plat.id_categorie = categorie.id;

-- Ex3

SELECT categorie.libelle AS categorie , COUNT(plat.libelle) AS plat 
FROM plat
JOIN categorie
ON plat.id_categorie = categorie.id
GROUP BY categorie ;

-- Ex4

SELECT plat.libelle AS plat, SUM(commande.quantite) AS nmbr_vente
FROM plat
JOIN commande
ON commande.id_plat = plat.id
GROUP BY plat
ORDER BY nmbr_vente DESC;

-- Ex5

SELECT plat.libelle AS plat, MAX(commande.quantite*plat.prix) AS total
FROM plat
JOIN commande
ON commande.id_plat = plat.id;

-- Ex6

SELECT nom_client, total AS chiffre_affaire 
FROM commande 
ORDER BY chiffre_affaire DESC;

-- Suite Exo
-- Ex1

DELETE FROM plat WHERE active = 'No';

-- Ex2

DELETE FROM commande WHERE etat = 'Livrée';

-- Ex3

INSERT INTO categorie (libelle, image, active)
  VALUES('act', 'img', 'act');
INSERT INTO plat (libelle, description, prix, image, id_categorie, active) 
  VALUES('act', 'descp', 70, 'img', LAST_INSERT_ID(),'act');

-- Ex4

UPDATE plat SET prix = prix * 1.1 WHERE id_categorie = (SELECT id FROM categorie WHERE libelle = 'Pizza');
