-- 1. Prochains concerts d'un groupe :
Select DateConcert
From Concert NATURAL JOIN LineUp NATURAL JOIN Groupe
WHERE ID_Groupe = 1