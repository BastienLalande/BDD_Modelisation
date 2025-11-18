DROP DATABASE IF EXISTS la_bulle_du_giec;
CREATE DATABASE la_bulle_du_giec;
USE la_bulle_du_giec;

CREATE TABLE Gaz(
   id_gaz INT AUTO_INCREMENT,
   nom_gaz VARCHAR(50)  NOT NULL,
   sigle VARCHAR(10)  NOT NULL,
   type_gaz VARCHAR(10)  NOT NULL,
   PRIMARY KEY(id_gaz)
);

CREATE TABLE Regions(
   id_region INT AUTO_INCREMENT,
   nom_region VARCHAR(50) ,
   PRIMARY KEY(id_region)
);

CREATE TABLE Agences(
   id_agence INT AUTO_INCREMENT,
   adresse_agence TEXT NOT NULL,
   id_region INT NOT NULL,
   PRIMARY KEY(id_agence),
   FOREIGN KEY(id_region) REFERENCES Regions(id_region)
);

CREATE TABLE Prefectures(
   id_prefecture INT AUTO_INCREMENT,
   nom_prefecture VARCHAR(50)  NOT NULL,
   id_region INT NOT NULL,
   PRIMARY KEY(id_prefecture),
   FOREIGN KEY(id_region) REFERENCES Regions(id_region)
);

CREATE TABLE Employes(
   id_employe INT AUTO_INCREMENT,
   nom_employe VARCHAR(50)  NOT NULL,
   prenom_employe VARCHAR(50)  NOT NULL,
   date_de_naissance DATE NOT NULL,
   date_prise_de_poste DATE NOT NULL,
   adresse_employe TEXT NOT NULL,
   id_agence INT NOT NULL,
   PRIMARY KEY(id_employe),
   FOREIGN KEY(id_agence) REFERENCES Agences(id_agence)
);

CREATE TABLE Techs(
   id_tech INT AUTO_INCREMENT,
   id_employe INT NOT NULL,
   PRIMARY KEY(id_tech),
   UNIQUE(id_employe),
   FOREIGN KEY(id_employe) REFERENCES Employes(id_employe)
);

CREATE TABLE Admins(
   id_admin INT AUTO_INCREMENT,
   id_employe INT NOT NULL,
   PRIMARY KEY(id_admin),
   UNIQUE(id_employe),
   FOREIGN KEY(id_employe) REFERENCES Employes(id_employe)
);

CREATE TABLE Rapports(
   id_rapport INT AUTO_INCREMENT,
   titre_rapport VARCHAR(255)  NOT NULL,
   date_rapport DATE,
   analyse TEXT,
   id_admin INT NOT NULL,
   PRIMARY KEY(id_rapport),
   FOREIGN KEY(id_admin) REFERENCES Admins(id_admin)
);

CREATE TABLE Chefs(
   id_chef INT AUTO_INCREMENT,
   diplome VARCHAR(50) ,
   id_agence INT NOT NULL,
   id_employe INT NOT NULL,
   PRIMARY KEY(id_chef),
   UNIQUE(id_agence),
   UNIQUE(id_employe),
   FOREIGN KEY(id_agence) REFERENCES Agences(id_agence),
   FOREIGN KEY(id_employe) REFERENCES Employes(id_employe)
);

CREATE TABLE Capteurs(
   id_capteur INT AUTO_INCREMENT,
   id_prefecture INT NOT NULL,
   id_tech INT NOT NULL,
   id_gaz INT NOT NULL,
   id_agence INT NOT NULL,
   PRIMARY KEY(id_capteur),
   FOREIGN KEY(id_prefecture) REFERENCES Prefectures(id_prefecture),
   FOREIGN KEY(id_tech) REFERENCES Techs(id_tech),
   FOREIGN KEY(id_gaz) REFERENCES Gaz(id_gaz),
   FOREIGN KEY(id_agence) REFERENCES Agences(id_agence)
);

CREATE TABLE Releves(
   id_releve INT AUTO_INCREMENT,
   date_releve DATE NOT NULL,
   donnee DOUBLE NOT NULL,
   id_rapport INT NOT NULL,
   id_capteur INT NOT NULL,
   PRIMARY KEY(id_releve),
   FOREIGN KEY(id_rapport) REFERENCES Rapports(id_rapport),
   FOREIGN KEY(id_capteur) REFERENCES Capteurs(id_capteur)
);






