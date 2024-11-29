# Comments can complicate readability since most lines are self-explanatory


#! --- Initialize Dictionarys ---

artists = {                 # artist and corresponding genre
    "Bronson": "House", 
    "Daft Punk": "Synth", 
    "Maur": "Dance",
    "Two Door Cinema Club": "Indie"
}

playlist = {                # song and corresponding artist   ( utilizes other dictionary for artist value)
    "Bline": "Bronson", 
    "Tense(Live)": "Bronson", 
    "Deep Inside": "Maur", 
    "What you know": "Two Door Cinema Club", 
    "End of Line": "Daft Punk"
}







#! --- Functions ---


#*  Adding a song
def add_song(title_, artist_, genre_):      # will generate new if not already in dictionary
    artists[artist_] = genre_               # make sure artist is in the artist dictionary (with genre)
    playlist[title_] = artist_              # make sure song title is in the playlist dictionary (with set value to artist)
    print(f"{title_} - added song")


#*  View Songs
def view_playlist():
    print(" Data:")

    for song_ in playlist:
        print(f"  {song_} - by {playlist[song_]} - from the {artists[playlist[song_]]} genre")
    
    print(" ")


#*  Update Songs                            # add_song and update_song were basicaly the same, as if a song isnt found it is added, so i made it not able to generate new
def update_song(songTitle_, newArtist_, newGenre_):
    try:
        item = playlist[songTitle_]
        artists[newArtist_] = newGenre_         # make sure artist is in the artist dictionary (with genre), makes new if not found
        playlist[songTitle_] = newArtist_       # set song title in the playlist dictionary (with set value to artist)
        print(f"{item} - song updated")
    except Exception as e:
        print(">>> Couldn't find Song to update -> " + songTitle_ )
    


#*  Remove Song
def delete_song(songTitle_):
    try:
        item = playlist.pop(songTitle_)
        print(f"{item} - removed song")
    except Exception:
        print(">>> Couldn't find Song to remove -> " + songTitle_)
    





#! --- Executables ---
print(" ###----- Start -----###")

view_playlist()


update_song("ShapeOfYou", "Odesza", "Electric")         #? should return not found as song isnt in dictionary (its an example)
add_song("Bline_NewVersion", "Odesza", "Electric")
update_song("Bline", "Odesza", "House/Electric")        # will also update artists genre
delete_song("Deep Inside")


view_playlist()


print(" ----------")

