DROP TABLE IF EXISTS TypeUtilisateur, Utilisateur, 
Lieu, Genre, Groupe, Album, Morceau, Playlist, Concert, LineUp, 
Tag, Avis, Amis, Follows, Organisateur, ParticipantInteresse, ContenuAlbum, ContenuPlaylist,
ArtisteAlbum, GroupeTag, MorceauTag, PlaylistTag, ConcertTag, LieuTag,
GroupeGenre, MorceauGenre CASCADE;

CREATE TABLE TypeUtilisateur(
    ID_Type integer PRIMARY KEY,
    Libelle varchar(30)
);

CREATE TABLE Utilisateur(
    ID_Utilisateur integer PRIMARY KEY,
    Prenom varchar(30) NOT NULL,
    Nom_famille varchar(30) NOT NULL,
    Pseudo varchar(30) NOT NULL,
    Date_naissance varchar(10) NOT NULL,
    Email varchar(30) NOT NULL,
    Mot_de_passe varchar(30) NOT NULL,
    Photo_profil varchar,
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
    DateSortie varchar(10) NOT NULL
);

CREATE TABLE Morceau(
    ID_Morceau integer PRIMARY KEY,
    Titre varchar(30) NOT NULL,
    Duree time
);

CREATE TABLE Playlist(
    ID_Playlist integer PRIMARY KEY,
    Nom varchar(30) NOT NULL,
    ID_Utilisateur integer,
    FOREIGN KEY (ID_Utilisateur) REFERENCES Utilisateur(ID_Utilisateur)
);

CREATE TABLE Concert(
    ID_Concert integer PRIMARY KEY,
    Nom varchar(30) NOT NULL,
    DateConcert varchar(10) NOT NULL,
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
    FOREIGN KEY (ID_Concert) REFERENCES Concert(ID_Concert),  
    FOREIGN KEY (ID_Groupe) REFERENCES Groupe(ID_Groupe)
);

CREATE TABLE Tag(
    ID_Tag integer PRIMARY KEY,
    Libelle varchar(30) NOT NULL
);

