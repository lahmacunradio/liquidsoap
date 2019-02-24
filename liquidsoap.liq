# Fade out off air music, play jingle, start playing show
def transition_into_show(j,a,b)
  add(normalize=false,
	  [ sequence([fade.final(a),j,b]) ])
end

# Stop show (not fade out), play jingle, fade in off air music
def transition_into_off(j,a,b)
  add(normalize=false,
	  [ sequence([a,j,fade.initial(b)]) ])
end


radio = switch(track_sensitive=false, transitions=[ 
    transition_into_show(playlist_jingle),transition_into_show(playlist_jingle),
    transition_into_off(playlist_jingle) ], [ 
    # Plays one song from show playlist (assumes one song)    
    ({7w and 14h14m-14h15m}, once(playlist_wikihow)),
    # Plays all songs from show playlist exactly once    
    ({7w and 14h025m-15h}, playlist.once("/var/azuracast/stations/boerek/playlists/playlist_wikihow.m3u")), 
    ({true}, radio) ])

