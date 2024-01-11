-- 1. Prochains concerts d'un groupe (3 tables):
Select Distinct DateConcert
From LineUp NATURAL JOIN Groupe
    JOIN Concert ON (Concert.ID_Concert = LineUp.ID_Concert)
    WHERE NomG = 'Midnight Serenade';

-- 2. Les amis des amis d'un utilisateur (jointure reflexive):
Select Prenom, Nom_famille
From Amis AS Amis1 JOIN Amis AS Amis2 ON (Amis1.ID_Utilisateur2 = Amis2.ID_Utilisateur1)
    JOIN Utilisateur ON (Amis2.ID_Utilisateur2 = Utilisateur.ID_Utilisateur)
    WHERE Amis1.ID_Utilisateur1 = 39;

-- 3. Les Playlist vides (sous requête corrélée):
Select NomP
From Playlist
WHERE not exists(
    Select *
    From ContenuPlaylist
    Where Playlist.ID_Playlist = ContenuPlaylist.ID_Playlist);

-- 4. Les avis sur les groupes contenant un mot precis (sous requête From):
Select NomG, Note, Commentaire, Pseudo
From (
    Select *
    From Avis
    Where ID_Groupe is not NULL) NATURAL JOIN Utilisateur
    NATURAL JOIN Groupe
WHERE Commentaire LIKE '%puissant%';

-- 5. Les organisateurs de concerts suivis par d'autres utilisateurs (Sous requête where).
Select Pseudo, Libelle as TypeU
From Utilisateur NATURAL JOIN TypeUtilisateur
WHERE ID_Utilisateur in (
    Select ID_Suivi
    From Follows JOIN Organisateur on (ID_Suivi = ID_Utilisateur));

-- 6. La note moyenne des morceau de musique.
Select TitreM, AVG
FROM (
    SELECT ID_Morceau, AVG(Note)
    FROM Avis
    WHERE ID_Morceau is not NULL
    GROUP BY ID_Morceau
    HAVING ID_Morceau is not null) NATURAL JOIN Morceau
    ;

-- 7. Le nombre de morceau ayant un certain genre (Groupby, having 1)
Select Genre, COUNT
FROM (
    SELECT ID_Genre, COUNT(ID_Morceau)
    FROM MorceauGenre
    GROUP BY ID_Genre
    HAVING COUNT(ID_Morceau)>4) NATURAL JOIN Genre
ORDER BY COUNT DESC, Genre ASC;

-- 8. Durée d'un Album (somme des durées des morceaux de cet album) de la même manière avec playlist (group by having 2)

Select TitreA, Sum/60 as Dureeminute
From Album NATURAL JOIN (
    Select ID_Album, Sum(Duree)
    FROM ContenuAlbum NATURAL JOIN Morceau
    GROUP BY ID_Album
    HAVING Sum(Duree)/60 > 100
)
ORDER BY Dureeminute DESC;

-- 9. La moyenne de la durée d'une Playlist (deux agregats)

Select AVG(Dureeminute)
From(
    Select NomP, Sum/60 as Dureeminute
    From Playlist NATURAL JOIN (
        Select ID_Playlist, Sum(Duree)
        FROM ContenuPlaylist NATURAL JOIN Morceau
        GROUP BY ID_Playlist
    ));

-- 10. Tous les morceaux avec leur note s'ils en ont (outer join)

Select TitreM, Note
From Morceau NATURAL LEFT JOIN Avis
WHERE TitreM LIKE 'Whistl%';


-- 11. Tous les lieux dans lesquels ont eu / vont avoir lieu plus d'un concert (condition de totalite sous requete correllee)

SELECT *
FROM Lieu
WHERE (
    SELECT COUNT(ID_Concert)
    FROM Concert
    WHERE Concert.ID_Lieu = Lieu.ID_Lieu
) > 1;

-- 12. La même requête (totalité avec agrégation)

SELECT NomL, Adresse, Ville, Pays
FROM Lieu NATURAL JOIN Concert
GROUP BY ID_Lieu
HAVING COUNT(ID_Concert) > 1;

-- 13. Les villes dans lesquelles 
-- les amis d'un utilisateur sont allés voir des concerts ce mois-ci

SELECT Distinct Ville
FROM Lieu NATURAL JOIN Concert NATURAL JOIN ParticipantInteresse
WHERE PI = 'P' AND EXTRACT(MONTH FROM to_date(DateConcert, 'DD/MM/YYYY')) = EXTRACT(MONTH FROM CURRENT_DATE) 
AND EXTRACT(YEAR FROM to_date(DateConcert, 'DD/MM/YYYY')) = EXTRACT(YEAR FROM CURRENT_DATE) 
AND ID_Utilisateur IN (
    Select ID_Utilisateur2 as ID_Utilisateur
    FROM Amis
    WHERE ID_Utilisateur1 = 66
);

-- 14. Top 10 des meilleurs morceaux sortis ce mois ci (view)
DROP VIEW Top10M;
CREATE VIEW Top10M AS 
(SELECT TitreM, Duree
FROM Morceau NATURAL JOIN Avis JOIN ContenuAlbum ON (Morceau.ID_Morceau = ContenuAlbum.ID_Morceau)
JOIN Album ON (ContenuAlbum.ID_Album = Album.ID_Album)
WHERE EXTRACT(MONTH FROM to_date(DateSortie, 'DD/MM/YYYY')) = EXTRACT(MONTH FROM CURRENT_DATE) 
AND EXTRACT(YEAR FROM to_date(DateSortie, 'DD/MM/YYYY')) = EXTRACT(YEAR FROM CURRENT_DATE)
ORDER BY Note Desc
LIMIT 10
);

-- 15 et 16. Requête renvoyant des resultats différents quand les tables contiennent des nulls
Select NomC, Ville, DateConcert
From Concert NATURAL JOIN Lieu;

Select NomC, NomL, DateConcert
From Concert NATURAL LEFT JOIN Lieu;

-- 17. : Classement des albums sortis ce mois

SELECT TitreA
FROM Album NATURAL JOIN Avis
WHERE EXTRACT(MONTH FROM to_date(DateSortie, 'DD/MM/YYYY')) = EXTRACT(MONTH FROM CURRENT_DATE) 
AND EXTRACT(YEAR FROM to_date(DateSortie, 'DD/MM/YYYY')) = EXTRACT(YEAR FROM CURRENT_DATE)
ORDER BY Note Desc;

-- 18. Tous les concerts qui ont comme tag 'punk'

Select NomC
From Concert NATURAL JOIN ConcertTag NATURAL JOIN Tag
WHERE Libelle = 'punk';

-- 19. Tous les concerts ayant lieu dans une même ville

SELECT NomC
FROM Concert NATURAL JOIN Lieu
WHERE Ville = 'Brooklyn';

-- 20. Le nombre de chaque utilisateur

SELECT Libelle, COUNT(Libelle)
FROM Utilisateur NATURAL JOIN TypeUtilisateur
GROUP BY Libelle;