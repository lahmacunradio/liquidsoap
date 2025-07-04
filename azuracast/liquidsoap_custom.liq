# WARNING! This file is automatically generated by AzuraCast.
# Do not update it directly!

init.daemon.set(false)
init.daemon.pidfile.path.set("/var/azuracast/stations/lahmacun_radio/config/liquidsoap.pid")

log.stdout.set(true)
log.file.set(false)

settings.server.log.level.set(10)

settings.server.socket.set(true)
settings.server.socket.permissions.set(0o660)
settings.server.socket.path.set("/var/azuracast/stations/lahmacun_radio/config/liquidsoap.sock")

settings.harbor.bind_addrs.set(["0.0.0.0"])

settings.tag.encodings.set(["UTF-8","ISO-8859-1"])
settings.encoder.metadata.export.set(["artist","title","album","song"])

setenv("TZ", "CET")

autodj_is_loading = ref(true)
ignore(autodj_is_loading)

autodj_ping_attempts = ref(0)
ignore(autodj_ping_attempts)

# Track live-enabled status.
live_enabled = ref(false)
ignore(live_enabled)

# Track live transition for crossfades.
to_live = ref(false)
ignore(to_live)

azuracast_api_url = "http://127.0.0.1:6010/api/internal/1/liquidsoap"
azuracast_api_key = "AZURA_KEY"

def azuracast_api_call(~timeout_ms=2000, url, payload) =
    full_url = "#{azuracast_api_url}/#{url}"

    log("API #{url} - Sending POST request to '#{full_url}' with body: #{payload}")
    try
        response = http.post(full_url,
            headers=[
                ("Content-Type", "application/json"),
                ("User-Agent", "Liquidsoap AzuraCast"),
                ("X-Liquidsoap-Api-Key", "#{azuracast_api_key}")
            ],
            timeout_ms=timeout_ms,
            data=payload
        )

        log("API #{url} - Response (#{response.status_code}): #{response}")
        "#{response}"
    catch err do
        log("API #{url} - Error: #{error.kind(err)} - #{error.message(err)}")
        "false"
    end
end

station_media_dir = "/var/azuracast/stations/lahmacun_radio/media"
def azuracast_media_protocol(~rlog=_,~maxtime=_,arg) =
    ["#{station_media_dir}/#{arg}"]
end

add_protocol(
    "media",
    azuracast_media_protocol,
    doc="Pull files from AzuraCast media directory.",
    syntax="media:uri"
)

