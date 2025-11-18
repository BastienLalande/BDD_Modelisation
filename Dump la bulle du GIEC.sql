CREATE DATABASE  IF NOT EXISTS `la_bulle_du_giec` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `la_bulle_du_giec`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: la_bulle_du_giec
-- ------------------------------------------------------
-- Server version	9.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `id_admin` int NOT NULL AUTO_INCREMENT,
  `id_employe` int NOT NULL,
  PRIMARY KEY (`id_admin`),
  UNIQUE KEY `id_employe` (`id_employe`),
  CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`id_employe`) REFERENCES `employes` (`id_employe`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,2),(2,4),(3,6),(4,8),(5,10),(6,12),(7,14),(8,16),(9,18),(10,20);
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agences`
--

DROP TABLE IF EXISTS `agences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agences` (
  `id_agence` int NOT NULL AUTO_INCREMENT,
  `adresse_agence` text NOT NULL,
  `id_region` int NOT NULL,
  PRIMARY KEY (`id_agence`),
  KEY `id_region` (`id_region`),
  CONSTRAINT `agences_ibfk_1` FOREIGN KEY (`id_region`) REFERENCES `regions` (`id_region`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agences`
--

LOCK TABLES `agences` WRITE;
/*!40000 ALTER TABLE `agences` DISABLE KEYS */;
INSERT INTO `agences` VALUES (1,'12 rue Verte, Nantes',1),(2,'48 avenue Haussmann, Paris',2),(3,'14 avenue du Hay, Bordeaux',3),(4,'30 boulevard Montagne, Lyon',4),(5,'88 boulevard du Littoral, Nice',5),(6,'15 rue des Platanes, Toulouse',6),(7,'20 avenue des Alpes, Marseille',7),(8,'50 boulevard du Ponant, Rennes',8);
/*!40000 ALTER TABLE `agences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capteurs`
--

DROP TABLE IF EXISTS `capteurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capteurs` (
  `id_capteur` int NOT NULL AUTO_INCREMENT,
  `id_prefecture` int NOT NULL,
  `id_tech` int NOT NULL,
  `id_gaz` int NOT NULL,
  `id_agence` int NOT NULL,
  PRIMARY KEY (`id_capteur`),
  KEY `id_prefecture` (`id_prefecture`),
  KEY `id_tech` (`id_tech`),
  KEY `id_gaz` (`id_gaz`),
  KEY `id_agence` (`id_agence`),
  CONSTRAINT `capteurs_ibfk_1` FOREIGN KEY (`id_prefecture`) REFERENCES `prefectures` (`id_prefecture`),
  CONSTRAINT `capteurs_ibfk_2` FOREIGN KEY (`id_tech`) REFERENCES `techs` (`id_tech`),
  CONSTRAINT `capteurs_ibfk_3` FOREIGN KEY (`id_gaz`) REFERENCES `gaz` (`id_gaz`),
  CONSTRAINT `capteurs_ibfk_4` FOREIGN KEY (`id_agence`) REFERENCES `agences` (`id_agence`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capteurs`
--

LOCK TABLES `capteurs` WRITE;
/*!40000 ALTER TABLE `capteurs` DISABLE KEYS */;
INSERT INTO `capteurs` VALUES (1,5,3,3,6),(2,5,4,6,2),(3,1,5,7,1),(4,7,3,3,6),(5,1,8,5,7),(6,2,9,7,6),(7,8,8,1,3),(8,1,7,4,7),(9,5,2,6,6),(10,4,10,3,8),(11,4,8,6,5),(12,7,4,7,6),(13,5,9,4,6),(14,5,8,2,4),(15,5,2,7,6),(16,2,9,4,3),(17,1,5,7,4),(18,5,9,7,5),(19,5,6,3,4),(20,6,6,3,5),(21,6,3,6,2),(22,5,7,7,2),(23,4,1,4,5),(24,1,9,6,7),(25,2,6,8,6),(26,3,5,5,1),(27,5,10,3,2),(28,6,3,3,8),(29,1,9,6,4),(30,1,6,3,5),(31,5,5,2,7),(32,6,6,7,4),(33,2,7,4,1),(34,2,3,4,1),(35,3,8,8,3),(36,5,5,5,1),(37,2,8,6,6),(38,8,6,6,7),(39,5,5,8,7),(40,8,9,1,3),(41,5,10,6,4),(42,6,6,6,5),(43,8,7,1,6),(44,2,3,6,4),(45,2,3,3,5),(46,4,6,5,5),(47,1,6,1,2),(48,5,5,3,3),(49,5,7,1,2),(50,4,1,5,5);
/*!40000 ALTER TABLE `capteurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chefs`
--

DROP TABLE IF EXISTS `chefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chefs` (
  `id_chef` int NOT NULL AUTO_INCREMENT,
  `diplome` varchar(50) DEFAULT NULL,
  `id_agence` int NOT NULL,
  `id_employe` int NOT NULL,
  PRIMARY KEY (`id_chef`),
  UNIQUE KEY `id_agence` (`id_agence`),
  UNIQUE KEY `id_employe` (`id_employe`),
  CONSTRAINT `chefs_ibfk_1` FOREIGN KEY (`id_agence`) REFERENCES `agences` (`id_agence`),
  CONSTRAINT `chefs_ibfk_2` FOREIGN KEY (`id_employe`) REFERENCES `employes` (`id_employe`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chefs`
--

LOCK TABLES `chefs` WRITE;
/*!40000 ALTER TABLE `chefs` DISABLE KEYS */;
INSERT INTO `chefs` VALUES (1,'Master en environnement',1,21),(2,'Ingénieur en climatologie',2,22),(3,'PhD en sciences atmosphériques',3,23),(4,'Diplôme en gestion environnementale',4,24),(5,'Doctorat en écologie',5,25),(6,'Master en génie climatique',6,26),(7,'MBA en administration',7,27),(8,'Licence en management',8,28);
/*!40000 ALTER TABLE `chefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employes`
--

DROP TABLE IF EXISTS `employes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employes` (
  `id_employe` int NOT NULL AUTO_INCREMENT,
  `nom_employe` varchar(50) NOT NULL,
  `prenom_employe` varchar(50) NOT NULL,
  `date_de_naissance` date NOT NULL,
  `date_prise_de_poste` date NOT NULL,
  `adresse_employe` text NOT NULL,
  `id_agence` int NOT NULL,
  PRIMARY KEY (`id_employe`),
  KEY `id_agence` (`id_agence`),
  CONSTRAINT `employes_ibfk_1` FOREIGN KEY (`id_agence`) REFERENCES `agences` (`id_agence`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employes`
--

LOCK TABLES `employes` WRITE;
/*!40000 ALTER TABLE `employes` DISABLE KEYS */;
INSERT INTO `employes` VALUES (1,'Durand','Emma','1987-06-10','2018-12-15','15 avenue des Roses, Marseille',3),(2,'Bertrand','Olivier','1993-11-30','2021-07-12','45 impasse du Soleil, Toulouse',6),(3,'Meunier','Céline','1989-08-14','2019-03-22','38 rue du Lac, Grenoble',5),(4,'Fontaine','Sophie','1990-09-25','2019-10-05','17 rue des Vignes, Montpellier',1),(5,'Babono','Antoine','1987-09-20','2018-11-01','21 boulevard Jean-Jaurès, Bordeaux',2),(6,'Joubert','Sarah','1989-04-07','2019-06-23','18 avenue des Mimosas, Marseille',6),(7,'Voisin','Alexandre','1991-12-03','2020-09-01','11 rue du Moulin, Rennes',8),(8,'Morel','Camille','1984-07-15','2018-03-10','9 rue des Coquelicots, Lyon',4),(9,'Allaire','Julian','1993-12-05','2021-06-22','34 avenue des Peupliers, Nantes',7),(10,'Leclercq','Charles','1985-07-29','2020-08-14','10 rue des Azalées, Paris',6),(11,'Deschamps','Didier','1993-06-12','2021-12-09','47 rue du Port, Rennes',5),(12,'Guérin','Maurice','1994-08-15','2022-05-30','5 rue du Printemps, Nice',2),(13,'Lemoine','Hugo','1988-10-30','2020-07-06','13 rue du Château, Bordeaux',8),(14,'Le Hel','Louis','1992-11-11','2021-10-15','32 avenue du Centre, Toulouse',1),(15,'Lalande','Bastien','1990-02-14','2022-01-15','20 impasse des Oliviers, Rennes',4),(16,'Simon','Simon','1995-10-22','2023-02-19','33 boulevard Montmartre, Paris',7),(17,'Perrier','Elise','1986-01-21','2017-11-08','19 avenue des Champs, Clermont-Ferrand',8),(18,'Chauveau','Laura','1995-05-08','2023-09-10','44 rue des Érables, Marseille',3),(19,'Roche','Nicolas','1992-04-18','2020-02-20','22 boulevard du Parc, Strasbourg',5),(20,'Collet','Hugo','1988-02-28','2018-07-16','27 avenue des Platanes, Nantes',2),(21,'Vaillant','Manon','1984-05-03','2017-02-21','19 boulevard de la République, Lyon',6),(22,'Marchand','Alice','1994-03-15','2022-05-07','31 boulevard du Centre, Caen',1),(23,'Charpentier','Thomas','1995-05-07','2023-06-18','11 boulevard Saint-Louis, Amiens',3),(24,'Le Petit','Gregoire','1987-03-25','2019-05-01','29 allée des Tilleuls, Nice',8),(25,'Fernandez','Lucas','1991-07-02','2020-09-25','26 rue des Bouleaux, Rennes',2),(26,'Groey','Louise','1990-03-17','2021-04-05','50 boulevard des Fleurs, Lyon',4),(27,'Rocher','Yves','1986-11-08','2019-09-11','16 impasse des Cerisiers, Toulouse',1),(28,'Boucher','Lucas','1996-01-19','2024-03-07','8 impasse des Lilas, Nantes',5),(29,'Dumont','Anaïs','1986-09-21','2019-11-04','7 boulevard Saint-Michel, Paris',3);
/*!40000 ALTER TABLE `employes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gaz`
--

DROP TABLE IF EXISTS `gaz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gaz` (
  `id_gaz` int NOT NULL AUTO_INCREMENT,
  `nom_gaz` varchar(50) NOT NULL,
  `sigle` varchar(10) NOT NULL,
  `type_gaz` varchar(10) NOT NULL,
  PRIMARY KEY (`id_gaz`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gaz`
--

LOCK TABLES `gaz` WRITE;
/*!40000 ALTER TABLE `gaz` DISABLE KEYS */;
INSERT INTO `gaz` VALUES (1,'Dioxyde de carbone','CO2','GESI'),(2,'Méthane','CH4','GES'),(3,'Protoxyde d\'azote','N2O','GESI'),(4,'Ammoniac','NH3','Autre'),(5,'Hexafluorure de soufre','SF6','PFC'),(6,'Perfluorocarbones','PFC','PFC'),(7,'Hydrofluorocarbones','HFC','HFC'),(8,'Chlorofluorocarbones','CFC','CFC');
/*!40000 ALTER TABLE `gaz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prefectures`
--

DROP TABLE IF EXISTS `prefectures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prefectures` (
  `id_prefecture` int NOT NULL AUTO_INCREMENT,
  `nom_prefecture` varchar(50) NOT NULL,
  `id_region` int NOT NULL,
  PRIMARY KEY (`id_prefecture`),
  KEY `id_region` (`id_region`),
  CONSTRAINT `prefectures_ibfk_1` FOREIGN KEY (`id_region`) REFERENCES `regions` (`id_region`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prefectures`
--

LOCK TABLES `prefectures` WRITE;
/*!40000 ALTER TABLE `prefectures` DISABLE KEYS */;
INSERT INTO `prefectures` VALUES (1,'Nantes',1),(2,'Paris',2),(3,'Bordeaux',3),(4,'Lyon',4),(5,'Nice',5),(6,'Toulouse',6),(7,'Marseille',7),(8,'Rennes',8);
/*!40000 ALTER TABLE `prefectures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rapports`
--

DROP TABLE IF EXISTS `rapports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rapports` (
  `id_rapport` int NOT NULL AUTO_INCREMENT,
  `titre_rapport` varchar(255) NOT NULL,
  `date_rapport` date DEFAULT NULL,
  `analyse` text,
  `id_admin` int NOT NULL,
  PRIMARY KEY (`id_rapport`),
  KEY `id_admin` (`id_admin`),
  CONSTRAINT `rapports_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admins` (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rapports`
--

LOCK TABLES `rapports` WRITE;
/*!40000 ALTER TABLE `rapports` DISABLE KEYS */;
INSERT INTO `rapports` VALUES (1,'Impact des émissions de CO₂ en région Sud','2021-07-12','Les relevés montrent une augmentation des émissions de dioxyde de carbone dans cette région, principalement due aux activités industrielles.',8),(2,'Évolution du méthane dans les zones agricoles','2024-12-27','Les émissions de méthane ont fortement varié en fonction des pratiques agricoles et du climat de la région.',5),(3,'Analyse des gaz fluorés dans le secteur urbain','2021-04-19','Les relevés indiquent une concentration significative de gaz fluorés, probablement liée aux systèmes de climatisation et de réfrigération.',3),(4,'Tendance des gaz à effet de serre en Europe','2024-09-22','La présence de GES dans l\'air ambiant suit une tendance à la hausse, nécessitant des actions de réduction rapide.',3),(5,'Étude des concentrations d\'ammoniac en milieu rural','2019-09-20','Les niveaux d\'ammoniac détectés sont liés aux engrais utilisés dans l\'agriculture intensive.',7),(6,'Rapport sur l\'impact des hydrocarbures en zone côtière','2018-07-20','Les relevés suggèrent une influence notable des activités maritimes sur les concentrations de certains hydrocarbures atmosphériques.',9),(7,'Analyse des émissions de SF6 dans l\'industrie','2022-06-25','La présence de SF6 est largement attribuable aux équipements électriques utilisés dans les industries de haute technologie.',10),(8,'Observations sur la pollution aux PFC en milieu urbain','2014-06-05','Les niveaux de PFC restent préoccupants dans certaines zones fortement industrialisées.',3),(9,'Évolution des gaz à effet de serre selon la météo','2024-03-13','Les fluctuations des concentrations de CO₂ et de méthane semblent fortement influencées par les variations climatiques.',2),(10,'Impact environnemental des CFC résiduels','2022-03-29','Les relevés indiquent encore des traces de CFC malgré leur interdiction il y a plusieurs années.',4),(11,'Analyse des émissions de N₂O dans l\'atmosphère','2021-06-09','Le protoxyde d\'azote contribue à l\'effet de serre et ses niveaux sont liés aux processus industriels et agricoles.',3),(12,'Concentration de gaz à effet de serre en milieu montagnard','2018-08-06','Les relevés indiquent une faible concentration de GES, suggérant une absorption efficace par les écosystèmes locaux.',5),(13,'Pollution aux hydrocarbures dans les grandes villes','2016-10-07','Les niveaux élevés de particules d\'hydrocarbures sont attribués aux transports et aux activités industrielles.',2),(14,'Effets des gaz industriels sur la qualité de l\'air','2019-01-22','Les concentrations de gaz dans les zones industrielles montrent un impact significatif sur la santé publique.',10),(15,'Variations saisonnières des émissions de méthane','2014-05-29','Les niveaux de méthane fluctuent selon les saisons et sont influencés par la température et l\'humidité.',5),(16,'Étude des gaz fluorés dans les régions côtières','2023-07-12','Les relevés montrent une accumulation notable de HFC et PFC, probablement liée aux activités industrielles.',8),(17,'Évolution des émissions d\'ammoniac en milieu urbain','2020-05-01','Les concentrations d\'ammoniac sont en hausse, probablement en raison de l\'utilisation de produits ménagers et industriels.',9),(18,'Impact des gaz à effet de serre sur la biodiversité','2016-10-17','Les relevés suggèrent que les émissions de gaz influencent la biodiversité en modifiant les écosystèmes locaux.',9),(19,'Concentration de gaz polluants dans l\'air après une canicule','2018-03-05','Les périodes de forte chaleur entraînent une augmentation des concentrations de gaz polluants, aggravant la qualité de l\'air.',8);
/*!40000 ALTER TABLE `rapports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regions` (
  `id_region` int NOT NULL AUTO_INCREMENT,
  `nom_region` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_region`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'Pays de la Loire'),(2,'Île-de-France'),(3,'Nouvelle-Aquitaine'),(4,'Auvergne-Rhône-Alpes'),(5,'Normandie'),(6,'Occitanie'),(7,'Provence-Alpes-Côte d\'Azur'),(8,'Bretagne');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `releves`
--

DROP TABLE IF EXISTS `releves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `releves` (
  `id_releve` int NOT NULL AUTO_INCREMENT,
  `date_releve` date NOT NULL,
  `donnee` double NOT NULL,
  `id_rapport` int NOT NULL,
  `id_capteur` int NOT NULL,
  PRIMARY KEY (`id_releve`),
  KEY `id_rapport` (`id_rapport`),
  KEY `id_capteur` (`id_capteur`),
  CONSTRAINT `releves_ibfk_1` FOREIGN KEY (`id_rapport`) REFERENCES `rapports` (`id_rapport`),
  CONSTRAINT `releves_ibfk_2` FOREIGN KEY (`id_capteur`) REFERENCES `capteurs` (`id_capteur`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `releves`
--

LOCK TABLES `releves` WRITE;
/*!40000 ALTER TABLE `releves` DISABLE KEYS */;
INSERT INTO `releves` VALUES (1,'2015-05-01',303.43,15,18),(2,'2019-01-10',245.68,7,42),(3,'2017-05-10',289.19,8,35),(4,'2022-06-21',214.53,15,39),(5,'2025-04-08',203.68,15,48),(6,'2022-10-20',340.16,11,14),(7,'2016-08-20',314.29,4,46),(8,'2023-11-15',340.6,16,25),(9,'2022-05-08',314.27,13,19),(10,'2021-03-16',183.63,10,42),(11,'2023-10-11',288.67,10,42),(12,'2016-08-15',323.75,6,21),(13,'2018-01-25',243.49,9,5),(14,'2025-08-03',347.07,11,49),(15,'2016-10-22',174.04,5,14),(16,'2018-08-09',247.02,16,48),(17,'2025-02-02',275.23,5,14),(18,'2019-01-23',311.09,6,38),(19,'2017-12-06',201.93,14,18),(20,'2018-10-24',313.13,14,30),(21,'2024-03-26',378.38,17,27),(22,'2016-10-10',235.6,2,47),(23,'2014-08-19',191.97,3,43),(24,'2015-06-27',271.7,5,43),(25,'2016-05-12',256.25,18,30),(26,'2021-08-11',213.54,10,39),(27,'2024-08-27',226.16,6,28),(28,'2018-10-01',271.42,16,24),(29,'2018-07-26',246.49,15,41),(30,'2022-04-15',164.02,8,12),(31,'2025-08-16',257.13,12,3),(32,'2014-12-20',342.59,15,44),(33,'2023-04-05',196.93,17,39),(34,'2017-06-06',257.95,18,47),(35,'2018-11-27',192.46,17,13),(36,'2016-04-17',195.22,15,43),(37,'2022-03-17',196.27,8,25),(38,'2015-11-20',269.14,8,4),(39,'2018-10-21',287.78,10,5),(40,'2018-06-09',298.55,8,4),(41,'2020-04-01',173.31,13,20),(42,'2014-08-21',291.37,2,43),(43,'2019-07-16',280.97,6,48),(44,'2022-11-04',178.08,3,18),(45,'2025-04-16',225.36,9,25),(46,'2021-12-26',281.44,11,4),(47,'2020-10-16',346.68,6,27),(48,'2015-07-29',281.13,7,4),(49,'2014-07-15',266.59,19,47),(50,'2016-10-15',105.12,2,12),(51,'2016-01-25',291.26,8,32),(52,'2016-10-02',101.73,4,37),(53,'2025-02-21',242.98,12,41),(54,'2022-10-05',183.08,18,3),(55,'2020-09-22',277.37,11,39),(56,'2015-02-18',278.18,3,6),(57,'2023-09-01',257.58,16,21),(58,'2021-06-14',141.65,18,38),(59,'2021-12-30',197.06,9,17),(60,'2017-06-16',162.53,2,23),(61,'2016-05-08',190.26,18,2),(62,'2022-08-22',200.41,1,16),(63,'2016-03-28',367.87,4,47),(64,'2025-02-08',274.3,16,45),(65,'2024-05-23',159.32,2,16),(66,'2020-03-27',187.45,12,50),(67,'2025-01-12',302.57,10,21),(68,'2026-04-10',219.52,15,27),(69,'2016-12-19',280.98,14,41),(70,'2025-08-22',298.79,14,4),(71,'2017-07-03',238,9,32),(72,'2020-01-06',233.55,3,20),(73,'2020-09-10',351,9,17),(74,'2021-03-16',193.31,9,33),(75,'2017-05-22',432.1,17,4),(76,'2020-07-23',326.27,10,10),(77,'2025-06-20',186.77,2,43),(78,'2016-02-22',233.3,14,13),(79,'2020-02-07',236.62,3,20),(80,'2022-10-21',258.91,15,6),(81,'2024-10-22',235.96,4,2),(82,'2018-06-29',178.38,7,40),(83,'2016-01-02',365.09,16,2),(84,'2022-07-17',202.31,10,6),(85,'2019-01-01',275.3,4,35),(86,'2015-12-24',213.98,14,40),(87,'2024-08-18',300.19,1,1),(88,'2017-06-08',187.3,10,35),(89,'2021-08-12',343,10,25),(90,'2024-03-02',260.34,17,35),(91,'2017-03-18',395.27,15,7),(92,'2020-12-01',396.43,2,37),(93,'2022-10-18',213.15,4,41),(94,'2017-11-21',247.71,11,47),(95,'2017-06-19',302.54,18,9),(96,'2014-05-17',299.41,8,44),(97,'2023-02-21',338.26,13,32),(98,'2025-07-08',285.31,4,49),(99,'2019-05-11',241.55,16,35),(100,'2020-09-12',248.59,4,47),(101,'2025-06-09',286.82,13,26),(102,'2014-12-19',279.24,6,38),(103,'2017-11-22',307.64,10,35),(104,'2021-03-11',250.42,15,9),(105,'2015-07-30',262.57,5,48),(106,'2015-09-05',227.25,17,50),(107,'2020-01-27',173.27,2,47),(108,'2022-10-08',285.34,10,44),(109,'2017-03-19',232.23,16,11),(110,'2019-12-29',285.43,7,24),(111,'2016-10-05',294.26,4,35),(112,'2021-11-10',284.73,15,25),(113,'2018-11-13',239.54,12,9),(114,'2025-02-10',233.72,15,18),(115,'2023-08-04',266.19,15,22),(116,'2020-02-17',248.79,5,40),(117,'2025-08-20',200.12,1,11),(118,'2020-01-27',290.91,15,43),(119,'2024-11-28',360.9,14,43),(120,'2016-09-30',268.51,13,32),(121,'2018-04-17',234.13,6,25),(122,'2019-10-18',285.05,17,26),(123,'2023-04-08',215.5,4,2),(124,'2026-03-17',256.4,8,36),(125,'2022-11-06',204.27,13,25),(126,'2015-05-25',285.24,4,23),(127,'2022-05-24',322.37,6,34),(128,'2018-07-27',306.38,2,30),(129,'2021-12-29',260.78,7,17),(130,'2018-11-21',211.84,18,25),(131,'2022-04-10',285.65,8,43),(132,'2016-05-12',329.29,16,50),(133,'2021-01-29',173.62,10,18),(134,'2015-03-21',234.96,6,49),(135,'2025-01-24',171.05,5,9),(136,'2025-06-04',174.09,2,45),(137,'2019-06-22',215.6,18,16),(138,'2021-08-17',229.61,16,7),(139,'2018-07-27',150.73,13,22),(140,'2024-05-08',285.33,12,45),(141,'2017-07-28',261.84,18,42),(142,'2021-06-14',204.98,17,14),(143,'2020-06-12',313.54,15,24),(144,'2020-07-01',224.63,13,20),(145,'2020-11-27',305.98,6,25),(146,'2016-09-01',190.16,15,2),(147,'2014-11-13',262.23,5,18),(148,'2020-10-30',139.6,4,39),(149,'2016-04-03',444.94,6,22),(150,'2022-09-09',301.08,6,40),(151,'2025-04-14',261.43,13,28),(152,'2018-05-01',230.8,16,39),(153,'2022-10-27',241.84,11,22),(154,'2014-09-12',274,3,13),(155,'2024-12-17',377.41,6,32),(156,'2019-08-16',194.72,12,18),(157,'2019-06-16',277.14,7,29),(158,'2017-11-14',259.65,5,32),(159,'2014-08-12',199.43,3,17),(160,'2020-02-27',216.34,19,30),(161,'2016-06-30',320.28,2,14),(162,'2026-02-28',153.61,1,31),(163,'2021-11-16',279.81,10,24),(164,'2015-01-12',354.89,5,37),(165,'2019-05-19',269.3,7,13),(166,'2022-12-23',248.61,2,46),(167,'2023-05-27',218.04,13,6),(168,'2019-05-12',160.48,8,50),(169,'2017-08-22',148.21,8,12),(170,'2020-09-11',217.84,15,50),(171,'2025-12-12',230.32,18,11),(172,'2016-04-15',306.25,4,12),(173,'2017-10-12',362.26,1,46),(174,'2021-07-06',260.96,4,10),(175,'2025-11-17',212.74,14,37),(176,'2020-08-01',173.62,16,29),(177,'2022-11-10',318.57,13,18),(178,'2016-07-27',271.23,7,6),(179,'2025-03-29',205.49,14,36),(180,'2021-01-24',255.25,12,9),(181,'2015-07-04',254.86,10,38),(182,'2020-07-09',270.98,5,5),(183,'2020-11-26',239.57,7,42),(184,'2020-06-26',239.24,2,21),(185,'2025-10-09',219.51,12,49),(186,'2015-09-05',217.58,16,34),(187,'2019-05-10',293.53,2,23),(188,'2023-01-01',275.64,1,12),(189,'2021-05-28',362.65,6,31),(190,'2024-11-03',319.03,18,26),(191,'2017-10-31',346.93,13,32),(192,'2015-12-27',269.43,4,7),(193,'2022-04-19',277.33,15,8),(194,'2016-04-03',246.37,14,18),(195,'2016-12-14',189.27,15,10),(196,'2018-11-15',227.6,13,1),(197,'2018-12-20',162.37,12,21),(198,'2019-10-24',248.61,11,40),(199,'2021-06-25',195.25,5,23),(200,'2017-11-26',227.12,14,17),(201,'2023-05-05',182.34,12,2),(202,'2023-05-15',194.52,8,2),(203,'2023-05-25',176.89,5,2),(204,'2023-06-07',188.27,17,2),(205,'2023-06-10',193.42,9,2),(206,'2023-06-20',195.84,2,2),(207,'2023-06-25',178.19,14,2),(208,'2023-06-30',184.56,6,2);
/*!40000 ALTER TABLE `releves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techs`
--

DROP TABLE IF EXISTS `techs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `techs` (
  `id_tech` int NOT NULL AUTO_INCREMENT,
  `id_employe` int NOT NULL,
  PRIMARY KEY (`id_tech`),
  UNIQUE KEY `id_employe` (`id_employe`),
  CONSTRAINT `techs_ibfk_1` FOREIGN KEY (`id_employe`) REFERENCES `employes` (`id_employe`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techs`
--

LOCK TABLES `techs` WRITE;
/*!40000 ALTER TABLE `techs` DISABLE KEYS */;
INSERT INTO `techs` VALUES (1,1),(2,3),(3,5),(4,7),(5,9),(6,11),(7,13),(8,15),(9,17),(10,19);
/*!40000 ALTER TABLE `techs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'la_bulle_du_giec'
--
/*!50003 DROP PROCEDURE IF EXISTS `Rapport_gaz` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Rapport_gaz`(IN _gaz VARCHAR(50))
BEGIN
	SELECT DISTINCT titre_rapport, nom_gaz
	FROM rapports
	NATURAL JOIN releves
	NATURAL JOIN gaz
	WHERE nom_gaz = _gaz;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
