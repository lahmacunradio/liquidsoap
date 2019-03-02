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
    transition_into_show(playlist_jingle),transition_into_show(playlist_jingle),transition_into_show(playlist_jingle), transition_into_off(playlist_jingle) ], [ 
    # Plays one song from show playlist (assumes one song), song will be interrupted if time too short!    
    ({5w and 20h39m-21h39m}, playlist_mmn_radio),
    # Plays one song from show playlist (assumes one song), song will NOT be interrupted even outside time range!    
    ({6w and 21h30m-22h30m}, once(playlist_wikihow_adventure_cruise)),  
    # Plays all songs from show playlist exactly once    
    ({7w and 14h25m-15h}, playlist.once("/var/azuracast/stations/boerek/playlists/playlist_wikihow_adventure_cruise.m3u")), 
    ({true}, radio) ])

