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
   id_chef VARCHAR(50) ,
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