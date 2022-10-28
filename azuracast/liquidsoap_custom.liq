set("init.daemon", false)
set("init.daemon.pidfile.path","/var/azuracast/stations/lahmacun_radio/config/liquidsoap.pid")
set("log.stdout", true)
set("log.file", false)
set("server.telnet",true)
set("server.telnet.bind_addr","0.0.0.0")
set("server.telnet.port", 8004)
set("harbor.bind_addrs",["0.0.0.0"])

set("tag.encodings",["UTF-8","ISO-8859-1"])
set("encoder.encoder.export",["artist","title","album","song"])

setenv("TZ", "UTC")


playlist_sub_burek = playlist(id="playlist_sub_burek",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_sub_burek.m3u")
playlist_sub_burek = audio_to_stereo(id="stereo_playlist_sub_burek", playlist_sub_burek)

playlist_bambusz = playlist(id="playlist_bambusz",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_bambusz.m3u")
playlist_bambusz = audio_to_stereo(id="stereo_playlist_bambusz", playlist_bambusz)

playlist_mmn_radio = playlist(id="playlist_mmn_radio",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_mmn_radio.m3u")
playlist_mmn_radio = audio_to_stereo(id="stereo_playlist_mmn_radio", playlist_mmn_radio)

playlist_rnr666 = playlist(id="playlist_rnr666",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_rnr666.m3u")
playlist_rnr666 = audio_to_stereo(id="stereo_playlist_rnr666", playlist_rnr666)

playlist_lazy_calm_raga = playlist(id="playlist_lazy_calm_raga",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_lazy_calm_raga.m3u")
playlist_lazy_calm_raga = audio_to_stereo(id="stereo_playlist_lazy_calm_raga", playlist_lazy_calm_raga)

playlist_szmuti_csorba = playlist(id="playlist_szmuti_csorba",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_szmuti_csorba.m3u")
playlist_szmuti_csorba = audio_to_stereo(id="stereo_playlist_szmuti_csorba", playlist_szmuti_csorba)

playlist_schmerz = playlist(id="playlist_schmerz",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_schmerz.m3u")
playlist_schmerz = audio_to_stereo(id="stereo_playlist_schmerz", playlist_schmerz)

playlist_erdenklang = playlist(id="playlist_erdenklang",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_erdenklang.m3u")
playlist_erdenklang = audio_to_stereo(id="stereo_playlist_erdenklang", playlist_erdenklang)

playlist_donald_kacsa_klub = playlist(id="playlist_donald_kacsa_klub",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_donald_kacsa_klub.m3u")
playlist_donald_kacsa_klub = audio_to_stereo(id="stereo_playlist_donald_kacsa_klub", playlist_donald_kacsa_klub)

playlist_turmeric_acid = playlist(id="playlist_turmeric_acid",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_turmeric_acid.m3u")
playlist_turmeric_acid = audio_to_stereo(id="stereo_playlist_turmeric_acid", playlist_turmeric_acid)

playlist_erto_hallgatas = playlist(id="playlist_erto_hallgatas",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_erto_hallgatas.m3u")
playlist_erto_hallgatas = audio_to_stereo(id="stereo_playlist_erto_hallgatas", playlist_erto_hallgatas)

playlist_mood_sequence = playlist(id="playlist_mood_sequence",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_mood_sequence.m3u")
playlist_mood_sequence = audio_to_stereo(id="stereo_playlist_mood_sequence", playlist_mood_sequence)

playlist_gyorsnaszad_hidja = playlist(id="playlist_gyorsnaszad_hidja",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_gyorsnaszad_hidja.m3u")
playlist_gyorsnaszad_hidja = audio_to_stereo(id="stereo_playlist_gyorsnaszad_hidja", playlist_gyorsnaszad_hidja)

playlist_footwork_jimbob = playlist(id="playlist_footwork_jimbob",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_footwork_jimbob.m3u")
playlist_footwork_jimbob = audio_to_stereo(id="stereo_playlist_footwork_jimbob", playlist_footwork_jimbob)

playlist_havizaj = playlist(id="playlist_havizaj",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_havizaj.m3u")
playlist_havizaj = audio_to_stereo(id="stereo_playlist_havizaj", playlist_havizaj)

playlist_dalmata_gergo_show = playlist(id="playlist_dalmata_gergo_show",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_dalmata_gergo_show.m3u")
playlist_dalmata_gergo_show = audio_to_stereo(id="stereo_playlist_dalmata_gergo_show", playlist_dalmata_gergo_show)

playlist_gyogyfurdo = playlist(id="playlist_gyogyfurdo",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_gyogyfurdo.m3u")
playlist_gyogyfurdo = audio_to_stereo(id="stereo_playlist_gyogyfurdo", playlist_gyogyfurdo)

playlist_arcadeok_alatt = playlist(id="playlist_arcadeok_alatt",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_arcadeok_alatt.m3u")
playlist_arcadeok_alatt = audio_to_stereo(id="stereo_playlist_arcadeok_alatt", playlist_arcadeok_alatt)

playlist_a_who_say = playlist(id="playlist_a_who_say",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_a_who_say.m3u")
playlist_a_who_say = audio_to_stereo(id="stereo_playlist_a_who_say", playlist_a_who_say)

playlist_d23 = playlist(id="playlist_d23",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_d23.m3u")
playlist_d23 = audio_to_stereo(id="stereo_playlist_d23", playlist_d23)

playlist_eastern_daze = playlist(id="playlist_eastern_daze",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_eastern_daze.m3u")
playlist_eastern_daze = audio_to_stereo(id="stereo_playlist_eastern_daze", playlist_eastern_daze)

playlist_transverszia = playlist(id="playlist_transverszia",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_transverszia.m3u")
playlist_transverszia = audio_to_stereo(id="stereo_playlist_transverszia", playlist_transverszia)

playlist_dead_hound = playlist(id="playlist_dead_hound",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_dead_hound.m3u")
playlist_dead_hound = audio_to_stereo(id="stereo_playlist_dead_hound", playlist_dead_hound)

playlist_infinite_scroll = playlist(id="playlist_infinite_scroll",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_infinite_scroll.m3u")
playlist_infinite_scroll = audio_to_stereo(id="stereo_playlist_infinite_scroll", playlist_infinite_scroll)

playlist_torso = playlist(id="playlist_torso",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_torso.m3u")
playlist_torso = audio_to_stereo(id="stereo_playlist_torso", playlist_torso)

playlist_hetedik_tipusu_talalkozas = playlist(id="playlist_hetedik_tipusu_talalkozas",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_hetedik_tipusu_talalkozas.m3u")
playlist_hetedik_tipusu_talalkozas = audio_to_stereo(id="stereo_playlist_hetedik_tipusu_talalkozas", playlist_hetedik_tipusu_talalkozas)

playlist_melyvagas = playlist(id="playlist_melyvagas",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_melyvagas.m3u")
playlist_melyvagas = audio_to_stereo(id="stereo_playlist_melyvagas", playlist_melyvagas)

playlist_udcsi = playlist(id="playlist_udcsi",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_udcsi.m3u")
playlist_udcsi = audio_to_stereo(id="stereo_playlist_udcsi", playlist_udcsi)

playlist_jambikus_nesz = playlist(id="playlist_jambikus_nesz",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_jambikus_nesz.m3u")
playlist_jambikus_nesz = audio_to_stereo(id="stereo_playlist_jambikus_nesz", playlist_jambikus_nesz)

playlist_mosolyszunet = playlist(id="playlist_mosolyszunet",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_mosolyszunet.m3u")
playlist_mosolyszunet = audio_to_stereo(id="stereo_playlist_mosolyszunet", playlist_mosolyszunet)

playlist_lohuma = playlist(id="playlist_lohuma",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_lohuma.m3u")
playlist_lohuma = audio_to_stereo(id="stereo_playlist_lohuma", playlist_lohuma)

playlist_merites= playlist(id="playlist_merites",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_merites.m3u")
playlist_merites= audio_to_stereo(id="stereo_playlist_merites", playlist_merites)

playlist_randomcsunyalanyok = playlist(id="playlist_randomcsunyalanyok",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_randomcsunyalanyok.m3u")
playlist_randomcsunyalanyok = audio_to_stereo(id="stereo_playlist_randomcsunyalanyok", playlist_randomcsunyalanyok)

playlist_rambo = playlist(id="playlist_rambo",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_rambo.m3u")
playlist_rambo = audio_to_stereo(id="stereo_playlist_rambo", playlist_rambo)

playlist_1800venus = playlist(id="playlist_1800venus",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_1800venus.m3u")
playlist_1800venus = audio_to_stereo(id="stereo_playlist_1800venus", playlist_1800venus)

playlist_csuszka = playlist(id="playlist_csuszka",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_csuszka.m3u")
playlist_csuszka = audio_to_stereo(id="stereo_playlist_csuszka", playlist_csuszka)

playlist_boombap = playlist(id="playlist_boombap",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_boombap.m3u")
playlist_boombap = audio_to_stereo(id="stereo_playlist_boombap", playlist_boombap)

playlist_melania = playlist(id="playlist_melania",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_melania.m3u")
playlist_melania = audio_to_stereo(id="stereo_playlist_melania", playlist_melania)

playlist_szusivacsi = playlist(id="playlist_szusivacsi",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_szusivacsi.m3u")
playlist_szusivacsi = audio_to_stereo(id="stereo_playlist_szusivacsi", playlist_szusivacsi)

playlist_moneyka = playlist(id="playlist_moneyka",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_moneyka.m3u")
playlist_moneyka = audio_to_stereo(id="stereo_playlist_moneyka", playlist_moneyka)

playlist_zeneszen = playlist(id="playlist_zeneszen",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_zeneszen.m3u")
playlist_zeneszen = audio_to_stereo(id="stereo_playlist_zeneszen", playlist_zeneszen)

playlist_linear_systems_with_gestalt = playlist(id="playlist_linear_systems_with_gestalt",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_linear_systems_with_gestalt.m3u")
playlist_linear_systems_with_gestalt = audio_to_stereo(id="stereo_playlist_linear_systems_with_gestalt", playlist_linear_systems_with_gestalt)

playlist_fkse = playlist(id="playlist_fkse",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_fkse.m3u")
playlist_fkse = audio_to_stereo(id="stereo_playlist_fkse", playlist_fkse)

playlist_hatterzaj = playlist(id="playlist_hatterzaj",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_hatterzaj.m3u")
playlist_hatterzaj = audio_to_stereo(id="stereo_playlist_hatterzaj", playlist_hatterzaj)

playlist_tudtad = playlist(id="playlist_tudtad",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_tudtad.m3u")
playlist_tudtad = audio_to_stereo(id="stereo_playlist_tudtad", playlist_tudtad)

playlist_paikka = playlist(id="playlist_paikka",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_paikka.m3u")
playlist_paikka = audio_to_stereo(id="stereo_playlist_paikka", playlist_paikka)

playlist_soundscape_diaries_emcsivel = playlist(id="playlist_soundscape_diaries_emcsivel",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_soundscape_diaries_emcsivel.m3u")
playlist_soundscape_diaries_emcsivel = audio_to_stereo(id="stereo_playlist_soundscape_diaries_emcsivel", playlist_soundscape_diaries_emcsivel)

playlist_keygen = playlist(id="playlist_keygen",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_keygen.m3u")
playlist_keygen = audio_to_stereo(id="stereo_playlist_keygen", playlist_keygen)

playlist_exit = playlist(id="playlist_exit",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_exit.m3u")
playlist_exit = audio_to_stereo(id="stereo_playlist_exit", playlist_exit)

playlist_graveyard_slot = playlist(id="playlist_graveyard_slot",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_graveyard_slot.m3u")
playlist_graveyard_slot = audio_to_stereo(id="stereo_playlist_graveyard_slot", playlist_graveyard_slot)

playlist_geigercounterculture = playlist(id="playlist_geigercounterculture",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_geigercounterculture.m3u")
playlist_geigercounterculture = audio_to_stereo(id="stereo_playlist_geigercounterculture", playlist_geigercounterculture)

playlist_radical_happiness = playlist(id="playlist_radical_happiness",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_radical_happiness.m3u")
playlist_radical_happiness = audio_to_stereo(id="stereo_playlist_radical_happiness", playlist_radical_happiness)

playlist_ember_a_palyan = playlist(id="playlist_ember_a_palyan",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_ember_a_palyan.m3u")
playlist_ember_a_palyan = audio_to_stereo(id="stereo_playlist_ember_a_palyan", playlist_ember_a_palyan)

playlist_brainfuq = playlist(id="playlist_brainfuq",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_brainfuq.m3u")
playlist_brainfuq = audio_to_stereo(id="stereo_playlist_brainfuq", playlist_brainfuq)

playlist_urmajmok = playlist(id="playlist_urmajmok",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_urmajmok.m3u")
playlist_urmajmok = audio_to_stereo(id="stereo_playlist_urmajmok", playlist_urmajmok)

playlist_szedd_a_labad = playlist(id="playlist_szedd_a_labad",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_szedd_a_labad.m3u")
playlist_szedd_a_labad = audio_to_stereo(id="stereo_playlist_szedd_a_labad", playlist_szedd_a_labad)

playlist_cleptorama = playlist(id="playlist_cleptorama",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_cleptorama.m3u")
playlist_cleptorama = audio_to_stereo(id="stereo_playlist_cleptorama", playlist_cleptorama)

playlist_felregombolt = playlist(id="playlist_felregombolt",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_felregombolt.m3u")
playlist_felregombolt = audio_to_stereo(id="stereo_playlist_felregombolt", playlist_felregombolt)

playlist_korunk = playlist(id="playlist_korunk",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_korunk.m3u")
playlist_korunk = audio_to_stereo(id="stereo_playlist_korunk", playlist_korunk)


# Shared show slots
playlist_ritka_csut = playlist(id="playlist_ritka_csut",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_ritka_csut.m3u")
playlist_ritka_csut = audio_to_stereo(id="stereo_playlist_ritka_csut", playlist_ritka_csut)

playlist_ritka_pentek = playlist(id="playlist_ritka_pentek",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_ritka_pentek.m3u")
playlist_ritka_pentek = audio_to_stereo(id="stereo_playlist_ritka_pentek", playlist_ritka_pentek)

# Lahmacun-own shows
playlist_lahmaloudclouds = playlist(id="playlist_lahmaloudclouds",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_lahmaloudclouds.m3u")
playlist_lahmaloudclouds = audio_to_stereo(id="stereo_playlist_lahmaloudclouds", playlist_lahmaloudclouds)

playlist_lahmacun_presents = playlist(id="playlist_lahmacun_presents",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_lahmacun_presents.m3u")
playlist_lahmacun_presents = audio_to_stereo(id="stereo_playlist_lahmacun_presents", playlist_lahmacun_presents)

# OFF AIR playlists
playlist_off_air = playlist(id="playlist_off_air",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_off_air.m3u")
playlist_off_air = audio_to_stereo(id="stereo_playlist_off_air", playlist_off_air)

# Jingle playlists
playlist_jingle_station_id = playlist(id="playlist_jingle_station_id",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_jingle_station_id.m3u")
playlist_jingle_station_id = audio_to_stereo(id="stereo_playlist_jingle_station_id", playlist_jingle_station_id)
playlist_jingle_station_id = drop_metadata(playlist_jingle_station_id)

playlist_jingle_donate = playlist(id="playlist_jingle_donate",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_jingle_donate.m3u")
playlist_jingle_donate = audio_to_stereo(id="stereo_playlist_jingle_donate", playlist_jingle_donate)

# Generic playlists
playlist_off_air_ambient = playlist(id="playlist_off_air_ambient",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_off_air_ambient.m3u")
playlist_off_air_ambient = audio_to_stereo(id="stereo_playlist_off_air_ambient", playlist_off_air_ambient)

# Standard Playlists
radio = random(id="lahmacun_radio_standard_playlists", weights=[1], [playlist_off_air])

# Once per x Minutes Playlists
# LAHMACUN: id is the one used in Azuracast to trigger the skip command on
# Code location: /AzuraCast/src/Radio/Backend/Liquidsoap.php
# Once per x Songs Playlists
radio = rotate(id="lahmacun_radio_requests_fallback", weights=[1,1,1], [playlist_jingle_station_id, playlist_jingle_donate, radio])

#off air ambient source with jingles
off_air_ambient_mix = rotate(id="lahmacun_off_air_ambient_mix", weights=[1,1], [playlist_jingle_donate, playlist_off_air_ambient])

# LAHMACUN: skip command added by hand (from Liquidsoap cookbook)
def add_skip_command(s) =
 # A command to skip
 def skip(_) =
   source.skip(s)
   "Done!"
 end
 # Register the command:
 server.register(namespace="#{source.id(s)}",
                 usage="skip",
                 description="Skip the current song.",
                 "skip",skip)
end

add_skip_command(radio)

radio = fallback(id="lahmacun_radio_safe_fallback", track_sensitive = false, [radio, single(id="error_jingle", "/usr/local/share/icecast/web/error.mp3")])

# DJ Authentication
live_enabled = ref false
last_authenticated_dj = ref ""
live_dj = ref ""

def dj_auth(auth_user,auth_pw) =
    user = ref ""
    password = ref ""
  
    if (auth_user == "source" or auth_user == "") and (string.match(pattern="(:|,)+", auth_pw)) then
        auth_string = string.split(separator="(:|,)", auth_pw)
        
        user := list.nth(default="", auth_string, 0)
        password := list.nth(default="", auth_string, 2)
    else
        user := auth_user
        password := auth_pw
    end
    
    log("Authenticating DJ: #{!user}")
    
    ret = list.hd(get_process_lines("curl -s --request POST --url http://web/api/internal/1/auth --form dj-user="^string.quote(!user)^" --form dj-password="^string.quote(!password)^" --form api_auth="^string.quote("AZURA_KEY")^""), default="")
    log("AzuraCast DJ Auth Response: #{ret}")
    
    authed = bool_of_string(ret)
    if (authed) then
        last_authenticated_dj := !user
    end
    
    authed
end

def live_connected(header) =
    dj = !last_authenticated_dj
    log("DJ Source connected! Last authenticated DJ: #{dj} - #{header}")
    
    live_enabled := true
    live_dj := dj
    
    ret = list.hd(get_process_lines("curl -s --request POST --url http://web/api/internal/1/djon --form dj-user="^string.quote(dj)^" --form api_auth="^string.quote("AZURA_KEY")^""), default="")
    log("AzuraCast Live Connected Response: #{ret}")
end

def live_disconnected() = 
    dj = !live_dj
    
    log("DJ Source disconnected! Current live DJ: #{dj}")
    
    ret = list.hd(get_process_lines("curl -s --request POST --url http://web/api/internal/1/djoff --form dj-user="^string.quote(dj)^" --form api_auth="^string.quote("AZURA_KEY")^""), default="")
    log("AzuraCast Live Disconnected Response: #{ret}")
    
    live_enabled := false
    last_authenticated_dj := ""
    live_dj := ""
end 

# A Pre-DJ source of radio that can be broadcast if needed
radio_without_live = radio
ignore(radio_without_live)

# Live Broadcasting
live = audio_to_stereo(input.harbor("/", id = "lahmacun_radio_input_streamer", port = 8005, auth = dj_auth, icy = true, icy_metadata_charset = "UTF-8", metadata_charset = "UTF-8", on_connect = live_connected, on_disconnect = live_disconnected, buffer = 5., max = 10.))
ignore(output.dummy(live, fallible=true))

#LAHMACUN: CHANGE IN AZURA GENERATED CONFIG (COMMENT OUT NEXT LINE)
#radio = switch(id="lahmacun_radio_live_switch", track_sensitive=false, [({!live_enabled}, live), ({true}, radio)])

# Allow for Telnet-driven insertion of custom metadata.
radio = server.insert_metadata(id="custom_metadata", radio)

# Apply amplification metadata (if supplied)
radio = amplify(1., radio)

# LAHMACUN: THIS IS WHERE THE CUSTOM CONFIGURATION WOULD START

# Fade out off air music, play jingle, start playing show (unfaded)
def transition_into_show(j,a,b)
	sequence(merge=true, [fade.final(duration=5.,a),j,b])
end

# Stop show (faded), play jingle, fade in off air music
def transition_into_off(j,a,b)
    source.skip(b)
	sequence(merge=true, [fade.final(duration=5.,a),j,b])
end

radio = switch(track_sensitive=false, transitions=[
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),    
    transition_into_off(playlist_jingle_station_id), #ambient: ^^^ Monday ^^^ 
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_off(playlist_jingle_station_id), #ambient: ^^^ Tuesday ^^^ 
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),    
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_off(playlist_jingle_station_id), #ambient: ^^^ Wednesday ^^^ 
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_off(playlist_jingle_station_id), #ambient: ^^^ Thursday ^^^ 
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_off(playlist_jingle_station_id), #ambient: ^^^ Friday ^^^ 
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_off(playlist_jingle_station_id), #ambient: ^^^ Saturday ^^^
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_show(playlist_jingle_station_id),
    transition_into_off(playlist_jingle_station_id), #ambient: ^^^ Sunday ^^^
    transition_into_off(playlist_jingle_station_id) ], 
    transition_length=60., #max duration of jingle (60s)
    [
    ({!live_enabled}, live),     #Live DJ          
    ({1w and 9h-9h58m}, once(playlist_szedd_a_labad)),             # Monday
    ({1w and 10h11m-11h9m}, once(playlist_transverszia)),             # orig requested time 11:11 am 12:12 pm
    ({1w and 12h-12h58m}, once(playlist_a_who_say)),
    ({1w and 13h-14h28m}, once(playlist_korunk)),    
    ({1w and 15h-15h58m}, once(playlist_szmuti_csorba)),
    ({1w and 16h-16h58m}, once(playlist_paikka)),
    ({1w and 17h-17h58m}, once(playlist_udcsi)),
    ({1w and 18h30m-18h58m}, once(playlist_soundscape_diaries_emcsivel)),
    ({1w and 19h-19h58m}, once(playlist_ember_a_palyan)),
    ({1w and 20h-20h58m}, once(playlist_urmajmok)),      
    ({1w and 21h-22h58m}, once(playlist_infinite_scroll)),      
    ({1w and 15h30m-21h30m}, off_air_ambient_mix),                        #ambient: Szmuti - Infinite
    ({2w and 2h04m-4h30m}, once(playlist_gyorsnaszad_hidja)),          #Tuesday
    ({2w and 7h-7h28m}, once(playlist_felregombolt)),
    ({2w and 11h-12h58m}, once(playlist_lahmaloudclouds)),
    ({2w and 14h30m-15h58m}, once(playlist_melyvagas)),
    ({2w and 16h-16h58m}, once(playlist_radical_happiness)),
    ({2w and 17h-17h58m}, once(playlist_mmn_radio)),
    ({2w and 18h-18h58m}, once(playlist_mosolyszunet)),
    ({2w and 19h-19h58m}, once(playlist_havizaj)),
    ({2w and 20h-20h58m}, once(playlist_turmeric_acid)),
    ({2w and 21h-21h58m}, once(playlist_exit)),
    ({2w and 15h-21h30m}, off_air_ambient_mix),                        #ambient: Melyvagas - Exit
    ({3w and 11h-12h58m}, once(playlist_lahmacun_presents)),           #Wednesday
    ({3w and 13h30m-13h58m}, once(playlist_tudtad)),
    ({3w and 14h-14h58m}, once(playlist_erto_hallgatas)),
    ({3w and 15h-15h58m}, once(playlist_erdenklang)),
    ({3w and 16h-16h58m}, once(playlist_cleptorama)),
    ({3w and 18h-18h58m}, once(playlist_rambo)),
    ({3w and 19h-19h58m}, once(playlist_boombap)),
    ({3w and 20h-20h58m}, once(playlist_eastern_daze)),
    ({3w and 21h-21h58m}, once(playlist_1800venus)),
    ({3w and 22h-22h58m}, once(playlist_linear_systems_with_gestalt)),
    ({3w and 13h15m-22h30m}, off_air_ambient_mix),                     #ambient: Tudtad - Gestalt
    ({4w and 10h-11h58m}, once(playlist_ritka_csut)),                  #Thursday
    ({4w and 14h-14h58m}, once(playlist_fkse)),
    ({4w and 15h-16h58m}, once(playlist_lazy_calm_raga)),
    ({4w and 17h-17h58m}, once(playlist_dalmata_gergo_show)),
    ({4w and 18h-18h58m}, once(playlist_keygen)),
    ({4w and 19h-20h58m}, once(playlist_schmerz)),
    ({4w and 21h-22h28m}, once(playlist_gyogyfurdo)),
    ({4w and 12h30m-21h30m}, off_air_ambient_mix),                        #ambient: Ritka csut - Gyogyf
    ({5w and 10h-11h58m}, once(playlist_ritka_pentek)),                #Friday
    ({5w and 12h00m-12h28m}, once(playlist_melania)),                     
    ({5w and 12h30m-13h58m}, once(playlist_szusivacsi)),
    ({5w and 14h-14h58m}, once(playlist_randomcsunyalanyok)),           
    ({5w and 15h-15h58m}, once(playlist_dead_hound)),
    ({5w and 16h-16h58m}, once(playlist_graveyard_slot)),
    ({5w and 17h-17h58m}, once(playlist_brainfuq)),
    ({5w and 18h-18h58m}, once(playlist_moneyka)),
    ({5w and 19h-20h58m}, once(playlist_arcadeok_alatt)),       
    ({5w and 12h15m-21h30m}, off_air_ambient_mix),                        #ambient: Ritka pentek - Rev
    ({6w and 9h30m-11h28m}, once(playlist_merites)),                  #Saturday
    ({6w and 11h30m-12h28m}, once(playlist_jambikus_nesz)),     
    ({6w and 12h30m-14h58m}, once(playlist_torso)),
    ({6w and 15h-15h58m}, once(playlist_footwork_jimbob)),
    ({6w and 16h-17h58m}, once(playlist_rnr666)),
    ({6w and 18h-19h58m}, once(playlist_mood_sequence)),
    ({6w and 21h-22h28m}, once(playlist_d23)),
    ({6w10h-6w23h}, off_air_ambient_mix),                     #ambient: Merites - Gestalt
    ({7w and 8h30m-10h28m}, once(playlist_lohuma)),                    #Sunday
    ({7w and 10h30m-11h58m}, once(playlist_bambusz)),
    ({7w and 12h-14h58m}, once(playlist_donald_kacsa_klub)),
    ({7w and 15h-15h58m}, once(playlist_geigercounterculture)),
    ({7w and 16h-16h58m}, once(playlist_hetedik_tipusu_talalkozas)),
    ({7w and 17h-17h58m}, once(playlist_hatterzaj)),
    ({7w and 18h-18h58m}, once(playlist_csuszka)),
    ({7w and 19h-19h58m}, once(playlist_sub_burek)),
    ({7w and 20h-20h58m}, once(playlist_zeneszen)),
    ({7w and 9h-20h30m}, off_air_ambient_mix),                        #ambient: Lohuma - Zeneszen
    ({true}, radio) ])


# Send metadata changes back to AzuraCast
def metadata_updated(m) =
  if (m["song_id"] != "") then
    ret = list.hd(get_process_lines("curl -s --request POST --url http://web/api/internal/1/feedback --form song="^string.quote(m["song_id"])^" --form media="^string.quote(m["media_id"])^" --form playlist="^string.quote(m["playlist_id"])^" --form api_auth="^string.quote("AZURA_KEY")^""), default="")
    log("AzuraCast Feedback Response: #{ret}")
  end
end

radio = on_metadata(metadata_updated,radio)

# Local Broadcasts
output.icecast(%mp3(samplerate=44100, stereo=true, bitrate=128, id3v2=true), id="lahmacun_radio_local_1", host = "127.0.0.1", port = 8000, password = "ICECAST_KEY", mount = "/radio.mp3", name = "Lahmacun radio", description = "", genre = "", public = false, encoding = "UTF-8", radio)

# Remote Relays
