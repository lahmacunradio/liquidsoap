set("log.stdout", true)

playlist_my_show = playlist(id="playlist_my_show",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_my_show.m3u")
playlist_my_show = audio_to_stereo(id="stereo_playlist_my_show", playlist_my_show)

playlist_off_air = playlist(id="playlist_off_air",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_off_air.m3u")
playlist_off_air = audio_to_stereo(id="stereo_playlist_off_air", playlist_off_air)

# Jingle playlists
playlist_jingle_station_id = playlist(id="playlist_jingle_station_id",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_jingle_station_id.m3u")
playlist_jingle_station_id = audio_to_stereo(id="stereo_playlist_jingle_station_id", playlist_jingle_station_id)
playlist_jingle_station_id = drop_metadata(playlist_jingle_station_id)


off_air = fallback(id="playlist_off_air_safe", track_sensitive = false, [playlist_off_air, single(id="error_jingle", "/usr/local/share/icecast/web/error.mp3")])


def fade_out_transition(a,b)
	sequence(merge=true, [fade.out(duration=5., a),playlist_jingle_station_id,(b:source)])
end

radio = switch(track_sensitive=false, 
    transitions=[fade_out_transition,fade_out_transition],
    [({5w and 14h57m-14h58m or 14h59m-15h00m}, delay(60., playlist_my_show)),
    ({true}, off_air) ])    

output.icecast(%mp3, host="127.0.0.1", port=8000,
               password="testke", mount="radio.mp3", radio)