#OFF AIR playlists
playlist_off_air = playlist(id="playlist_off_air",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_off_air.m3u")
playlist_off_air = cue_cut(id="cue_playlist_off_air", playlist_off_air)

playlist_off_air_ambient = playlist(id="playlist_off_air_ambient",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_off_air_ambient.m3u")
playlist_off_air_ambient = cue_cut(id="cue_playlist_off_air_ambient", playlist_off_air_ambient)

#Jingle playlists
playlist_jingle_station_id = playlist(id="playlist_jingle_station_id",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_jingle_station_id.m3u")
playlist_jingle_station_id = cue_cut(id="cue_playlist_jingle_station_id", playlist_jingle_station_id)
playlist_jingle_station_id = drop_metadata(playlist_jingle_station_id)

playlist_jingle_donate = playlist(id="playlist_jingle_donate",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_jingle_donate.m3u")
playlist_jingle_donate = cue_cut(id="cue_playlist_jingle_donate", playlist_jingle_donate)

#Show playlists
playlist_sub_burek = playlist(id="playlist_sub_burek",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_sub_burek.m3u")
playlist_sub_burek = cue_cut(id="cue_playlist_sub_burek", playlist_sub_burek)

playlist_mmn_radio = playlist(id="playlist_mmn_radio",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_mmn_radio.m3u")
playlist_mmn_radio = cue_cut(id="cue_playlist_mmn_radio", playlist_mmn_radio)

playlist_rnr666 = playlist(id="playlist_rnr666",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_rnr666.m3u")
playlist_rnr666 = cue_cut(id="cue_playlist_rnr666", playlist_rnr666)

playlist_lazy_calm_raga = playlist(id="playlist_lazy_calm_raga",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_lazy_calm_raga.m3u")
playlist_lazy_calm_raga = cue_cut(id="cue_playlist_lazy_calm_raga", playlist_lazy_calm_raga)

playlist_szmuti_csorba = playlist(id="playlist_szmuti_csorba",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_szmuti_csorba.m3u")
playlist_szmuti_csorba = cue_cut(id="cue_playlist_szmuti_csorba", playlist_szmuti_csorba)

playlist_schmerz = playlist(id="playlist_schmerz",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_schmerz.m3u")
playlist_schmerz = cue_cut(id="cue_playlist_schmerz", playlist_schmerz)

playlist_erdenklang = playlist(id="playlist_erdenklang",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_erdenklang.m3u")
playlist_erdenklang = cue_cut(id="cue_playlist_erdenklang", playlist_erdenklang)

playlist_donald_kacsa_klub = playlist(id="playlist_donald_kacsa_klub",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_donald_kacsa_klub.m3u")
playlist_donald_kacsa_klub = cue_cut(id="cue_playlist_donald_kacsa_klub", playlist_donald_kacsa_klub)

playlist_turmeric_acid = playlist(id="playlist_turmeric_acid",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_turmeric_acid.m3u")
playlist_turmeric_acid = cue_cut(id="cue_playlist_turmeric_acid", playlist_turmeric_acid)

playlist_erto_hallgatas = playlist(id="playlist_erto_hallgatas",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_erto_hallgatas.m3u")
playlist_erto_hallgatas = cue_cut(id="cue_playlist_erto_hallgatas", playlist_erto_hallgatas)

playlist_mood_sequence = playlist(id="playlist_mood_sequence",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_mood_sequence.m3u")
playlist_mood_sequence = cue_cut(id="cue_playlist_mood_sequence", playlist_mood_sequence)

playlist_havizaj = playlist(id="playlist_havizaj",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_havizaj.m3u")
playlist_havizaj = cue_cut(id="cue_playlist_havizaj", playlist_havizaj)

playlist_dalmata_gergo_show = playlist(id="playlist_dalmata_gergo_show",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_dalmata_gergo_show.m3u")
playlist_dalmata_gergo_show = cue_cut(id="cue_playlist_dalmata_gergo_show", playlist_dalmata_gergo_show)

playlist_d23 = playlist(id="playlist_d23",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_d23.m3u")
playlist_d23 = cue_cut(id="cue_playlist_d23", playlist_d23)

playlist_transverszia = playlist(id="playlist_transverszia",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_transverszia.m3u")
playlist_transverszia = cue_cut(id="cue_playlist_transverszia", playlist_transverszia)

playlist_infinite_scroll = playlist(id="playlist_infinite_scroll",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_infinite_scroll.m3u")
playlist_infinite_scroll = cue_cut(id="cue_playlist_infinite_scroll", playlist_infinite_scroll)

playlist_torso = playlist(id="playlist_torso",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_torso.m3u")
playlist_torso = cue_cut(id="cue_playlist_torso", playlist_torso)

playlist_hetedik_tipusu_talalkozas = playlist(id="playlist_hetedik_tipusu_talalkozas",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_hetedik_tipusu_talalkozas.m3u")
playlist_hetedik_tipusu_talalkozas = cue_cut(id="cue_playlist_hetedik_tipusu_talalkozas", playlist_hetedik_tipusu_talalkozas)

playlist_boombap = playlist(id="playlist_boombap",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_boombap.m3u")
playlist_boombap = cue_cut(id="cue_playlist_boombap", playlist_boombap)

playlist_moneyka = playlist(id="playlist_moneyka",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_moneyka.m3u")
playlist_moneyka = cue_cut(id="cue_playlist_moneyka", playlist_moneyka)

playlist_fkse = playlist(id="playlist_fkse",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_fkse.m3u")
playlist_fkse = cue_cut(id="cue_playlist_fkse", playlist_fkse)

playlist_hatterzaj = playlist(id="playlist_hatterzaj",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_hatterzaj.m3u")
playlist_hatterzaj = cue_cut(id="cue_playlist_hatterzaj", playlist_hatterzaj)

playlist_paikka = playlist(id="playlist_paikka",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_paikka.m3u")
playlist_paikka = cue_cut(id="cue_playlist_paikka", playlist_paikka)

playlist_graveyard_slot = playlist(id="playlist_graveyard_slot",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_graveyard_slot.m3u")
playlist_graveyard_slot = cue_cut(id="cue_playlist_graveyard_slot", playlist_graveyard_slot)

playlist_geigercounterculture = playlist(id="playlist_geigercounterculture",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_geigercounterculture.m3u")
playlist_geigercounterculture = cue_cut(id="cue_playlist_geigercounterculture", playlist_geigercounterculture)

playlist_urmajmok = playlist(id="playlist_urmajmok",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_urmajmok.m3u")
playlist_urmajmok = cue_cut(id="cue_playlist_urmajmok", playlist_urmajmok)

playlist_cleptorama = playlist(id="playlist_cleptorama",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_cleptorama.m3u")
playlist_cleptorama = cue_cut(id="cue_playlist_cleptorama", playlist_cleptorama)

playlist_korunk = playlist(id="playlist_korunk",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_korunk.m3u")
playlist_korunk = cue_cut(id="cue_playlist_korunk", playlist_korunk)

playlist_btob = playlist(id="playlist_btob",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_btob.m3u")
playlist_btob = cue_cut(id="stereo_playlist_btob", playlist_btob)

playlist_temporary_nites = playlist(id="playlist_temporary_nites",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_temporary_nites.m3u")
playlist_temporary_nites = cue_cut(id="stereo_playlist_temporary_nites", playlist_temporary_nites)

playlist_random_times = playlist(id="playlist_random_times",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_random_times.m3u")
playlist_random_times = cue_cut(id="stereo_playlist_random_times", playlist_random_times)

playlist_aa_radio = playlist(id="playlist_aa_radio",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_aa_radio.m3u")
playlist_aa_radio = cue_cut(id="cue_playlist_aa_radio", playlist_aa_radio)

playlist_superstar = playlist(id="playlist_superstar",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_superstar.m3u")
playlist_superstar = cue_cut(id="cue_playlist_superstar", playlist_superstar)

playlist_ganzfeld = playlist(id="playlist_ganzfeld",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_ganzfeld.m3u")
playlist_ganzfeld = cue_cut(id="cue_playlist_ganzfeld", playlist_ganzfeld)

playlist_diszko_tonik = playlist(id="playlist_diszko_tonik",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_diszko_tonik.m3u")
playlist_diszko_tonik = cue_cut(id="cue_playlist_diszko_tonik", playlist_diszko_tonik)

playlist_fulbevalo = playlist(id="playlist_fulbevalo",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_fulbevalo.m3u")
playlist_fulbevalo = cue_cut(id="playlist_fulbevalo", playlist_fulbevalo)

playlist_civil_waves = playlist(id="playlist_civil_waves",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_civil_waves.m3u")
playlist_civil_waves = cue_cut(id="playlist_civil_waves", playlist_civil_waves)

playlist_we_love_music = playlist(id="playlist_we_love_music",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_we_love_music.m3u")
playlist_we_love_music = cue_cut(id="cue_playlist_we_love_music", playlist_we_love_music)

playlist_truno_tapes = playlist(id="playlist_truno_tapes",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_truno_tapes.m3u")
playlist_truno_tapes = cue_cut(id="cue_playlist_truno_tapes", playlist_truno_tapes)

playlist_sunday_morgen = playlist(id="playlist_sunday_morgen",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_sunday_morgen.m3u")
playlist_sunday_morgen = cue_cut(id="cue_playlist_sunday_morgen", playlist_sunday_morgen)

playlist_esforditva = playlist(id="playlist_esforditva",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_esforditva.m3u")
playlist_esforditva = cue_cut(id="cue_playlist_esforditva", playlist_esforditva)

playlist_blr = playlist(id="playlist_blr",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_blr.m3u")
playlist_blr = cue_cut(id="cue_playlist_blr", playlist_blr)

playlist_punctum = playlist(id="playlist_punctum",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_punctum.m3u")
playlist_punctum = cue_cut(id="cue_playlist_punctum", playlist_punctum)

playlist_mementomori = playlist(id="playlist_mementomori",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_mementomori.m3u")
playlist_mementomori = cue_cut(id="cue_playlist_mementomori", playlist_mementomori)

playlist_madein = playlist(id="playlist_madein",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_madein.m3u")
playlist_madein = cue_cut(id="cue_playlist_madein", playlist_madein)

playlist_nagyot_utott_irodalom = playlist(id="playlist_nagyot_utott_irodalom",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_nagyot_utott_irodalom.m3u")
playlist_nagyot_utott_irodalom = cue_cut(id="cue_playlist_nagyot_utott_irodalom", playlist_nagyot_utott_irodalom)

playlist_kisszoba = playlist(id="playlist_kisszoba",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_kisszoba.m3u")
playlist_kisszoba = cue_cut(id="cue_playlist_kisszoba", playlist_kisszoba)

playlist_perspectives = playlist(id="playlist_perspectives",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_perspectives.m3u")
playlist_perspectives = cue_cut(id="cue_playlist_perspectives", playlist_perspectives)

playlist_stepbystep = playlist(id="playlist_stepbystep",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_stepbystep.m3u")
playlist_stepbystep = cue_cut(id="cue_playlist_stepbystep", playlist_stepbystep)

playlist_lehetosegek_tere = playlist(id="playlist_lehetosegek_tere",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_lehetosegek_tere.m3u")
playlist_lehetosegek_tere = cue_cut(id="cue_playlist_lehetosegek_tere", playlist_lehetosegek_tere)

playlist_tekerveny = playlist(id="playlist_tekerveny",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_tekerveny.m3u")
playlist_tekerveny = cue_cut(id="cue_playlist_tekerveny", playlist_tekerveny)

#Shared show slots
playlist_ritka_csut = playlist(id="playlist_ritka_csut",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_ritka_csut.m3u")
playlist_ritka_csut = cue_cut(id="cue_playlist_ritka_csut", playlist_ritka_csut)

playlist_ritka_pentek = playlist(id="playlist_ritka_pentek",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_ritka_pentek.m3u")
playlist_ritka_pentek = cue_cut(id="cue_playlist_ritka_pentek", playlist_ritka_pentek)

#Lahmacun-own shows
playlist_lahmaloudclouds = playlist(id="playlist_lahmaloudclouds",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_lahmaloudclouds.m3u")
playlist_lahmaloudclouds = cue_cut(id="cue_playlist_lahmaloudclouds", playlist_lahmaloudclouds)

playlist_lahmacun_presents = playlist(id="playlist_lahmacun_presents",mime_type="audio/x-mpegurl",mode="randomize",reload_mode="watch","/var/azuracast/stations/lahmacun_radio/playlists/playlist_lahmacun_presents.m3u")
playlist_lahmacun_presents = cue_cut(id="cue_playlist_lahmacun_presents", playlist_lahmacun_presents)

#External streams
#Example - REPLACE URL AND RENAME SOURCE NAME AS NEEDED AND ADD IT TO SCHEDULE (SEE BELOW IN THE MAIN SWITCH OPERATOR)
#external_cashmere = mksafe(buffer(buffer=5., input.http("https://cashmereradio.out.airtime.pro/cashmereradio_b")))

# DJ Authentication
last_authenticated_dj = ref("")
live_dj = ref("")

def dj_auth(login) =
    auth_info =
        if (login.user == "source" or login.user == "") and (string.match(pattern="(:|,)+", login.password)) then
            auth_string = string.split(separator="(:|,)", login.password)
            {user = list.nth(default="", auth_string, 0),
            password = list.nth(default="", auth_string, 2)}
        else
            {user = login.user, password = login.password}
        end

    response = azuracast_api_call(
        timeout_ms=5000,
        "auth",
        json.stringify(auth_info)
    )

    if (response == "true") then
        last_authenticated_dj := auth_info.user
        true
    else
        false
    end
end

def live_connected(header) =
    dj = !last_authenticated_dj
    log("DJ Source connected! Last authenticated DJ: #{dj} - #{header}")

    live_enabled := true
    live_dj := dj

    _ = azuracast_api_call(
        timeout_ms=5000,
        "djon",
        json.stringify({user = dj})
    )
end

def live_disconnected() =
    _ = azuracast_api_call(
        timeout_ms=5000,
        "djoff",
        json.stringify({user = !live_dj})
    )

    live_enabled := false
    live_dj := ""
end

# Live Broadcasting
live = input.harbor("/", id = "input_streamer", port = 8005, auth = dj_auth, icy = true, icy_metadata_charset = "UTF-8", metadata_charset = "UTF-8", on_connect = live_connected, on_disconnect = live_disconnected, buffer = 12.00, max = 15.00)

def insert_missing(m) =
    if m == [] then
        [("title", "Live Broadcast"), ("is_live", "true")]
    else
        [("is_live", "true")]
    end
end
live = map_metadata(insert_missing, live)

sources = [
    ({!live_enabled}, live),    #Live DJ
    ({1w and 08h-09h58m}, once(playlist_nagyot_utott_irodalom)),               # Monday
    ({1w and 11h11m-12h9m}, once(playlist_transverszia)),
    ({1w and 14h-15h28m}, once(playlist_korunk)),
    ({1w and 16h-16h58m}, once(playlist_szmuti_csorba)),
    ({1w and 17h-17h58m}, once(playlist_paikka)),
    ({1w and 18h-18h58m}, once(playlist_fulbevalo)),
    ({1w and 19h-20h58m}, once(playlist_mementomori)),
    ({1w and 21h-21h58m}, once(playlist_urmajmok)),
    ({1w and 22h-22h58m}, once(playlist_punctum)),
    ({1w and 16h30m-22h30m}, playlist_off_air_ambient),                 #ambient: szmuti - Punctum
    ({2w and 12h-13h58m}, once(playlist_lahmaloudclouds)),              # Tuesday
    ({2w and 15h30m-17h30m}, once(playlist_diszko_tonik)),
    ({2w and 18h-18h58m}, once(playlist_mmn_radio)),
    ({2w and 20h-20h58m}, once(playlist_havizaj)),
    ({2w and 21h-21h58m}, once(playlist_turmeric_acid)),
    ({2w and 22h-23h28m}, once(playlist_we_love_music)),
    ({2w and 20h30m-23h00m}, playlist_off_air_ambient),                 #ambient: havizaj - We Love Music
    ({3w and 11h-11h58m}, once(playlist_perspectives)),                 #Wednesday
    ({3w and 12h-13h58m}, once(playlist_lahmacun_presents)),
    ({3w and 15h-15h58m}, once(playlist_erto_hallgatas)),
    ({3w and 16h-16h58m}, once(playlist_erdenklang)),
    ({3w and 17h-17h58m}, once(playlist_cleptorama)),
    ({3w and 18h-18h58m}, once(playlist_temporary_nites)),
    ({3w and 19h-19h58m}, once(playlist_tekerveny)),
    ({3w and 20h-21h58m}, once(playlist_madein)),
    ({3w and 15h30m-21h30m}, playlist_off_air_ambient),                 #ambient: eh - Made In
    ({4w and 9h-11h}, once(playlist_civil_waves)),                      #Thursday
    ({4w and 11h-11h58m}, once(playlist_lehetosegek_tere)),
    ({4w and 12h-13h58m}, once(playlist_ritka_csut)),
    ({4w and 15h-15h58m}, once(playlist_btob)),
    ({4w and 16h-16h58m}, once(playlist_fkse)),
    ({4w and 17h-18h58m}, once(playlist_lazy_calm_raga)),
    ({4w and 19h-20h28m}, once(playlist_dalmata_gergo_show)),
    ({4w and 15h30m-20h00m}, playlist_off_air_ambient),                 #ambient: btob - Dalmata Geri
    ({4w and 21h-22h58m}, once(playlist_schmerz)),
    ({5w and 12h-13h58m}, once(playlist_ritka_pentek)),                 #Friday
    ({5w and 15h-16h58m}, once(playlist_aa_radio)),
    ({5w and 17h-17h58m}, once(playlist_truno_tapes)),
    ({5w and 18h-19h28m}, once(playlist_graveyard_slot)),
    ({5w and 20h-20h58m}, once(playlist_moneyka)),
    ({5w and 21h-21h58m}, once(playlist_boombap)),
    ({5w and 22h-22h58m}, once(playlist_ganzfeld)),
    ({5w and 20h30m-22h30m}, playlist_off_air_ambient),                 #ambient: moneyka - Ganzfeld
    ({6w and 10h-11h58m}, once(playlist_superstar)),                       #Saturday
    ({6w and 12h-13h58m}, once(playlist_random_times)),
    ({6w and 14h-14h58m}, once(playlist_esforditva)),
    ({6w and 15h-17h58m}, once(playlist_torso)),
    ({6w and 18h-19h58m}, once(playlist_rnr666)),
    ({6w and 20h-21h58m}, once(playlist_mood_sequence)),
    ({6w and 22h-22h58m}, once(playlist_blr)),
    ({6w23h-7w00h28m}, once(playlist_d23)),
    ({6w10h30m-7w}, playlist_off_air_ambient),                    #ambient: superstar - D23
    ({7w and 11h-12h58m}, once(playlist_sunday_morgen)),                #Sunday
    ({7w and 13h-14h58m}, once(playlist_infinite_scroll)),
    ({7w and 15h-16h58m}, once(playlist_donald_kacsa_klub)),
    ({7w and 17h-17h58m}, once(playlist_geigercounterculture)),
    ({7w and 18h-18h58m}, once(playlist_hetedik_tipusu_talalkozas)),
    ({7w and 19h-19h58m}, once(playlist_hatterzaj)),
    ({7w and 20h-20h58m}, once(playlist_kisszoba)),
    ({7w and 21h-21h58m}, once(playlist_sub_burek)),
    ({7w and 22h-23h58m}, once(playlist_stepbystep)),
    ({7w and 11h30m-23h30m}, playlist_off_air_ambient),                 #ambient: sunday morgen - Step by Step
    #Example - REPLACE WITH ACTUAL EXTERNAL SOURCE
    #({ 6w and 18h23m-18h24m}, external_cashmere),
    ({true}, playlist_off_air) ]

def fading_transition(a,b) =
    sequence([
    fade.out(track_sensitive=false,a.source),
    playlist_jingle_station_id, playlist_jingle_donate,
    fade.in(track_sensitive=false,b.source)
    ])
end


# Standard Schedule Switches
radio = switch(id="schedule_switch", track_sensitive=false, sources)

# Add crossfading
radio = cross(fading_transition, radio)

def add_skip_command(s) =
    def skip(_) =
        source.skip(s)
        "Done!"
    end

    server.register(namespace="radio", usage="skip", description="Skip the current song.", "skip",skip)
end

add_skip_command(radio)

# Skip non-live track when live DJ goes live.
def check_live() =
    if live.is_ready() then
        if not !to_live then
            to_live := true
        end
    else
        to_live := false
    end
end

# Continuously check on live.
radio = source.on_frame(radio, check_live)

# Allow for Telnet-driven insertion of custom metadata.
radio = server.insert_metadata(id="custom_metadata", radio)

# Apply amplification metadata (if supplied)
radio = amplify(override="liq_amplify", 1., radio)

radio = fallback(id="safe_fallback", track_sensitive = false, [radio, single(id="error_jingle", "/usr/local/share/icecast/web/error.mp3")])

# Send metadata changes back to AzuraCast
last_title = ref("")
last_artist = ref("")

def metadata_updated(m) =
    def f() =
        if (m["title"] != !last_title or m["artist"] != !last_artist) then
            last_title := m["title"]
            last_artist := m["artist"]

            j = json()

            if (m["song_id"] != "") then
                j.add("song_id", m["song_id"])
                j.add("media_id", m["media_id"])
                j.add("playlist_id", m["playlist_id"])
            else
                j.add("artist", m["artist"])
                j.add("title", m["title"])
            end

            _ = azuracast_api_call(
                "feedback",
                json.stringify(j)
            )
        end
    end

    thread.run(f)
end

radio.on_metadata(metadata_updated)

# Handle "Jingle Mode" tracks by replaying the previous metadata.
last_metadata = ref([])
def handle_jingle_mode(m) =
    if (m["jingle_mode"] == "true") then
        !last_metadata
    else
        last_metadata := m
        m
    end
end

radio = metadata.map(update=false, handle_jingle_mode, radio)

# Local Broadcasts
output.icecast(%mp3(samplerate=44100, stereo=true, bitrate=128, id3v2=true), id="local_1", host = "127.0.0.1", port = 8000, password = "ICECAST_KEY", mount = "/radio.mp3", name = "Lahmacun radio", description = "", genre = "", public = false, encoding = "UTF-8", radio)
