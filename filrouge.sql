-- Ex1

SELECT commande.date_commande, commande.nom_client, plat.libelle, commande.total
FROM commande
JOIN plat 
ON commande.id_plat = plat.id ;

-- Ex2

SELECT plat.libelle , categorie.libelle
FROM plat
JOIN categorie
ON categorie.id = plat.id_categorie ;

-- Ex3

Select COUNT ( plat.libelle) AS plat_lib