-- insertions -----------------------------------------------------------------------------------------






-- Insertion des gaz
INSERT INTO gaz (nom_gaz, sigle, type_gaz) VALUES
('Dioxyde de carbone', 'CO2', 'GESI'),
('Méthane', 'CH4', 'GES'),
('Protoxyde d\'azote', 'N2O', 'GESI'),
('Ammoniac', 'NH3', 'Autre'),
('Hexafluorure de soufre', 'SF6', 'PFC'),
('Perfluorocarbones', 'PFC', 'PFC'),
('Hydrofluorocarbones', 'HFC', 'HFC'),
('Chlorofluorocarbones', 'CFC', 'CFC');

-- Insertion des régions
INSERT INTO regions (nom_region) VALUES 
('Pays de la Loire'),
('Île-de-France'),
('Nouvelle-Aquitaine'),
('Auvergne-Rhône-Alpes'),
('Normandie'),
('Occitanie'),
('Provence-Alpes-Côte d\'Azur'),
('Bretagne');

-- Insertion des agences
INSERT INTO agences (adresse_agence, id_region) VALUES 
('12 rue Verte, Nantes', 1),
('48 avenue Haussmann, Paris', 2),
('14 avenue du Hay, Bordeaux',3), 
('30 boulevard Montagne, Lyon', 4),
('88 boulevard du Littoral, Nice', 5),
('15 rue des Platanes, Toulouse', 6),
('20 avenue des Alpes, Marseille', 7),
('50 boulevard du Ponant, Rennes', 8);

-- Insertion des préfectures
INSERT INTO prefectures (nom_prefecture, id_region) VALUES 
('Nantes', 1),
('Paris', 2),
('Bordeaux',3),
('Lyon', 4),
('Nice', 5),
('Toulouse', 6),
('Marseille', 7),
('Rennes', 8);

INSERT INTO employes (nom_employe, prenom_employe, date_de_naissance, date_prise_de_poste, adresse_employe, id_agence) VALUES 
('Durand', 'Emma', '1987-06-10', '2018-12-15', '15 avenue des Roses, Marseille', 3),
('Bertrand', 'Olivier', '1993-11-30', '2021-07-12', '45 impasse du Soleil, Toulouse', 6),
('Meunier', 'Céline', '1989-08-14', '2019-03-22', '38 rue du Lac, Grenoble', 5),
('Fontaine', 'Sophie', '1990-09-25', '2019-10-05', '17 rue des Vignes, Montpellier', 1),
('Babono', 'Antoine', '1987-09-20', '2018-11-01', '21 boulevard Jean-Jaurès, Bordeaux', 2),
('Joubert', 'Sarah', '1989-04-07', '2019-06-23', '18 avenue des Mimosas, Marseille', 6),
('Voisin', 'Alexandre', '1991-12-03', '2020-09-01', '11 rue du Moulin, Rennes', 8),
('Morel', 'Camille', '1984-07-15', '2018-03-10', '9 rue des Coquelicots, Lyon', 4),
('Allaire', 'Julian', '1993-12-05', '2021-06-22', '34 avenue des Peupliers, Nantes', 7),
('Leclercq', 'Charles', '1985-07-29', '2020-08-14', '10 rue des Azalées, Paris', 6),
('Deschamps', 'Didier', '1993-06-12', '2021-12-09', '47 rue du Port, Rennes', 5),
('Guérin', 'Maurice', '1994-08-15', '2022-05-30', '5 rue du Printemps, Nice', 2),
('Lemoine', 'Hugo', '1988-10-30', '2020-07-06', '13 rue du Château, Bordeaux', 8),
('Le Hel', 'Louis', '1992-11-11', '2021-10-15', '32 avenue du Centre, Toulouse', 1),
('Lalande', 'Bastien', '1990-02-14', '2022-01-15', '20 impasse des Oliviers, Rennes', 4),
('Simon', 'Simon', '1995-10-22', '2023-02-19', '33 boulevard Montmartre, Paris', 7),
('Perrier', 'Elise', '1986-01-21', '2017-11-08', '19 avenue des Champs, Clermont-Ferrand', 8),
('Chauveau', 'Laura', '1995-05-08', '2023-09-10', '44 rue des Érables, Marseille', 3),
('Roche', 'Nicolas', '1992-04-18', '2020-02-20', '22 boulevard du Parc, Strasbourg', 5),
('Collet', 'Hugo', '1988-02-28', '2018-07-16', '27 avenue des Platanes, Nantes', 2),
('Vaillant', 'Manon', '1984-05-03', '2017-02-21', '19 boulevard de la République, Lyon', 6),
('Marchand', 'Alice', '1994-03-15', '2022-05-07', '31 boulevard du Centre, Caen', 1),
('Charpentier', 'Thomas', '1995-05-07', '2023-06-18', '11 boulevard Saint-Louis, Amiens', 3),
('Le Petit', 'Gregoire', '1987-03-25', '2019-05-01', '29 allée des Tilleuls, Nice', 8),
('Fernandez', 'Lucas', '1991-07-02', '2020-09-25', '26 rue des Bouleaux, Rennes', 2),
('Groey', 'Louise', '1990-03-17', '2021-04-05', '50 boulevard des Fleurs, Lyon', 4),
('Rocher', 'Yves', '1986-11-08', '2019-09-11', '16 impasse des Cerisiers, Toulouse', 1),
('Boucher', 'Lucas', '1996-01-19', '2024-03-07', '8 impasse des Lilas, Nantes', 5),
('Dumont', 'Anaïs', '1986-09-21', '2019-11-04', '7 boulevard Saint-Michel, Paris', 3);
;



