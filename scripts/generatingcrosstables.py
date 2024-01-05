import random
def generatecross(file, tablename1, tablename2, len1, len2, nrow, position = 0):
    filename = "data/" + file
    lista = []
    listab = []
    with open(filename, "w") as filoutcsv:
        filoutcsv.write(f"{tablename1},{tablename2}")
        if position > 0:
            filoutcsv.write(f", Position\n")
        else:
            filoutcsv.write(f"\n")
        for i in range(nrow):
            a = random.randint(1,len1)
            b = random.randint(1,len2)
            listab.append([a,b])
            lista.append(a)
            if (position == 0) and (listab.count([a,b]) == 1):
                filoutcsv.write(f"{a},{b}\n")
            elif (listab.count([a,b]) == 1) and lista.count(a) <= position:
                    filoutcsv.write(f"{a},{b},{random.randint(1,lista.count(a))}\n")

generatecross("ContenuAlbum.csv", "ID_Album", "ID_Morceau", 12, 50, 300, position = 10)
generatecross("ContenuPlaylist.csv", "ID_Playlist", "ID_Morceau", 20, 50, 300, position = 20)
generatecross("ArtisteAlbum.csv", "ID_Album", "ID_Groupe", 12, 10, 200, position = 2)
generatecross("GroupeTag.csv", "ID_Groupe", "ID_Tag", 10, 50, 30)
generatecross("MorceauTag.csv", "ID_Morceau", "ID_Tag", 50, 50, 200)
generatecross("PlaylistTag.csv", "ID_Playlist", "ID_Tag", 20, 50, 20)
generatecross("ConcertTag.csv", "ID_Concert", "ID_Tag", 10, 50, 20)
generatecross("LieuTag.csv", "ID_Lieu", "ID_Tag", 5, 50, 9)
generatecross("MorceauGenre.csv", "ID_Morceau", "ID_Genre", 50, 50, 100)
generatecross("GroupeGenre.csv", "ID_Groupe", "ID_Genre", 10, 50, 100)