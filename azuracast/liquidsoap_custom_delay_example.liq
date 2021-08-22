set("log.stdout", true)

playlist_my_show = playlist(id="playlist_my_show",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_my_show.m3u")
playlist_my_show = audio_to_stereo(id="stereo_playlist_my_show", playlist_my_show)

playlist_off_air = playlist(id="playlist_off_air",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_off_air.m3u")
playlist_off_air = audio_to_stereo(id="stereo_playlist_off_air", playlist_off_air)

off_air = fallback(id="playlist_off_air_safe", track_sensitive = false, [playlist_off_air, single(id="error_jingle", "/usr/local/share/icecast/web/error.mp3")])

radio = switch(track_sensitive=false,
    [({2w and 8h37m-8h38m or 8h39m-8h40m}, delay(60., playlist_my_show)),
    ({true}, off_air) ])

output.harbor(%mp3, mount="my-radio.mp3", radio)

