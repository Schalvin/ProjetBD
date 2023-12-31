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

