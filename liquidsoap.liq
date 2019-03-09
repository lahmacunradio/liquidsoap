# Fade out off air music, play jingle, start playing show
def transition_into_show(j,a,b)
  add(normalize=false,
	  [ sequence([fade.final(a),j,b]) ])
end

# Stop show (not fade out), play jingle, fade in off air music
def transition_into_off(j,a,b)
  add(normalize=false,
	  [ sequence([fade.final(a),j,fade.initial(b)]) ])
end


radio = switch(track_sensitive=false, transitions=[ 
    transition_into_show(playlist_jingle),transition_into_show(playlist_jingle),transition_into_show(playlist_jingle),transition_into_show(playlist_jingle),transition_into_show(playlist_jingle),transition_into_show(playlist_jingle),transition_into_show(playlist_jingle),transition_into_show(playlist_jingle),transition_into_show(playlist_jingle),transition_into_show(playlist_jingle),transition_into_show(playlist_jingle),transition_into_show(playlist_jingle),transition_into_show(playlist_jingle), transition_into_show(playlist_jingle),transition_into_show(playlist_jingle),transition_into_show(playlist_jingle),transition_into_show(playlist_jingle),
    transition_into_off(playlist_jingle) ], [ 
    #Monday
    ({1w and 17h-18h}, once(playlist_szmti_csrba)),  
    ({1w and 18h-19h}, once(playlist_kezek_a_sebekben)),  
    ({1w and 19h-21h}, once(playlist_earth_oddities__erdenklang)),  
    #Tuesday
    ({2w and 12h-13h30m}, once(playlist_csinltam_neked_egy_vlogats_kazettt)),  
    ({2w and 17h-19h}, once(playlist_mmn_radio)),  
    ({2w and 20h-21h}, once(playlist_turmeric_acid)),  
    #Wednesday
    ({3w and 17h-18h}, once(playlist_wikihow_adventure_cruise)),  
    ({3w and 18h-19h}, once(playlist_geigercounterculture)),  
    #Thursday
    ({4w and 16h-18h}, once(playlist_lazy_calm_raga)),  
    ({4w and 18h-19h}, once(playlist_mt)),  
    ({4w and 20h-22h}, once(playlist_great_galactic_ghoul)),  
    #Friday
    ({5w and 17h-18h}, once(playlist_agybaj)),  
    ({5w and 18h-20h}, once(playlist_mkd_mkd)),  
    #Saturday
    ({6w and 17h-19h}, once(playlist_rnr666_radioshow)),  
    #Sunday
    ({7w and 11h-13h}, once(playlist_bambuszrdi)),  
    ({7w and 13h-17h}, once(playlist_donald_kacsa_klub)),  
    ({7w and 19h-20h}, once(playlist_sub_burek)),  
    ({true}, radio) ])