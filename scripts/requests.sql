-- 1. Prochains concerts d'un groupe :
Select Distinct DateConcert
From LineUp NATURAL JOIN Groupe
    JOIN Concert ON (Concert.ID_Concert = LineUp.ID_Concert)
    WHERE NomG = 'Midnight Serenade';

-- 2. Les amis des amis d'un utilisateur :
Select Prenom, Nom_famille
From Amis AS Amis1 JOIN Amis AS Amis2 ON (Amis1.ID_Utilisateur2 = Amis2.ID_Utilisateur1)
    JOIN Utilisateur ON (Amis2.ID_Utilisateur2 = Utilisateur.ID_Utilisateur)
    WHERE Amis1.ID_Utilisateur1 = 39;

-- 3. Les Playlist vides :
Select NomP
From Playlist
WHERE not exists(
    Select *
    From ContenuPlaylist
    Where Playlist.ID_Playlist = ContenuPlaylist.ID_Playlist);

-- 4. Les avis sur les groupes contenant un mot precis :
Select NomG, Note, Commentaire, Pseudo
From (
    Select *
    From Avis
    Where ID_Groupe is not NULL) NATURAL JOIN Utilisateur
    NATURAL JOIN Groupe
WHERE Commentaire LIKE '%puissant%';

-- 5. Les organisateurs de concerts suivis par d'autres utilisateurs.
Select Pseudo, Libelle as TypeU
From Utilisateur NATURAL JOIN TypeUtilisateur
WHERE ID_Utilisateur in (
    Select ID_Suivi
    From Follows JOIN Organisateur on (ID_Suivi = ID_Utilisateur));

-- 6. La note moyenne d'un morceau de musique.
Select TitreM, AVG
FROM (
    SELECT ID_Morceau, AVG(Note)
    FROM Avis
    WHERE ID_Morceau is not NULL
    GROUP BY ID_Morceau
    HAVING ID_Morceau is not null) NATURAL JOIN Morceau
    ;

-- 7. Le nombre de morceau ayant un certain genre
Select Genre, COUNT
FROM (
    SELECT ID_Genre, COUNT(ID_Morceau)
    FROM MorceauGenre
    GROUP BY ID_Genre
    HAVING ID_Genre is not null) NATURAL JOIN Genre
ORDER BY COUNT DESC, Genre ASC;

-- 8. Durée d'un Album (somme des durées des morceaux de cet album) de la même manière avec playlist

-- 9. La moyenne de la durée d'une Playlist (deux agregats)

-- 10. Tous les morceaux avec leur note s'ils en ont (outer join)

-- 11. Toutes les chansons dont la note est superieure a la moyenne (condition de totalite sous requete correllee)

select département, nom, prénom
from employe E where salaire >= ALL (
select salaire
from employe
where department = E.departement);

-- 12. Toutes les chansons dont la note est superieure a la moyenne (avec agrégation)

select département, nom, prénom
from employe E where salaire >= ALL (
select salaire
from employe
where department = E.departement);

-- 13. Les villes dans lesquelles 