-- Insertion des techniciens
INSERT INTO techs (id_employe) VALUES 
(1), (3), (5), (7), (9), (11), (13), (15), (17), (19);

-- Insertion des administrateurs
INSERT INTO admins (id_employe) VALUES 
(2), (4), (6), (8), (10), (12), (14), (16), (18), (20);

-- Insertion des chefs d'agence
INSERT INTO chefs (diplome, id_agence, id_employe) VALUES 
('Master en environnement', 1, 21),
('Ingénieur en climatologie', 2, 22),
('PhD en sciences atmosphériques', 3, 23),
('Diplôme en gestion environnementale', 4, 24),
('Doctorat en écologie', 5, 25),
('Master en génie climatique', 6, 26),
('MBA en administration', 7, 27),
('Licence en management', 8, 28);



-- Insertion des capteurs
INSERT INTO capteurs (id_prefecture, id_tech, id_gaz, id_agence) VALUES 
(5,3,3,6),
(5,4,6,2),
(1,5,7,1),
(7,3,3,6),
(1,8,5,7),
(2,9,7,6),
(8,8,1,3),
(1,7,4,7),
(5,2,6,6),
(4,10,3,8),
(4,8,6,5),
(7,4,7,6),
(5,9,4,6),
(5,8,2,4),
(5,2,7,6),
(2,9,4,3),
(1,5,7,4),
(5,9,7,5),
(5,6,3,4),
(6,6,3,5),
(6,3,6,2),
(5,7,7,2),
(4,1,4,5),
(1,9,6,7),
(2,6,8,6),
(3,5,5,1),
(5,10,3,2),
(6,3,3,8),
(1,9,6,4),
(1,6,3,5),
(5,5,2,7),
(6,6,7,4),
(2,7,4,1),
(2,3,4,1),
(3,8,8,3),
(5,5,5,1),
(2,8,6,6),
(8,6,6,7),
(5,5,8,7),
(8,9,1,3),
(5,10,6,4),
(6,6,6,5),
(8,7,1,6),
(2,3,6,4),
(2,3,3,5),
(4,6,5,5),
(1,6,1,2),
(5,5,3,3),
(5,7,1,2),
(4,1,5,5);



-- Insertion des rapports
INSERT INTO rapports (titre_rapport, date_rapport, analyse, id_admin) VALUES 
("Impact des émissions de CO₂ en région Sud", 
"2021-07-12",
"Les relevés montrent une augmentation des émissions de 
dioxyde de carbone dans cette région, principalement due 
aux activités industrielles.",
 8),
