-- 1

SELECT employe.prenom, dept.noregion 
FROM employe  
JOIN dept 
ON employe.nodep = dept.nodept;

-- 2 
SELECT employe.nom, employe.nodep, dept.nom 
FROM employe 
JOIN dept 
ON employe.nodep = dept.nodept 
ORDER BY employe.nodep ASC;

-- 3 
SELECT employe.nom 
FROM employe 
JOIN dept 
ON employe.nodep = dept.nodept 
WHERE dept.nom = 'distribution';

-- 4 
SELECT tble.nom, tble.salaire, tblesup.nom AS 'nom_patron', tblesup.salaire AS 'salaire_patron' 
FROM employe AS tblesup 
LEFT JOIN employe AS tble 
ON tble.nosup = tblesup.noemp 
WHERE tble.salaire > tblesup.salaire;

-- 5 
SELECT nom, titre 
FROM `employe` 
WHERE titre 
IN (SELECT titre FROM `employe` WHERE nom = 'Amartakaldire');

-- 6 
SELECT nom, salaire, nodep 
FROM `employe` 
WHERE salaire > ANY (SELECT salaire FROM `employe` WHERE nodep = '31') 
ORDER BY nodep, salaire ASC;

-- 7 
SELECT nom, salaire, nodep 
FROM `employe` 
WHERE salaire > ALL (SELECT salaire FROM `employe` WHERE nodep = '31') 
ORDER BY nodep, salaire ASC;

-- 8 
SELECT nom, titre 
FROM `employe` 
WHERE titre IN (SELECT titre FROM `employe` WHERE nodep = '32') 
AND nodep = '31';

-- 09 
SELECT nom, titre 
FROM `employe` 
WHERE titre NOT IN (SELECT titre FROM `employe` WHERE nodep = '32') 
AND nodep = '31';

-- 10 
SELECT nom, titre, salaire 
FROM `employe` 
WHERE titre IN (SELECT titre FROM `employe` WHERE nom = 'Fairent') 
AND salaire IN (SELECT salaire FROM `employe` WHERE nom = 'Fairent');

-- 11
SELECT employe.nodep, dept.nom, employe.nom 
FROM employe 
LEFT JOIN dept 
ON employe.nodep = dept.nodept 
ORDER BY employe.nodep;

-- 12

SELECT COUNT(nom) 
AS 'nombre_empl', titre 
FROM `empl` 
GROUP BY titre;

-- 13

SELECT AVG(salaire) 
AS 'moy_sal', SUM(salaire) AS 'som_sal', nodep 
FROM `employe` 
GROUP BY nodep;

-- 14

SELECT COUNT(nom) 
AS 'nmbr_empl', nodep 
FROM `empl` 
GROUP BY nodep HAVING COUNT(*) >= 3;

-- 15

SELECT LEFT(nom, 1) 
AS premiere_lettre, COUNT(*) AS 'nmbr' 
FROM `employe` 
GROUP BY premiere_lettre HAVING COUNT(*) >= 3;

-- 16

SELECT MAX(salaire) AS salaire_max, MIN(salaire) AS salaire_min, salaire_max - salaire_min AS ecart_salaire 
FROM employe;

-- 17

SELECT COUNT(DISTINCT titre) 
FROM employe;

-- 18

SELECT COUNT(nom), titre 
FROM employe 
GROUP BY titre;

-- 19

SELECT COUNT(employe.nom), dept.nom 
FROM employe 
JOIN dept ON employe.nodep = dept.nodept 
GROUP BY dept.nom;

-- 20

SELECT AVG(salaire) AS moy_salaire, titre 
FROM `employe` GROUP BY titre 
HAVING moy_salaire > (SELECT AVG(salaire) AS moy_sal FROM `employe` WHERE titre = 'représentant');

-- 21

SELECT COUNT(tauxcom) AS nmbr_tauxcom, COUNT(salaire) AS nmbr_salaire 
FROM employe;