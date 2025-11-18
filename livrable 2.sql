USE la_bulle_du_giec;

-- 1. Liste de l'ensemble des agences
SELECT nom_prefecture AS agences FROM agences NATURAL JOIN regions NATURAL JOIN prefectures;

-- 2. Liste de l'ensemble du personnel technique de l'agence de Bordeaux
SELECT prenom_employe, nom_employe, nom_prefecture AS agence
FROM techs
NATURAL JOIN employes
NATURAL JOIN agences
NATURAL JOIN regions
NATURAL JOIN prefectures
WHERE nom_prefecture = "Bordeaux";

-- 3. Nombre total de capteurs déployés.
SELECT COUNT(*) AS nombre_de_capteurs FROM capteurs;

-- 4. Liste des rapports publiés entre 2018 et 2022
SELECT titre_rapport, date_rapport FROM rapports WHERE YEAR(date_rapport) BETWEEN 2018 AND 2022;

-- 5. Afficher les concentrations de CH4 (en ppm )
-- dans les régions « Auvergne-Rhône-Alpes »,« Provence-Alpes-Côte d'Azur » et « Occitanie »
-- en mai et juin 2023.
SELECT nom_region, date_releve, donnee, sigle
FROM releves
NATURAL JOIN capteurs
NATURAL JOIN gaz
NATURAL JOIN agences
NATURAL JOIN regions
WHERE sigle = "CH4"
AND nom_region IN ("Auvergne-Rhône-Alpes", "Provence-Alpes-Côte d'Azur", "Occitanie")
AND MONTH(date_releve) IN (5, 6) AND YEAR(date_releve) = 2021
;

-- 6. Liste des noms des agents techniques maintenant des capteurs
-- concernant les gaz à effet de serre provenant de l’industrie (GESI).
SELECT DISTINCT prenom_employe, nom_employe, sigle AS gaz_capteur, type_gaz
FROM employes
NATURAL JOIN techs
NATURAL JOIN capteurs
NATURAL JOIN gaz
WHERE type_gaz = "GESI";

-- 7. Titres et dates des rapports concernant des concentrations de NH3,
-- classés par ordre anti-chronologique.
SELECT DISTINCT titre_rapport, date_rapport, sigle
FROM rapports
NATURAL JOIN releves
NATURAL JOIN gaz
WHERE sigle = "CH4"
ORDER BY date_rapport DESC;

-- 8. Afficher le mois où la concentration de PFC a été la moins importante pour chaque région.
WITH moy_mois_region AS (
    SELECT regions.nom_region, 
           DATE_FORMAT(releves.date_releve, '%Y-%m') AS mois_concentration_min_pfc, 
           AVG(releves.donnee) AS concentration_min_pfc
    FROM regions
    NATURAL JOIN agences
    NATURAL JOIN capteurs
    NATURAL JOIN gaz
    NATURAL JOIN releves
    WHERE gaz.sigle = 'HFC'
    GROUP BY regions.id_region, mois_concentration_min_pfc
)
SELECT nom_region, mois_concentration_min_pfc, concentration_min_pfc
FROM moy_mois_region
WHERE (nom_region, concentration_min_pfc) IN (
    SELECT nom_region, MIN(concentration_min_pfc)
    FROM moy_mois_region
    GROUP BY nom_region
);



-- 9. Moyenne des concentrations (en ppm) dans la région « Ile-de-France » en 2020, pour chaque gaz étudié.
SELECT nom_gaz, AVG(donnee) AS releveMoyen,nom_region,date_releve
FROM releves
NATURAL JOIN capteurs
NATURAL JOIN gaz
NATURAL JOIN agences
NATURAL JOIN regions
WHERE nom_region = "Ile-de-France" AND YEAR(date_releve) = 2020
GROUP BY nom_gaz,nom_region,date_releve;

-- 10. Taux de productivité des agents administratifs de l'agence de Toulouse
-- (nombre de rapports écrits par mois en moyenne, sur la durée de leur contrat).
SELECT prenom_employe, nom_employe, COUNT(id_rapport) / TIMESTAMPDIFF(MONTH, date_prise_de_poste, CURDATE()) AS taux_productivite
FROM admins
NATURAL JOIN employes
NATURAL JOIN agences
NATURAL JOIN regions
NATURAL JOIN Prefectures
NATURAL JOIN rapports
WHERE nom_prefecture = "Toulouse"
GROUP BY id_admin
ORDER BY taux_productivite DESC
;


-- 11. Pour un gaz donné, liste des rapports contenant des données qui le concernent (nom du gaz en paramètre).
/* creation de la procedure si elle n'existe pas */
DROP PROCEDURE IF EXISTS Rapport_gaz;
DELIMITER //
CREATE PROCEDURE Rapport_gaz (IN _gaz VARCHAR(50))
BEGIN
	SELECT DISTINCT titre_rapport, nom_gaz
	FROM rapports
	NATURAL JOIN releves
	NATURAL JOIN gaz
	WHERE nom_gaz = _gaz;
END //
DELIMITER ;


CALL Rapport_gaz("Ammoniac");



-- 12. Liste des régions dans lesquelles il y a plus de capteurs que de personnel d’agence.
WITH nb_employe AS (
    SELECT id_region, COUNT(employes.id_agence) AS total_employes
    FROM agences
    LEFT JOIN employes ON agences.id_agence = employes.id_agence
    GROUP BY id_region
),
nb_capteur AS (
    SELECT id_region, COUNT(capteurs.id_agence) AS total_capteurs
    FROM agences
    LEFT JOIN capteurs ON agences.id_agence = capteurs.id_agence
    GROUP BY id_region
)
SELECT distinct nom_region,total_employes,total_capteurs
FROM nb_employe 
NATURAL JOIN nb_capteur
NATURAL JOIN regions
WHERE total_capteurs>total_employes
;



SELECT  id_region, COUNT(employes.id_agence) AS total_employes
    FROM agences
	JOIN employes ON agences.id_agence = employes.id_agence
    GROUP BY id_region;