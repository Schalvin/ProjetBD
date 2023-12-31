DROP TABLE TypeUtilisateur;
DROP TABLE Utilisateurs;


CREATE TABLE TypeUtilisateur(
    ID_Type integer PRIMARY KEY,
    Libelle varchar(30)
);

CREATE TABLE Utilisateurs (
    ID_Utilisateur integer PRIMARY KEY,
    Prenom varchar(30) NOT NULL,
    Nom_famille varchar(30) NOT NULL,
    Pseudo varchar(30) NOT NULL,
    Date_naissance DATE NOT NULL,
    Email varchar(30) NOT NULL,
    Mot_de_passe varchar(30) NOT NULL,
    Photo_profil bytea,
    ID_Type int NOT NULL,
    FOREIGN KEY (ID_Type) REFERENCES TypeUtilisateur(ID_Type)
);

CREATE TABLE Lieu (
    ID_Lieu integer PRIMARY KEY,
    Nom varchar(30) NOT NULL,
    Adresse varchar(100),
    Ville varchar(30) NOT NULL,
    Pays varchar(30) NOT NULL,
);

CREATE TABLE Groupe(
    ID_Groupe integer PRIMARY KEY,
    Nom varchar(30) NOT NULL,
    Descript varchar(200),
);

CREATE TABLE Concert(
    ID_Concert integer PRIMARY KEY,
    Nom varchar(30) NOT NULL,
    Dates DATE NOT NULL,
    Prix integer,
    Nbr_places integer NOT NULL,
    Cause varchar(30),
    BesoinVolontaires integer,
    EspacesExterieurs BOOLEAN,
    Enfants BOOLEAN,
    ID_Lieu FOREIGN KEY REFERENCES Lieu(ID_Lieu)
);