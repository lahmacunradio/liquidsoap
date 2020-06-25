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

playlist_mukodo_mukod = playlist(id="playlist_mukodo_mukod",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_mukodo_mukod.m3u")
playlist_mukodo_mukod = audio_to_stereo(id="stereo_playlist_mukodo_mukod", playlist_mukodo_mukod)

playlist_merites= playlist(id="playlist_merites",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_merites.m3u")
playlist_merites= audio_to_stereo(id="stereo_playlist_merites", playlist_merites)

playlist_wikihow_adventure_cruise = playlist(id="playlist_wikihow_adventure_cruise",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_wikihow_adventure_cruise.m3u")
playlist_wikihow_adventure_cruise = audio_to_stereo(id="stereo_playlist_wikihow_adventure_cruise", playlist_wikihow_adventure_cruise)

playlist_agybaj = playlist(id="playlist_agybaj",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_agybaj.m3u")
playlist_agybaj = audio_to_stereo(id="stereo_playlist_agybaj", playlist_agybaj)

playlist_great_galactick_ghaul = playlist(id="playlist_great_galactick_ghaul",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_great_galactick_ghaul.m3u")
playlist_great_galactick_ghaul = audio_to_stereo(id="stereo_playlist_great_galactick_ghaul", playlist_great_galactick_ghaul)

playlist_erdenklang = playlist(id="playlist_erdenklang",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_erdenklang.m3u")
playlist_erdenklang = audio_to_stereo(id="stereo_playlist_erdenklang", playlist_erdenklang)

playlist_donald_kacsa_klub = playlist(id="playlist_donald_kacsa_klub",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_donald_kacsa_klub.m3u")
playlist_donald_kacsa_klub = audio_to_stereo(id="stereo_playlist_donald_kacsa_klub", playlist_donald_kacsa_klub)

playlist_kezek_a_sebekben = playlist(id="playlist_kezek_a_sebekben",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_kezek_a_sebekben.m3u")
playlist_kezek_a_sebekben = audio_to_stereo(id="stereo_playlist_kezek_a_sebekben", playlist_kezek_a_sebekben)

playlist_turmeric_acid = playlist(id="playlist_turmeric_acid",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_turmeric_acid.m3u")
playlist_turmeric_acid = audio_to_stereo(id="stereo_playlist_turmeric_acid", playlist_turmeric_acid)

playlist_csinaltam_neked_egy_valogatas_kazettat = playlist(id="playlist_csinaltam_neked_egy_valogatas_kazettat",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_csinaltam_neked_egy_valogatas_kazettat.m3u")
playlist_csinaltam_neked_egy_valogatas_kazettat = audio_to_stereo(id="stereo_playlist_csinaltam_neked_egy_valogatas_kazettat", playlist_csinaltam_neked_egy_valogatas_kazettat)

playlist_cellz = playlist(id="playlist_cellz",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_cellz.m3u")
playlist_cellz = audio_to_stereo(id="stereo_playlist_cellz", playlist_cellz)

playlist_erto_hallgatas = playlist(id="playlist_erto_hallgatas",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_erto_hallgatas.m3u")
playlist_erto_hallgatas = audio_to_stereo(id="stereo_playlist_erto_hallgatas", playlist_erto_hallgatas)

playlist_szarok_bele = playlist(id="playlist_szarok_bele",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_szarok_bele.m3u")
playlist_szarok_bele = audio_to_stereo(id="stereo_playlist_szarok_bele", playlist_szarok_bele)

playlist_jingle = playlist(id="playlist_jingle",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_jingle.m3u")
playlist_jingle = audio_to_stereo(id="stereo_playlist_jingle", playlist_jingle)
playlist_jingle = drop_metadata(playlist_jingle)

playlist_jingle_after_show = playlist(id="playlist_jingle_after_show",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_jingle_after_show.m3u")
playlist_jingle_after_show = audio_to_stereo(id="stereo_playlist_jingle_after_show", playlist_jingle_after_show)

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

playlist_alternoon = playlist(id="playlist_alternoon",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_alternoon.m3u")
playlist_alternoon = audio_to_stereo(id="stereo_playlist_alternoon", playlist_alternoon)

playlist_arcadeok_alatt = playlist(id="playlist_arcadeok_alatt",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_arcadeok_alatt.m3u")
playlist_arcadeok_alatt = audio_to_stereo(id="stereo_playlist_arcadeok_alatt", playlist_arcadeok_alatt)

playlist_dodo = playlist(id="playlist_dodo",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_dodo.m3u")
playlist_dodo = audio_to_stereo(id="stereo_playlist_dodo", playlist_dodo)

playlist_azvlm = playlist(id="playlist_azvlm",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_azvlm.m3u")
playlist_azvlm = audio_to_stereo(id="stereo_playlist_azvlm", playlist_azvlm)

playlist_speakers_corner = playlist(id="playlist_speakers_corner",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_speakers_corner.m3u")
playlist_speakers_corner = audio_to_stereo(id="stereo_playlist_speakers_corner", playlist_speakers_corner)

playlist_a_who_say = playlist(id="playlist_a_who_say",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_a_who_say.m3u")
playlist_a_who_say = audio_to_stereo(id="stereo_playlist_a_who_say", playlist_a_who_say)

playlist_brains_sublimating = playlist(id="playlist_brains_sublimating",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_brains_sublimating.m3u")
playlist_brains_sublimating = audio_to_stereo(id="stereo_playlist_brains_sublimating", playlist_brains_sublimating)

playlist_dalmata_radio = playlist(id="playlist_dalmata_radio",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_dalmata_radio.m3u")
playlist_dalmata_radio = audio_to_stereo(id="stereo_playlist_dalmata_radio", playlist_dalmata_radio)

playlist_eastern_daze = playlist(id="playlist_eastern_daze",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_eastern_daze.m3u")
playlist_eastern_daze = audio_to_stereo(id="stereo_playlist_eastern_daze", playlist_eastern_daze)

playlist_transverszia = playlist(id="playlist_transverszia",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_transverszia.m3u")
playlist_transverszia = audio_to_stereo(id="stereo_playlist_transverszia", playlist_transverszia)

playlist_radio_bluszcze = playlist(id="playlist_radio_bluszcze",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_radio_bluszcze.m3u")
playlist_radio_bluszcze = audio_to_stereo(id="stereo_playlist_radio_bluszcze", playlist_radio_bluszcze)

playlist_muhelycast = playlist(id="playlist_muhelycast",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_muhelycast.m3u")
playlist_muhelycast = audio_to_stereo(id="stereo_playlist_muhelycast", playlist_muhelycast)

playlist_off_air_premiere = playlist(id="playlist_off_air_premiere",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_off_air_premiere.m3u")
playlist_off_air_premiere = audio_to_stereo(id="stereo_playlist_off_air_premiere", playlist_off_air_premiere)

playlist_dead_hound = playlist(id="playlist_dead_hound",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_dead_hound.m3u")
playlist_dead_hound = audio_to_stereo(id="stereo_playlist_dead_hound", playlist_dead_hound)

playlist_infinite_scroll = playlist(id="playlist_infinite_scroll",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_infinite_scroll.m3u")
playlist_infinite_scroll = audio_to_stereo(id="stereo_playlist_infinite_scroll", playlist_infinite_scroll)

playlist_torso = playlist(id="playlist_torso",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_torso.m3u")
playlist_torso = audio_to_stereo(id="stereo_playlist_torso", playlist_torso)

playlist_svadhyaya = playlist(id="playlist_svadhyaya",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_svadhyaya.m3u")
playlist_svadhyaya = audio_to_stereo(id="stereo_playlist_svadhyaya", playlist_svadhyaya)

playlist_hetedik_tipusu_talalkozas = playlist(id="playlist_hetedik_tipusu_talalkozas",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_hetedik_tipusu_talalkozas.m3u")
playlist_hetedik_tipusu_talalkozas = audio_to_stereo(id="stereo_playlist_hetedik_tipusu_talalkozas", playlist_hetedik_tipusu_talalkozas)

playlist_mills_weather = playlist(id="playlist_mills_weather",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_mills_weather.m3u")
playlist_mills_weather = audio_to_stereo(id="stereo_playlist_mills_weather", playlist_mills_weather)

playlist_udcsi = playlist(id="playlist_udcsi",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_udcsi.m3u")
playlist_udcsi = audio_to_stereo(id="stereo_playlist_udcsi", playlist_udcsi)

playlist_idm_user = playlist(id="playlist_idm_user",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_idm_user.m3u")
playlist_idm_user = audio_to_stereo(id="stereo_playlist_idm_user", playlist_idm_user)

playlist_jambikus_nesz = playlist(id="playlist_jambikus_nesz",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_jambikus_nesz.m3u")
playlist_jambikus_nesz = audio_to_stereo(id="stereo_playlist_jambikus_nesz", playlist_jambikus_nesz)

playlist_mosolyszunet = playlist(id="playlist_mosolyszunet",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_mosolyszunet.m3u")
playlist_mosolyszunet = audio_to_stereo(id="stereo_playlist_mosolyszunet", playlist_mosolyszunet)

playlist_exit = playlist(id="playlist_exit",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_exit.m3u")
playlist_exit = audio_to_stereo(id="stereo_playlist_exit", playlist_exit)

playlist_lohuma = playlist(id="playlist_lohuma",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_lohuma.m3u")
playlist_lohuma = audio_to_stereo(id="stereo_playlist_lohuma", playlist_lohuma)

playlist_merites= playlist(id="playlist_merites",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_merites.m3u")
playlist_merites= audio_to_stereo(id="stereo_playlist_merites", playlist_merites)

playlist_weirdest_hits = playlist(id="playlist_weirdest_hits",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_weirdest_hits.m3u")
playlist_weirdest_hits = audio_to_stereo(id="stereo_playlist_weirdest_hits", playlist_weirdest_hits)

playlist_off_air = playlist(id="playlist_off_air",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_off_air.m3u")
playlist_off_air = audio_to_stereo(id="stereo_playlist_off_air", playlist_off_air)

playlist_off_air_ambient = playlist(id="playlist_off_air_ambient",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_off_air_ambient.m3u")
playlist_off_air_ambient = audio_to_stereo(id="stereo_playlist_off_air_ambient", playlist_off_air_ambient)

playlist_jingle_azura = playlist(id="playlist_jingle_azura",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_jingle_azura.m3u")
playlist_jingle_azura = audio_to_stereo(id="stereo_playlist_jingle_azura", playlist_jingle_azura)
playlist_jingle_azura = drop_metadata(playlist_jingle_azura)

# Standard Playlists
radio = random(id="lahmacun_radio_standard_playlists", weights=[3], [playlist_off_air])

# Once per x Minutes Playlists
# LAHMACUN: id is the one used in Azuracast to trigger the skip command on
# Code location: /AzuraCast/src/Radio/Backend/Liquidsoap.php
# Once per x Songs Playlists
radio = rotate(id="lahmacun_radio_requests_fallback", weights=[1,1], [playlist_jingle_azura, radio])

#off air ambient source with jingles
off_air_ambient_mix = rotate(id="lahmacun_off_air_ambient_mix", weights=[1,1], [playlist_jingle_azura, playlist_off_air_ambient])

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
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_off(playlist_jingle_after_show), #ambient: Who Say - Dalmata
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_off(playlist_jingle_after_show), #ambient: Udcsi - Infinite 
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_off(playlist_jingle_after_show), #ambient: Mill - Mosoly
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_off(playlist_jingle_after_show), #ambient: Erto - Svad 
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_off(playlist_jingle_after_show), #ambient: cell - Eastern 
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_off(playlist_jingle_after_show), #ambient: Alter - Gyogyf
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_off(playlist_jingle_after_show), #ambient: user - Arcade 
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_off(playlist_jingle_after_show), #ambient: Merites - Brains
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_off(playlist_jingle_after_show), #ambient: Lohuma - Exit
    transition_into_off(playlist_jingle_after_show) ], 
    transition_length=60., #max duration of jingle (60s)
    [
    ({!live_enabled}, live),     #Live DJ
    ({1w and 5h-5h59m}, once(playlist_szarok_bele)),            #Monday
    ({1w and 9h11m-10h11m}, once(playlist_transverszia)),           #orig requested time 11:11 am 12:12 pm
    ({1w and 11h-11h59m}, once(playlist_a_who_say)),
    ({1w and 12h-13h59m}, once(playlist_dalmata_radio)),
    ({1w and 11h-12h30m}, off_air_ambient_mix),                        #ambient: Who Say - Dalmata
    ({1w and 15h-15h59m}, once(playlist_udcsi)),
    ({1w and 16h-16h59m}, once(playlist_szmuti_csorba)),
    ({1w and 17h-17h29m}, once(playlist_kezek_a_sebekben)),
    ({1w and 17h30m-17h59m}, once(playlist_weirdest_hits)),
    ({1w and 18h-19h59m}, once(playlist_erdenklang)),
    ({1w and 20h-21h59m}, once(playlist_infinite_scroll)),      
    ({1w and 15h-20h30m}, off_air_ambient_mix),                        #ambient: Udcsi - Infinite
    ({2w and 1h04m-3h30m}, once(playlist_gyorsnaszad_hidja)),   #Tuesday
    ({2w and 11h-12h29m}, once(playlist_csinaltam_neked_egy_valogatas_kazettat)),
    ({2w and 14h-14h59m}, once(playlist_mills_weather)),
    ({2w and 15h-15h59m}, once(playlist_azvlm)),
    ({2w and 16h-17h29m}, once(playlist_mmn_radio)),
    ({2w and 17h30m-18h29m}, once(playlist_havizaj)),
    ({2w and 19h-19h59m}, once(playlist_turmeric_acid)),
    ({2w and 20h-21h59m}, once(playlist_mosolyszunet)),
    ({2w and 14h-20h30m}, off_air_ambient_mix),                        #ambient: Mill - Mosoly
    ({3w and 10h-11h59m}, once(playlist_off_air_premiere)),     #Wednesday
    ({3w and 13h-13h59m}, once(playlist_erto_hallgatas)),
    ({3w and 14h-14h59m}, once(playlist_wikihow_adventure_cruise)),
    ({3w and 16h-16h59m}, once(playlist_svadhyaya)),
    ({3w and 13h-17h30m}, off_air_ambient_mix),                        #ambient: Erto - Svad
    ({3w and 18h-18h59m}, once(playlist_cellz)),
    ({3w and 19h-19h59m}, once(playlist_eastern_daze)),
    ({3w and 18h-19h30m}, off_air_ambient_mix),                        #ambient: cell - Eastern
    ({3w and 21h-21h59m}, once(playlist_radio_bluszcze)),
    ({4w and 12h-12h59m}, once(playlist_muhelycast)),           #Thursday
    ({4w and 14h-14h59m}, once(playlist_alternoon)),
    ({4w and 15h-16h59m}, once(playlist_lazy_calm_raga)),
    ({4w and 17h-17h59m}, once(playlist_dalmata_gergo_show)),
    ({4w and 18h-18h59m}, once(playlist_dodo)),
    ({4w and 19h-20h59m}, once(playlist_great_galactick_ghaul)),
    ({4w and 21h-21h59m}, once(playlist_gyogyfurdo)),
    ({4w and 14h-21h30m}, off_air_ambient_mix),                        #ambient: Alter - Gyogyf
    ({5w and 14h-14h59m}, once(playlist_idm_user)),             #Friday
    ({5w and 15h-15h59m}, once(playlist_dead_hound)),
    ({5w and 16h-16h59m}, once(playlist_agybaj)),
    ({5w and 17h-18h59m}, once(playlist_mukodo_mukod)),
    ({5w and 19h-20h59m}, once(playlist_arcadeok_alatt)),       
    ({5w and 14h-19h30m}, off_air_ambient_mix),                        #ambient: user - Arcade
    ({6w and 9h30m-11h29m}, once(playlist_merites)),     #Saturday
    ({6w and 11h30m-12h29m}, once(playlist_jambikus_nesz)),     
    ({6w and 13h-14h59m}, once(playlist_torso)),
    ({6w and 15h-15h59m}, once(playlist_footwork_jimbob)),
    ({6w and 16h-17h59m}, once(playlist_rnr666)),
    ({6w and 18h-19h59m}, once(playlist_mood_sequence)),
    ({6w and 20h30m-21h29m}, once(playlist_brains_sublimating)),
    ({6w and 9h30m-21h}, off_air_ambient_mix),                        #ambient: Merites - Brains
    ({7w and 9h30m-10h29m}, once(playlist_lohuma)),             #Sunday
    ({7w and 10h30m-11h59m}, once(playlist_bambusz)),
    ({7w and 12h-15h59m}, once(playlist_donald_kacsa_klub)),
    ({7w and 16h30m-17h29m}, once(playlist_hetedik_tipusu_talalkozas)),
    ({7w and 18h-18h59m}, once(playlist_speakers_corner)),
    ({7w and 19h-19h59m}, once(playlist_sub_burek)),
    ({7w and 20h-20h59m}, once(playlist_exit)),
    ({7w and 9h30m-20h30m}, off_air_ambient_mix),                        #ambient: Lohuma - Exit
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