("Évolution du méthane dans les zones agricoles", "2024-12-27", "Les émissions de méthane ont fortement varié en fonction des pratiques agricoles et du climat de la région.", 5),
("Analyse des gaz fluorés dans le secteur urbain", "2021-04-19", "Les relevés indiquent une concentration significative de gaz fluorés, probablement liée aux systèmes de climatisation et de réfrigération.", 3),
("Tendance des gaz à effet de serre en Europe", "2024-09-22", "La présence de GES dans l'air ambiant suit une tendance à la hausse, nécessitant des actions de réduction rapide.", 3),
("Étude des concentrations d'ammoniac en milieu rural", "2019-09-20", "Les niveaux d'ammoniac détectés sont liés aux engrais utilisés dans l'agriculture intensive.", 7),
("Rapport sur l'impact des hydrocarbures en zone côtière", "2018-07-20", "Les relevés suggèrent une influence notable des activités maritimes sur les concentrations de certains hydrocarbures atmosphériques.", 9),
("Analyse des émissions de SF6 dans l'industrie", "2022-06-25", "La présence de SF6 est largement attribuable aux équipements électriques utilisés dans les industries de haute technologie.", 10),
("Observations sur la pollution aux PFC en milieu urbain", "2014-06-05", "Les niveaux de PFC restent préoccupants dans certaines zones fortement industrialisées.", 3),
("Évolution des gaz à effet de serre selon la météo", "2024-03-13", "Les fluctuations des concentrations de CO₂ et de méthane semblent fortement influencées par les variations climatiques.", 2),
("Impact environnemental des CFC résiduels", "2022-03-29", "Les relevés indiquent encore des traces de CFC malgré leur interdiction il y a plusieurs années.", 4),
("Analyse des émissions de N₂O dans l'atmosphère", "2021-06-09", "Le protoxyde d'azote contribue à l'effet de serre et ses niveaux sont liés aux processus industriels et agricoles.", 3),
("Concentration de gaz à effet de serre en milieu montagnard", "2018-08-06", "Les relevés indiquent une faible concentration de GES, suggérant une absorption efficace par les écosystèmes locaux.", 5),
("Pollution aux hydrocarbures dans les grandes villes", "2016-10-07", "Les niveaux élevés de particules d'hydrocarbures sont attribués aux transports et aux activités industrielles.", 2),
("Effets des gaz industriels sur la qualité de l'air", "2019-01-22", "Les concentrations de gaz dans les zones industrielles montrent un impact significatif sur la santé publique.", 10),
("Variations saisonnières des émissions de méthane", "2014-05-29", "Les niveaux de méthane fluctuent selon les saisons et sont influencés par la température et l'humidité.", 5),
("Étude des gaz fluorés dans les régions côtières", "2023-07-12", "Les relevés montrent une accumulation notable de HFC et PFC, probablement liée aux activités industrielles.", 8),
("Évolution des émissions d'ammoniac en milieu urbain", "2020-05-01", "Les concentrations d'ammoniac sont en hausse, probablement en raison de l'utilisation de produits ménagers et industriels.", 9),
("Impact des gaz à effet de serre sur la biodiversité", "2016-10-17", "Les relevés suggèrent que les émissions de gaz influencent la biodiversité en modifiant les écosystèmes locaux.", 9),
("Concentration de gaz polluants dans l'air après une canicule", "2018-03-05", "Les périodes de forte chaleur entraînent une augmentation des concentrations de gaz polluants, aggravant la qualité de l'air.", 8);