CREATE TABLE Avis(
    ID_Avis integer PRIMARY KEY,
    Note integer,
    Commentaire varchar(1200),
    DatePost varchar(10) NOT NULL,
    ID_Utilisateur integer NOT NULL,
    ID_Concert integer,
    ID_Groupe integer,
    ID_LineUp integer,
    ID_Playlist integer,
    ID_Lieu integer,

    FOREIGN KEY (ID_Utilisateur) REFERENCES Utilisateur(ID_Utilisateur), 
    FOREIGN KEY (ID_Concert) REFERENCES Concert(ID_Concert),  
    FOREIGN KEY (ID_Groupe) REFERENCES Groupe(ID_Groupe),
    FOREIGN KEY (ID_LineUp) REFERENCES LineUp(ID_LineUp),  
    FOREIGN KEY (ID_Playlist) REFERENCES Playlist(ID_Playlist),
    FOREIGN KEY (ID_Lieu) REFERENCES Lieu(ID_Lieu),
    CHECK (ID_Concert IS NOT NULL OR ID_Groupe IS NOT NULL OR 
    ID_Playlist IS NOT NULL OR ID_LineUp IS NOT NULL 
    OR ID_Lieu IS NOT NULL),
    CHECK (Note IS NOT NULL OR Commentaire IS NOT NULL),
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

CREATE TABLE Organisateur(
    ID_Utilisateur integer NOT NULL,
    ID_Concert integer NOT NULL,
    UNIQUE(ID_Utilisateur, ID_Concert),
    FOREIGN KEY (ID_Utilisateur) REFERENCES Utilisateur(ID_Utilisateur),  
    FOREIGN KEY (ID_Concert) REFERENCES Concert(ID_Concert)
);

CREATE TABLE ParticipantInteresse(
    ID_Utilisateur integer NOT NULL,
    ID_Concert integer NOT NULL,
    PI varchar(1),
    UNIQUE(ID_Utilisateur, ID_Concert),
    FOREIGN KEY (ID_Utilisateur) REFERENCES Utilisateur(ID_Utilisateur),  
    FOREIGN KEY (ID_Concert) REFERENCES Concert(ID_Concert),
    CHECK (PI LIKE 'P' OR PI LIKE 'I')
);

CREATE TABLE ContenuPlaylist(
    ID_Playlist integer NOT NULL,
    ID_Morceau integer NOT NULL,
    Position integer NOT NULL,
    UNIQUE(ID_Playlist, ID_Morceau, Position),
    FOREIGN KEY (ID_Playlist) REFERENCES Playlist(ID_Playlist),  
    FOREIGN KEY (ID_Morceau) REFERENCES Morceau(ID_Morceau),
    CHECK(Position < 21)
);

CREATE TABLE ContenuAlbum(
    ID_Album integer NOT NULL,
    ID_Morceau integer NOT NULL,
    Position integer NOT NULL,
    UNIQUE(ID_Album, ID_Morceau, Position),
    FOREIGN KEY (ID_Album) REFERENCES Album(ID_Album),  
    FOREIGN KEY (ID_Morceau) REFERENCES Morceau(ID_Morceau)
);

CREATE TABLE ArtisteAlbum(
    ID_Album integer NOT NULL,
    ID_Groupe integer NOT NULL,
    Position integer NOT NULL,
    UNIQUE(ID_Album, ID_Groupe, Position),
    FOREIGN KEY (ID_Album) REFERENCES Album(ID_Album),  
    FOREIGN KEY (ID_Groupe) REFERENCES Groupe(ID_Groupe)
);

CREATE TABLE GroupeTag(
    ID_Groupe integer NOT NULL,
    ID_Tag integer NOT NULL,
    UNIQUE(ID_Tag, ID_Groupe),
    FOREIGN KEY (ID_Tag) REFERENCES Tag(ID_Tag),  
    FOREIGN KEY (ID_Groupe) REFERENCES Groupe(ID_Groupe)
);

CREATE TABLE MorceauTag(
    ID_Morceau integer NOT NULL,
    ID_Tag integer NOT NULL,
    UNIQUE(ID_Tag, ID_Morceau),
    FOREIGN KEY (ID_Tag) REFERENCES Tag(ID_Tag),  
    FOREIGN KEY (ID_Morceau) REFERENCES Morceau(ID_Morceau)
);

CREATE TABLE PlaylistTag(
    ID_Playlist integer NOT NULL,
    ID_Tag integer NOT NULL,
    UNIQUE(ID_Tag, ID_Playlist),
    FOREIGN KEY (ID_Tag) REFERENCES Tag(ID_Tag),  
    FOREIGN KEY (ID_Playlist) REFERENCES Playlist(ID_Playlist)
);

CREATE TABLE ConcertTag(
    ID_Concert integer NOT NULL,
    ID_Tag integer NOT NULL,
    UNIQUE(ID_Tag, ID_Concert),
    FOREIGN KEY (ID_Tag) REFERENCES Tag(ID_Tag),  
    FOREIGN KEY (ID_Concert) REFERENCES Concert(ID_Concert)
);

CREATE TABLE LieuTag(
    ID_Lieu integer NOT NULL,
    ID_Tag integer NOT NULL,
    UNIQUE(ID_Lieu, ID_Tag),
    FOREIGN KEY (ID_Lieu) REFERENCES Lieu(ID_Lieu),  
    FOREIGN KEY (ID_Tag) REFERENCES Tag(ID_Tag)
);

CREATE TABLE MorceauGenre(
    ID_Morceau integer NOT NULL,
    ID_Genre integer NOT NULL,
    UNIQUE(ID_Morceau, ID_Genre),
    FOREIGN KEY (ID_Morceau) REFERENCES Morceau(ID_Morceau),  
    FOREIGN KEY (ID_Genre) REFERENCES Genre(ID_Genre)
);

CREATE TABLE GroupeGenre(
    ID_Groupe integer NOT NULL,
    ID_Genre integer NOT NULL,
    UNIQUE(ID_Groupe, ID_Genre),
    FOREIGN KEY (ID_Groupe) REFERENCES Groupe(ID_Groupe),  
    FOREIGN KEY (ID_Genre) REFERENCES Genre(ID_Genre)
);

