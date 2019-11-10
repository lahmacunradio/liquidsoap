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
ignore(playlist_sub_burek)

playlist_bambusz = playlist(id="playlist_bambusz",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_bambusz.m3u")
playlist_bambusz = audio_to_stereo(id="stereo_playlist_bambusz", playlist_bambusz)
ignore(playlist_bambusz)

playlist_mmn_radio = playlist(id="playlist_mmn_radio",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_mmn_radio.m3u")
playlist_mmn_radio = audio_to_stereo(id="stereo_playlist_mmn_radio", playlist_mmn_radio)
ignore(playlist_mmn_radio)

playlist_rnr666 = playlist(id="playlist_rnr666",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_rnr666.m3u")
playlist_rnr666 = audio_to_stereo(id="stereo_playlist_rnr666", playlist_rnr666)
ignore(playlist_rnr666)

playlist_lazy_calm_raga = playlist(id="playlist_lazy_calm_raga",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_lazy_calm_raga.m3u")
playlist_lazy_calm_raga = audio_to_stereo(id="stereo_playlist_lazy_calm_raga", playlist_lazy_calm_raga)
ignore(playlist_lazy_calm_raga)

playlist_szmuti_csorba = playlist(id="playlist_szmuti_csorba",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_szmuti_csorba.m3u")
playlist_szmuti_csorba = audio_to_stereo(id="stereo_playlist_szmuti_csorba", playlist_szmuti_csorba)
ignore(playlist_szmuti_csorba)

playlist_mkd_mkd = playlist(id="playlist_mkd_mkd",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_mkd_mkd.m3u")
playlist_mkd_mkd = audio_to_stereo(id="stereo_playlist_mkd_mkd", playlist_mkd_mkd)
ignore(playlist_mkd_mkd)

playlist_geigercounterculture = playlist(id="playlist_geigercounterculture",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_geigercounterculture.m3u")
playlist_geigercounterculture = audio_to_stereo(id="stereo_playlist_geigercounterculture", playlist_geigercounterculture)
ignore(playlist_geigercounterculture)

playlist_wikihow_adventure_cruise = playlist(id="playlist_wikihow_adventure_cruise",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_wikihow_adventure_cruise.m3u")
playlist_wikihow_adventure_cruise = audio_to_stereo(id="stereo_playlist_wikihow_adventure_cruise", playlist_wikihow_adventure_cruise)
ignore(playlist_wikihow_adventure_cruise)

playlist_agybaj = playlist(id="playlist_agybaj",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_agybaj.m3u")
playlist_agybaj = audio_to_stereo(id="stereo_playlist_agybaj", playlist_agybaj)
ignore(playlist_agybaj)

playlist_great_galactick_ghaul = playlist(id="playlist_great_galactick_ghaul",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_great_galactick_ghaul.m3u")
playlist_great_galactick_ghaul = audio_to_stereo(id="stereo_playlist_great_galactick_ghaul", playlist_great_galactick_ghaul)
ignore(playlist_great_galactick_ghaul)

playlist_erdenklang = playlist(id="playlist_erdenklang",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_erdenklang.m3u")
playlist_erdenklang = audio_to_stereo(id="stereo_playlist_erdenklang", playlist_erdenklang)
ignore(playlist_erdenklang)

playlist_donald_kacsa_klub = playlist(id="playlist_donald_kacsa_klub",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_donald_kacsa_klub.m3u")
playlist_donald_kacsa_klub = audio_to_stereo(id="stereo_playlist_donald_kacsa_klub", playlist_donald_kacsa_klub)
ignore(playlist_donald_kacsa_klub)

playlist_kezek_a_sebekben = playlist(id="playlist_kezek_a_sebekben",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_kezek_a_sebekben.m3u")
playlist_kezek_a_sebekben = audio_to_stereo(id="stereo_playlist_kezek_a_sebekben", playlist_kezek_a_sebekben)
ignore(playlist_kezek_a_sebekben)

playlist_turmeric_acid = playlist(id="playlist_turmeric_acid",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_turmeric_acid.m3u")
playlist_turmeric_acid = audio_to_stereo(id="stereo_playlist_turmeric_acid", playlist_turmeric_acid)
ignore(playlist_turmeric_acid)

playlist_csinltam_neked_egy_vlogats_kazettt = playlist(id="playlist_csinltam_neked_egy_vlogats_kazettt",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_csinltam_neked_egy_vlogats_kazettt.m3u")
playlist_csinltam_neked_egy_vlogats_kazettt = audio_to_stereo(id="stereo_playlist_csinltam_neked_egy_vlogats_kazettt", playlist_csinltam_neked_egy_vlogats_kazettt)
ignore(playlist_csinltam_neked_egy_vlogats_kazettt)

playlist_cellz = playlist(id="playlist_cellz",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_cellz.m3u")
playlist_cellz = audio_to_stereo(id="stereo_playlist_cellz", playlist_cellz)
ignore(playlist_cellz)

playlist_rt_hallgats = playlist(id="playlist_rt_hallgats",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_rt_hallgats.m3u")
playlist_rt_hallgats = audio_to_stereo(id="stereo_playlist_rt_hallgats", playlist_rt_hallgats)
ignore(playlist_rt_hallgats)

playlist_szarok_bele = playlist(id="playlist_szarok_bele",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_szarok_bele.m3u")
playlist_szarok_bele = audio_to_stereo(id="stereo_playlist_szarok_bele", playlist_szarok_bele)
ignore(playlist_szarok_bele)

playlist_jingle = playlist(id="playlist_jingle",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_jingle.m3u")
playlist_jingle = audio_to_stereo(id="stereo_playlist_jingle", playlist_jingle)
playlist_jingle = drop_metadata(playlist_jingle)
ignore(playlist_jingle)

playlist_jingle_after_show = playlist(id="playlist_jingle_after_show",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_jingle_after_show.m3u")
playlist_jingle_after_show = audio_to_stereo(id="stereo_playlist_jingle_after_show", playlist_jingle_after_show)
ignore(playlist_jingle_after_show)

playlist_mood_sequence = playlist(id="playlist_mood_sequence",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_mood_sequence.m3u")
playlist_mood_sequence = audio_to_stereo(id="stereo_playlist_mood_sequence", playlist_mood_sequence)
ignore(playlist_mood_sequence)

playlist_lahmacun_gyorsnaszd_hdja = playlist(id="playlist_lahmacun_gyorsnaszd_hdja",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_lahmacun_gyorsnaszd_hdja.m3u")
playlist_lahmacun_gyorsnaszd_hdja = audio_to_stereo(id="stereo_playlist_lahmacun_gyorsnaszd_hdja", playlist_lahmacun_gyorsnaszd_hdja)
ignore(playlist_lahmacun_gyorsnaszd_hdja)

playlist_konkret_riport = playlist(id="playlist_konkret_riport",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_konkret_riport.m3u")
playlist_konkret_riport = audio_to_stereo(id="stereo_playlist_konkret_riport", playlist_konkret_riport)
ignore(playlist_konkret_riport)

playlist_footwork_jimbob = playlist(id="playlist_footwork_jimbob",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_footwork_jimbob.m3u")
playlist_footwork_jimbob = audio_to_stereo(id="stereo_playlist_footwork_jimbob", playlist_footwork_jimbob)
ignore(playlist_footwork_jimbob)

playlist_havizaj = playlist(id="playlist_havizaj",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_havizaj.m3u")
playlist_havizaj = audio_to_stereo(id="stereo_playlist_havizaj", playlist_havizaj)
ignore(playlist_havizaj)

playlist_dalmata_gergo_show = playlist(id="playlist_dalmata_gergo_show",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_dalmata_gergo_show.m3u")
playlist_dalmata_gergo_show = audio_to_stereo(id="stereo_playlist_dalmata_gergo_show", playlist_dalmata_gergo_show)
ignore(playlist_dalmata_gergo_show)

playlist_gygyfrd = playlist(id="playlist_gygyfrd",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_gygyfrd.m3u")
playlist_gygyfrd = audio_to_stereo(id="stereo_playlist_gygyfrd", playlist_gygyfrd)
ignore(playlist_gygyfrd)

playlist_alternoon = playlist(id="playlist_alternoon",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_alternoon.m3u")
playlist_alternoon = audio_to_stereo(id="stereo_playlist_alternoon", playlist_alternoon)
ignore(playlist_alternoon)

playlist_arcadeok_alatt = playlist(id="playlist_arcadeok_alatt",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_arcadeok_alatt.m3u")
playlist_arcadeok_alatt = audio_to_stereo(id="stereo_playlist_arcadeok_alatt", playlist_arcadeok_alatt)
ignore(playlist_arcadeok_alatt)

playlist_dodo = playlist(id="playlist_dodo",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_dodo.m3u")
playlist_dodo = audio_to_stereo(id="stereo_playlist_dodo", playlist_dodo)
ignore(playlist_dodo)

playlist_azvlm = playlist(id="playlist_azvlm",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_azvlm.m3u")
playlist_azvlm = audio_to_stereo(id="stereo_playlist_azvlm", playlist_azvlm)
ignore(playlist_azvlm)

playlist_speakers_corner = playlist(id="playlist_speakers_corner",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_speakers_corner.m3u")
playlist_speakers_corner = audio_to_stereo(id="stereo_playlist_speakers_corner", playlist_speakers_corner)
ignore(playlist_speakers_corner)

playlist_a_who_say = playlist(id="playlist_a_who_say",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_a_who_say.m3u")
playlist_a_who_say = audio_to_stereo(id="stereo_playlist_a_who_say", playlist_a_who_say)
ignore(playlist_a_who_say)

playlist_brains_sublimating = playlist(id="playlist_brains_sublimating",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_brains_sublimating.m3u")
playlist_brains_sublimating = audio_to_stereo(id="stereo_playlist_brains_sublimating", playlist_brains_sublimating)
ignore(playlist_brains_sublimating)

playlist_dalmata_radio = playlist(id="playlist_dalmata_radio",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_dalmata_radio.m3u")
playlist_dalmata_radio = audio_to_stereo(id="stereo_playlist_dalmata_radio", playlist_dalmata_radio)
ignore(playlist_dalmata_radio)

playlist_eastern_daze = playlist(id="playlist_eastern_daze",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_eastern_daze.m3u")
playlist_eastern_daze = audio_to_stereo(id="stereo_playlist_eastern_daze", playlist_eastern_daze)
ignore(playlist_eastern_daze)


playlist_off_air = playlist(id="playlist_off_air",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_off_air.m3u")
playlist_off_air = audio_to_stereo(id="stereo_playlist_off_air", playlist_off_air)

playlist_jingle_azura = playlist(id="playlist_jingle_azura",mode="randomize",reload_mode="watch",conservative=true,default_duration=10.,length=20.,"/var/azuracast/stations/lahmacun_radio/playlists/playlist_jingle_azura.m3u")
playlist_jingle_azura = audio_to_stereo(id="stereo_playlist_jingle_azura", playlist_jingle_azura)
playlist_jingle_azura = drop_metadata(playlist_jingle_azura)

# Standard Playlists
radio = random(id="lahmacun_radio_standard_playlists", weights=[3], [playlist_off_air])

# Once per x Minutes Playlists
radio = fallback(track_sensitive=true, [delay(60., playlist_jingle_azura), radio])

# AutoDJ Next Song Script
def azuracast_next_song() =
  uri = list.hd(get_process_lines("curl -s --request POST --url http://web/api/internal/1/nextsong --form api_auth="^quote("AZURA_KEY")^""), default="")
  log("AzuraCast Raw Response: #{uri}")
  
  if uri == "" or string.match(pattern="Error", uri) then
    log("AzuraCast Error: Delaying subsequent requests...")
    system("sleep 2")
    request.create("")
  else
    request.create(uri)
  end
end

dynamic = audio_to_stereo(request.dynamic(id="lahmacun_radio_next_song", timeout=20., azuracast_next_song))
radio = fallback(id="lahmacun_radio_autodj_fallback", track_sensitive = true, [dynamic, radio])

requests = audio_to_stereo(request.queue(id="lahmacun_radio_requests"))
radio = fallback(id="lahmacun_radio_requests_fallback", track_sensitive = true, [requests, radio])

radio = cue_cut(id="lahmacun_radio_radio_cue", radio)
add_skip_command(radio)

radio = fallback(id="lahmacun_radio_safe_fallback", track_sensitive = false, [radio, single(id="error_jingle", "/usr/local/share/icecast/web/error.mp3")])

# DJ Authentication
def dj_auth(user,password) =
  log("Authenticating DJ: #{user}")
  ret = list.hd(get_process_lines("curl -s --request POST --url http://web/api/internal/1/auth --form dj-user="^quote(user)^" --form dj-password="^quote(password)^" --form api_auth="^quote("AZURA_KEY")^""), default="")
  log("AzuraCast DJ Auth Response: #{ret}")
  bool_of_string(ret)
end

live_enabled = ref false

def live_connected(header) =
  log("DJ Source connected! #{header}")
  live_enabled := true
  ret = list.hd(get_process_lines("curl -s --request POST --url http://web/api/internal/1/djon --form api_auth="^quote("AZURA_KEY")^""), default="")
  log("AzuraCast Live Connected Response: #{ret}")
end

def live_disconnected() =
  log("DJ Source disconnected!")
  live_enabled := false
  ret = list.hd(get_process_lines("curl -s --request POST --url http://web/api/internal/1/djoff --form api_auth="^quote("AZURA_KEY")^""), default="")
  log("AzuraCast Live Disconnected Response: #{ret}")
end

# A Pre-DJ source of radio that can be broadcasted if needed
radio_without_live = radio
ignore(radio_without_live)

# Live Broadcasting
live = audio_to_stereo(input.harbor("/", id="lahmacun_radio_input_streamer", port=8005, user="shoutcast", auth=dj_auth, icy=true, max=30., buffer=5., icy_metadata_charset="UTF-8", metadata_charset="UTF-8", on_connect=live_connected, on_disconnect=live_disconnected))
ignore(output.dummy(live, fallible=true))
live = fallback(id="lahmacun_radio_live_fallback", track_sensitive=false, [live, blank(duration=2.)])

#LAHMACUN: CHANGE IN AZURA GENERATED CONFIG (COMMENT OUT NEXT LINE)
#radio = switch(id="lahmacun_radio_live_switch", track_sensitive=false, [({!live_enabled}, live), ({true}, radio)])

# Allow for Telnet-driven insertion of custom metadata.
radio = server.insert_metadata(id="custom_metadata", radio)

# Apply amplification metadata (if supplied)
radio = amplify(1., radio)

# LAHMACUN: THIS IS WHERE THE CUSTOM CONFIGURATION WOULD START
# Fade out off air music, play jingle, start playing show (unfaded)
def transition_into_show(j,a,b)
	sequence([fade.final(duration=5.,a),j,b])
end

# Stop show (faded), play jingle, fade in off air music
def transition_into_off(j,a,b)
	sequence([fade.final(duration=5.,a),j,fade.initial(duration=5., b)])
end

radio = switch(track_sensitive=false, transitions=[
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_show(playlist_jingle),
    transition_into_off(playlist_jingle_after_show) ], [
    #Live DJ
    ({!live_enabled}, live),
    #Monday
    ({1w and 6h-6h59m}, once(playlist_szarok_bele)),
    ({1w and 12h-12h59m}, once(playlist_a_who_say)),
    ({1w and 13h-16h59m}, once(playlist_dalmata_radio)),
    ({1w and 17h-17h59m}, once(playlist_szmuti_csorba)),
    ({1w and 18h-18h35m}, once(playlist_kezek_a_sebekben)),
    ({1w and 19h-20h59m}, once(playlist_erdenklang)),
    #Tuesday
    ({2w and 2h04m-4h30m}, once(playlist_lahmacun_gyorsnaszd_hdja)),
    ({2w and 12h-13h29m}, once(playlist_csinltam_neked_egy_vlogats_kazettt)),
    ({2w and 16h-16h59m}, once(playlist_azvlm)),
    ({2w and 17h-18h15m}, once(playlist_mmn_radio)),
    ({2w and 18h30m-19h29m}, once(playlist_havizaj)),
    ({2w and 20h-20h59m}, once(playlist_turmeric_acid)),
    #Wednesday
    ({3w and 14h-14h59m}, once(playlist_rt_hallgats)),
    ({3w and 15h-15h59m}, once(playlist_wikihow_adventure_cruise)),
    ({3w and 18h-18h59m}, once(playlist_geigercounterculture)),
    ({3w and 19h-19h59m}, once(playlist_cellz)),
    ({3w and 20h-20h59m}, once(playlist_eastern_daze)),
    #Thursday
    ({4w and 14h-14h59m}, once(playlist_konkret_riport)),
    ({4w and 15h-15h59m}, once(playlist_alternoon)),
    ({4w and 16h-17h59m}, once(playlist_lazy_calm_raga)),
    ({4w and 18h-18h59m}, once(playlist_dalmata_gergo_show)),
    ({4w and 19h-19h59m}, once(playlist_dodo)),
    ({4w and 20h-21h59m}, once(playlist_great_galactick_ghaul)),
    ({4w and 22h-22h59m}, once(playlist_gygyfrd)),
    #Friday
    ({5w and 17h-17h59m}, once(playlist_agybaj)),
    ({5w and 18h-19h59m}, once(playlist_mkd_mkd)),
    ({5w and 20h-21h59m}, once(playlist_arcadeok_alatt)),
    #Saturday
    ({6w and 16h-16h59m}, once(playlist_footwork_jimbob)),
    ({6w and 17h-18h59m}, once(playlist_rnr666)),
    ({6w and 19h-20h59m}, once(playlist_mood_sequence)),
    ({6w and 21h30m-22h29m}, once(playlist_brains_sublimating)),
    #Sunday
    ({7w and 11h-12h59m}, once(playlist_bambusz)),
    ({7w and 13h-16h59m}, once(playlist_donald_kacsa_klub)),
    ({7w and 19h-19h59m}, once(playlist_speakers_corner)),
    ({7w and 20h-20h59m}, once(playlist_sub_burek)),
    ({true}, radio) ])


# Send metadata changes back to AzuraCast
def metadata_updated(m) =
  if (m["song_id"] != "") then
    ret = list.hd(get_process_lines("curl -s --request POST --url http://web/api/internal/1/feedback --form song="^quote(m["song_id"])^" --form media="^quote(m["media_id"])^" --form playlist="^quote(m["playlist_id"])^" --form api_auth="^quote("AZURA_KEY")^""), default="")
    log("AzuraCast Feedback Response: #{ret}")
  end
end

radio = on_metadata(metadata_updated,radio)

# Local Broadcasts
output.icecast(%mp3(samplerate=44100, stereo=true, bitrate=128, id3v2=true), id="lahmacun_radio_local_1", host = "127.0.0.1", port = 8000, password = "ICECAST_KEY", mount = "/radio.mp3", name = "Lahmacun radio", description = "", genre = "", public = false, encoding = "UTF-8", radio)

# Remote Relays