-- Insertion des relevés
INSERT INTO releves (date_releve, donnee, id_rapport, id_capteur) VALUES 
  ("2015-05-01","303.43",15,18),
  ("2019-01-10","245.68",7,42),
  ("2017-05-10","289.19",8,35),
  ("2022-06-21","214.53",15,39),
  ("2025-04-08","203.68",15,48),
  ("2022-10-20","340.16",11,14),
  ("2016-08-20","314.29",4,46),
  ("2023-11-15","340.60",16,25),
  ("2022-05-08","314.27",13,19),
  ("2021-03-16","183.63",10,42),
  ("2023-10-11","288.67",10,42),
  ("2016-08-15","323.75",6,21),
  ("2018-01-25","243.49",9,5),
  ("2025-08-03","347.07",11,49),
  ("2016-10-22","174.04",5,14),
  ("2018-08-09","247.02",16,48),
  ("2025-02-02","275.23",5,14),
  ("2019-01-23","311.09",6,38),
  ("2017-12-06","201.93",14,18),
  ("2018-10-24","313.13",14,30),
  ("2024-03-26","378.38",17,27),
  ("2016-10-10","235.60",2,47),
  ("2014-08-19","191.97",3,43),
  ("2015-06-27","271.70",5,43),
  ("2016-05-12","256.25",18,30),
  ("2021-08-11","213.54",10,39),
  ("2024-08-27","226.16",6,28),
  ("2018-10-01","271.42",16,24),
  ("2018-07-26","246.49",15,41),
  ("2022-04-15","164.02",8,12),
  ("2025-08-16","257.13",12,3),
  ("2014-12-20","342.59",15,44),
  ("2023-04-05","196.93",17,39),
  ("2017-06-06","257.95",18,47),
  ("2018-11-27","192.46",17,13),
  ("2016-04-17","195.22",15,43),
  ("2022-03-17","196.27",8,25),
  ("2015-11-20","269.14",8,4),
  ("2018-10-21","287.78",10,5),
  ("2018-06-09","298.55",8,4),
  ("2020-04-01","173.31",13,20),
  ("2014-08-21","291.37",2,43),
  ("2019-07-16","280.97",6,48),
  ("2022-11-04","178.08",3,18),
  ("2025-04-16","225.36",9,25),
  ("2021-12-26","281.44",11,4),
  ("2020-10-16","346.68",6,27),
  ("2015-07-29","281.13",7,4),
  ("2014-07-15","266.59",19,47),
  ("2016-10-15","105.12",2,12),
  ("2016-01-25","291.26",8,32),
  ("2016-10-02","101.73",4,37),
  ("2025-02-21","242.98",12,41),
  ("2022-10-05","183.08",18,3),
  ("2020-09-22","277.37",11,39),
  ("2015-02-18","278.18",3,6),
  ("2023-09-01","257.58",16,21),
  ("2021-06-14","141.65",18,38),
  ("2021-12-30","197.06",9,17),
  ("2017-06-16","162.53",2,23),
  ("2016-05-08","190.26",18,2),
  ("2022-08-22","200.41",1,16),
  ("2016-03-28","367.87",4,47),
  ("2025-02-08","274.30",16,45),
  ("2024-05-23","159.32",2,16),
  ("2020-03-27","187.45",12,50),
  ("2025-01-12","302.57",10,21),
  ("2026-04-10","219.52",15,27),
  ("2016-12-19","280.98",14,41),
  ("2025-08-22","298.79",14,4),
  ("2017-07-03","238.00",9,32),
  ("2020-01-06","233.55",3,20),
  ("2020-09-10","351.00",9,17),
  ("2021-03-16","193.31",9,33),
  ("2017-05-22","432.10",17,4),
  ("2020-07-23","326.27",10,10),
  ("2025-06-20","186.77",2,43),
  ("2016-02-22","233.30",14,13),
  ("2020-02-07","236.62",3,20),
  ("2022-10-21","258.91",15,6),
  ("2024-10-22","235.96",4,2),
  ("2018-06-29","178.38",7,40),
  ("2016-01-02","365.09",16,2),
  ("2022-07-17","202.31",10,6),
  ("2019-01-01","275.30",4,35),
  ("2015-12-24","213.98",14,40),
  ("2024-08-18","300.19",1,1),
  ("2017-06-08","187.30",10,35),
  ("2021-08-12","343.00",10,25),
  ("2024-03-02","260.34",17,35),
  ("2017-03-18","395.27",15,7),
  ("2020-12-01","396.43",2,37),
  ("2022-10-18","213.15",4,41),
  ("2017-11-21","247.71",11,47),
  ("2017-06-19","302.54",18,9),
  ("2014-05-17","299.41",8,44),
  ("2023-02-21","338.26",13,32),
  ("2025-07-08","285.31",4,49),
  ("2019-05-11","241.55",16,35),
  ("2020-09-12","248.59",4,47),
  ("2025-06-09","286.82",13,26),
  ("2014-12-19","279.24",6,38),
  ("2017-11-22","307.64",10,35),
  ("2021-03-11","250.42",15,9),
  ("2015-07-30","262.57",5,48),
  ("2015-09-05","227.25",17,50),
  ("2020-01-27","173.27",2,47),
  ("2022-10-08","285.34",10,44),
  ("2017-03-19","232.23",16,11),
  ("2019-12-29","285.43",7,24),
  ("2016-10-05","294.26",4,35),
  ("2021-11-10","284.73",15,25),
  ("2018-11-13","239.54",12,9),
  ("2025-02-10","233.72",15,18),
  ("2023-08-04","266.19",15,22),
  ("2020-02-17","248.79",5,40),
  ("2025-08-20","200.12",1,11),
  ("2020-01-27","290.91",15,43),
  ("2024-11-28","360.90",14,43),
  ("2016-09-30","268.51",13,32),
  ("2018-04-17","234.13",6,25),
  ("2019-10-18","285.05",17,26),
  ("2023-04-08","215.50",4,2),
  ("2026-03-17","256.40",8,36),
  ("2022-11-06","204.27",13,25),
  ("2015-05-25","285.24",4,23),
  ("2022-05-24","322.37",6,34),
  ("2018-07-27","306.38",2,30),
  ("2021-12-29","260.78",7,17),
  ("2018-11-21","211.84",18,25),
  ("2022-04-10","285.65",8,43),
  ("2016-05-12","329.29",16,50),
  ("2021-01-29","173.62",10,18),
  ("2015-03-21","234.96",6,49),
  ("2025-01-24","171.05",5,9),
  ("2025-06-04","174.09",2,45),
  ("2019-06-22","215.60",18,16),
  ("2021-08-17","229.61",16,7),
  ("2018-07-27","150.73",13,22),
  ("2024-05-08","285.33",12,45),
  ("2017-07-28","261.84",18,42),
  ("2021-06-14","204.98",17,14),
  ("2020-06-12","313.54",15,24),
  ("2020-07-01","224.63",13,20),
  ("2020-11-27","305.98",6,25),
  ("2016-09-01","190.16",15,2),
  ("2014-11-13","262.23",5,18),
  ("2020-10-30","139.60",4,39),
  ("2016-04-03","444.94",6,22),
  ("2022-09-09","301.08",6,40),
  ("2025-04-14","261.43",13,28),
  ("2018-05-01","230.80",16,39),
  ("2022-10-27","241.84",11,22),
  ("2014-09-12","274.00",3,13),
  ("2024-12-17","377.41",6,32),
  ("2019-08-16","194.72",12,18),
  ("2019-06-16","277.14",7,29),
  ("2017-11-14","259.65",5,32),
  ("2014-08-12","199.43",3,17),
  ("2020-02-27","216.34",19,30),
  ("2016-06-30","320.28",2,14),
  ("2026-02-28","153.61",1,31),
  ("2021-11-16","279.81",10,24),
  ("2015-01-12","354.89",5,37),
  ("2019-05-19","269.30",7,13),
  ("2022-12-23","248.61",2,46),
  ("2023-05-27","218.04",13,6),
  ("2019-05-12","160.48",8,50),
  ("2017-08-22","148.21",8,12),
  ("2020-09-11","217.84",15,50),
  ("2025-12-12","230.32",18,11),
  ("2016-04-15","306.25",4,12),
  ("2017-10-12","362.26",1,46),
  ("2021-07-06","260.96",4,10),
  ("2025-11-17","212.74",14,37),
  ("2020-08-01","173.62",16,29),
  ("2022-11-10","318.57",13,18),
  ("2016-07-27","271.23",7,6),
  ("2025-03-29","205.49",14,36),
  ("2021-01-24","255.25",12,9),
  ("2015-07-04","254.86",10,38),
  ("2020-07-09","270.98",5,5),
  ("2020-11-26","239.57",7,42),
  ("2020-06-26","239.24",2,21),
  ("2025-10-09","219.51",12,49),
  ("2015-09-05","217.58",16,34),
  ("2019-05-10","293.53",2,23),
  ("2023-01-01","275.64",1,12),
  ("2021-05-28","362.65",6,31),
  ("2024-11-03","319.03",18,26),
  ("2017-10-31","346.93",13,32),
  ("2015-12-27","269.43",4,7),
  ("2022-04-19","277.33",15,8),
  ("2016-04-03","246.37",14,18),
  ("2016-12-14","189.27",15,10),
  ("2018-11-15","227.60",13,1),
  ("2018-12-20","162.37",12,21),
  ("2019-10-24","248.61",11,40),
  ("2021-06-25","195.25",5,23),
  ("2017-11-26","227.12",14,17),
  ("2023-05-05","182.34",12,2),
  ("2023-05-15","194.52",8,2),
  ("2023-05-25","176.89",5,2),
  ("2023-06-07","188.27",17,2),
  ("2023-06-10","193.42",9,2),
  ("2023-06-20","195.84",2,2),
  ("2023-06-25","178.19",14,2),
  ("2023-06-30","184.56",6,2); 