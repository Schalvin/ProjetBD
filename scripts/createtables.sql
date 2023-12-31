DROP TABLE Utilisateurs;


CREATE TABLE Utilisateurs (
ID_Utilisateur integer primary key,
Prenom varchar(30) NOT NULL,
Nom_famille varchar(30) NOT NULL,
Pseudo varchar(30) NOT NULL,
Date_naissance DATE NOT NULL,
Email varchar(30) NOT NULL,
Mot_de_passe varchar(30) NOT NULL,
Photo_profil bytea,
ID_Type int NOT NULL
);
