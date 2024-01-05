set datestyle to [dd/mm/yyyy];
TRUNCATE TABLE TypeUtilisateur, Utilisateur, 
Lieu, Genre, Groupe, Album, Morceau, Playlist, Concert, LineUp, 
Tag, Avis, Amis, Follows, Organisateur, Participant, Interesse, ContenuAlbum, ContenuPlaylist,
ArtisteAlbum, GroupeTag, MorceauTag, PlaylistTag, ConcertTag, LieuTag,
GroupeGenre, MorceauGenre
COPY TypeUtilisateur(ID_Type, Libelle)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/TypeUtilisateur.csv'
DELIMITER ','
CSV HEADER;

COPY Album(ID_Album, Titre, DateSortie)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/Album.csv'
DELIMITER ','
CSV HEADER;

COPY Morceau(ID_Morceau, Titre, Duree)
FROM '/Users/Siann/Desktop/bur/bureau/etudes/M1S1/BD/ProjetBD/data/Morceau.csv'
DELIMITER ','
CSV HEADER;