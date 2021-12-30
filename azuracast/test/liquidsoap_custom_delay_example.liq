set("log.stdout", true)

playlist_my_show = playlist(id="playlist_my_show",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_my_show.m3u")
playlist_my_show = audio_to_stereo(id="stereo_playlist_my_show", playlist_my_show)

playlist_off_air = playlist(id="playlist_off_air",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_off_air.m3u")
playlist_off_air = audio_to_stereo(id="stereo_playlist_off_air", playlist_off_air)

# Jingle playlists
playlist_jingle_station_id = playlist(id="playlist_jingle_station_id",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_jingle_station_id.m3u")
playlist_jingle_station_id = audio_to_stereo(id="stereo_playlist_jingle_station_id", playlist_jingle_station_id)
playlist_jingle_station_id = drop_metadata(playlist_jingle_station_id)

live_enabled = ref(false)

def live_connected(header) =
    log("DJ Source connected! Infos: #{header}")
    live_enabled := true
end

def live_disconnected() = 
    log("DJ Source disconnected!")
    live_enabled := false
end 


live = input.harbor("live", port=8005, password="hackme",icy = true, icy_metadata_charset = "UTF-8", metadata_charset = "UTF-8",on_connect = live_connected, on_disconnect = live_disconnected, buffer = 5., max = 10.)
ignore(output.dummy(live, fallible=true))

radio = random(id="lahmacun_radio_standard_playlists", weights=[1], [playlist_off_air])
radio = fallback(id="lahmacun_radio_safe_fallback", track_sensitive = false, [radio, single(id="error_jingle", "/usr/local/share/icecast/web/error.mp3")])

radio = switch(track_sensitive=false, 
    [({!live_enabled}, live),
    ({1w and 12h07m-12h08m or 12h09m-12h10m}, delay(60., playlist_my_show)),
    ({true}, radio)])    

def fading_transition(a,b)
    #Example: play jingle after "my show" (set playlist ID as needed)
    if a.metadata["playlist_id"] == "667" then
        sequence([fade.out(a.source),playlist_jingle_station_id, fade.in(b.source)])
    else 
        sequence([fade.out(a.source),fade.in(b.source)])
    end
end

radio = cross(fading_transition, radio)

output.icecast(fallible=true, %mp3, host="127.0.0.1", port=8000,
               password="testke", mount="radio.mp3", radio)
