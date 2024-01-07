TRUNCATE TABLE TypeUtilisateur, Utilisateur, Lieu, Genre, Groupe, Album, Morceau, Playlist, Concert, LineUp, 
Tag, Avis, Amis, Follows, Organisateur, ParticipantInteresse, ContenuAlbum, ContenuPlaylist,
ArtisteAlbum, GroupeTag, MorceauTag, PlaylistTag, ConcertTag, LieuTag,
GroupeGenre, MorceauGenre;

COPY TypeUtilisateur(ID_Type, Libelle)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/TypeUtilisateur.csv'
DELIMITER ','
CSV HEADER;

COPY Utilisateur(ID_Utilisateur, Prenom, Nom_famille, Pseudo, Date_naissance, Email, Mot_de_passe, Photo_profil, ID_Type)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/Utilisateur.csv'
DELIMITER ','
CSV HEADER;

COPY Lieu(ID_Lieu, NomL, Adresse, Ville, Pays)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/Lieu.csv'
DELIMITER ','
CSV HEADER;

COPY Concert(ID_Concert, NomC, DateConcert, Prix, Nbr_places, Cause, BesoinVolontaires, EspacesExterieurs, Enfants, ID_Lieu)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/Concert.csv'
DELIMITER ','
CSV HEADER;

COPY Groupe(ID_Groupe,NomG,Descript)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/Groupe.csv'
DELIMITER ','
CSV HEADER;

COPY Album(ID_Album, TitreA, DateSortie)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/Album.csv'
DELIMITER ','
CSV HEADER;

COPY Playlist(ID_Playlist, NomP, ID_Utilisateur)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/Playlist.csv'
DELIMITER ','
CSV HEADER;

COPY LineUp(ID_LineUp, ID_Concert, ID_Groupe, Position)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/LineUp.csv'
DELIMITER ','
CSV HEADER;

COPY Amis(ID_Utilisateur1, ID_Utilisateur2)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/Amis.csv'
DELIMITER ','
CSV HEADER;

COPY Morceau(ID_Morceau, TitreM, Duree)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/Morceau.csv'
DELIMITER ','
CSV HEADER;

COPY Avis(ID_Avis, Note, Commentaire, DatePost, ID_Utilisateur, ID_Concert, ID_Groupe, ID_LineUp, ID_Morceau, ID_Lieu)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/Avis.csv'
DELIMITER ','
CSV HEADER;

COPY Follows(ID_Suiveur, ID_Suivi)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/Follows.csv'
DELIMITER ','
CSV HEADER;

COPY Genre(ID_Genre,Genre)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/Genre.csv'
DELIMITER ','
CSV HEADER;

COPY Organisateur(ID_Utilisateur, ID_Concert)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/Organisateur.csv'
DELIMITER ','
CSV HEADER;

COPY ParticipantInteresse(ID_Utilisateur, ID_Concert, PI)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/ParticipeInteresse.csv'
DELIMITER ','
CSV HEADER;

COPY Tag(ID_Tag, Libelle)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/Tag.csv'
DELIMITER ','
CSV HEADER;

COPY ContenuAlbum(ID_Album, ID_Morceau, Position)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/ContenuAlbum.csv'
DELIMITER ','
CSV HEADER;

COPY ContenuPlaylist(ID_Playlist, ID_Morceau, Position)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/ContenuPlaylist.csv'
DELIMITER ','
CSV HEADER;

COPY ArtisteAlbum(ID_Album, ID_Groupe, Position)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/ArtisteAlbum.csv'
DELIMITER ','
CSV HEADER;

COPY GroupeTag(ID_Groupe, ID_Tag)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/GroupeTag.csv'
DELIMITER ','
CSV HEADER;

COPY MorceauTag(ID_Morceau, ID_Tag)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/MorceauTag.csv'
DELIMITER ','
CSV HEADER;

COPY PlaylistTag(ID_Playlist, ID_Tag)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/PlaylistTag.csv'
DELIMITER ','
CSV HEADER;

COPY ConcertTag(ID_Concert, ID_Tag)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/ConcertTag.csv'
DELIMITER ','
CSV HEADER;

COPY LieuTag(ID_Lieu, ID_Tag)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/LieuTag.csv'
DELIMITER ','
CSV HEADER;

COPY MorceauGenre(ID_Morceau, ID_Genre)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/MorceauGenre.csv'
DELIMITER ','
CSV HEADER;

COPY GroupeGenre(ID_Groupe, ID_Genre)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/GroupeGenre.csv'
DELIMITER ','
CSV HEADER;