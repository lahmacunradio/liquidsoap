set("log.stdout", true)

playlist_my_show = playlist(id="playlist_my_show",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_my_show.m3u")
playlist_my_show = audio_to_stereo(id="stereo_playlist_my_show", playlist_my_show)

playlist_off_air = playlist(id="playlist_off_air",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_off_air.m3u")
playlist_off_air = audio_to_stereo(id="stereo_playlist_off_air", playlist_off_air)

off_air = fallback(id="playlist_off_air_safe", track_sensitive = false, [playlist_off_air, single(id="error_jingle", "/usr/local/share/icecast/web/error.mp3")])

radio = switch(track_sensitive=false,
    [({6w and 7h30m-7h31m or 7h33m-7h34m}, delay(60., playlist_my_show)),
    ({true}, off_air) ])

output.icecast(%mp3, host="127.0.0.1", port=8000,
               password="testke", mount="radio.mp3", radio)
