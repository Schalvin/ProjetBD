DROP TABLE TypeUtilisateur, Utilisateurs, Lieu, Genre, Groupe, Album, Morceau, Playlist, Concert, LineUp, 
Tag, Avis, Amis, Follows CASCADE;

CREATE TABLE TypeUtilisateur(
    ID_Type integer PRIMARY KEY,
    Libelle varchar(30)
);

CREATE TABLE Utilisateurs(
    ID_Utilisateur integer PRIMARY KEY,
    Prenom varchar(30) NOT NULL,
    Nom_famille varchar(30) NOT NULL,
    Pseudo varchar(30) NOT NULL,
    Date_naissance DATE NOT NULL,
    Email varchar(30) NOT NULL,
    Mot_de_passe varchar(30) NOT NULL,
    --Photo_profil bytea,
    ID_Type int NOT NULL,
    FOREIGN KEY (ID_Type) REFERENCES TypeUtilisateur(ID_Type)
);

CREATE TABLE Lieu (
    ID_Lieu integer PRIMARY KEY,
    Nom varchar(30) NOT NULL,
    Adresse varchar(100),
    Ville varchar(30) NOT NULL,
    Pays varchar(30) NOT NULL
);

CREATE TABLE Genre(
    ID_Genre integer PRIMARY KEY,
    Genre varchar(30) NOT NULL
);

CREATE TABLE Groupe(
    ID_Groupe integer PRIMARY KEY,
    Nom varchar(30) NOT NULL,
    Descript varchar(200)
);

CREATE TABLE Album(
    ID_Album integer PRIMARY KEY,
    Titre varchar(30) NOT NULL,
    DateSortie date NOT NULL,
    Duree time
);

CREATE TABLE Morceau(
    ID_Album integer PRIMARY KEY,
    Titre varchar(30) NOT NULL,
    Duree time
);

CREATE TABLE Playlist(
    ID_Playlist integer PRIMARY KEY,
    Nom varchar(30) NOT NULL,
    ID_Utilisateur integer,
    FOREIGN KEY (ID_Utilisateur) REFERENCES Utilisateurs(ID_Utilisateur)
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
    ID_Lieu integer, 
    FOREIGN KEY (ID_Lieu) REFERENCES Lieu(ID_Lieu)
);

CREATE TABLE LineUp(
    ID_LineUp integer PRIMARY KEY,
    ID_Concert integer,
    ID_Groupe integer,
    Position integer,
    UNIQUE(ID_Concert, ID_Groupe, Position),
    FOREIGN KEY ID_Concert REFERENCES Concert(ID_Concert),  
    FOREIGN KEY ID_Groupe REFERENCES Groupe(ID_Groupe)
);

CREATE TABLE Tag(
    ID_Tag integer PRIMARY KEY,
    Libelle varchar(30) NOT NULL
);

CREATE TABLE Avis(
    ID_Avis integer PRIMARY KEY,
    Note integer,
    Commentaire varchar(1200),
    DatePost Date NOT NULL,
    ID_Utilisateur integer NOT NULL,
    ID_Concert integer,
    ID_Groupe integer,
    ID_LineUp integer
    ID_Playlist integer,
    ID_Lieu integer

    FOREIGN KEY ID_Utilisateur REFERENCES Utilisateur(ID_Utilisateur) 
    FOREIGN KEY ID_Concert REFERENCES Concert(ID_Concert),  
    FOREIGN KEY ID_Groupe REFERENCES Groupe(ID_Groupe),
    FOREIGN KEY ID_LineUp REFERENCES LineUp(ID_LineUp),  
    FOREIGN KEY ID_Playlist REFERENCES Playlist(ID_Playlist),
    FOREIGN KEY ID_Lieu REFERENCES Lieu(ID_Lieu)
    CHECK (ID_Concert IS NOT NULL OR ID_Groupe IS NOT NULL OR 
    ID_Playlist IS NOT NULL OR ID_LineUp IS NOT NULL 
    OR ID_Lieu IS NOT NULL)
    CHECK (Note IS NOT NULL OR Commentaire IS NOT NULL)
    CHECK (Note BETWEEN 0 AND 5)
);

CREATE TABLE Amis(
    ID_Utilisateur1 integer NOT NULL,
    ID_Utilisateur2 integer NOT NULL,
    UNIQUE(ID_Utilisateur1, ID_Utilisateur2),
    FOREIGN KEY (ID_Utilisateur1) REFERENCES Utilisateur(ID_Utilisateur),  
    FOREIGN KEY (ID_Utilisateur2) REFERENCES Utilisateur(ID_Utilisateur)
);

CREATE TABLE Follows(
    ID_Suiveur integer NOT NULL,
    ID_Suivi integer NOT NULL,
    UNIQUE(ID_Suiveur, ID_Suivi),
    FOREIGN KEY (ID_Suiveur) REFERENCES Utilisateur(ID_Utilisateur),  
    FOREIGN KEY (ID_Suivi) REFERENCES Utilisateur(ID_Utilisateur)
);