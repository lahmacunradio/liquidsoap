# This is to make sure that we always do a fade transition:
def smart_crossfade (~start_next=5.,~fade_in=3.,~fade_out=3.,
                     ~default=(fun (a,b) -> sequence([a, b])),
                     ~high=-15., ~medium=-32., ~margin=4.,
                     ~width=2.,~conservative=true,s)
  fade.out = fade.out(type="sin",duration=fade_out)
  fade.in  = fade.in(type="sin",duration=fade_in)
  add = fun (a,b) -> add(normalize=false,[b, a])
  log = log(label="smart_crossfade")

  def transition(a,b,ma,mb,sa,sb)
    list.iter(fun(x)-> log(level=4,"Before: #{x}"),ma)
    list.iter(fun(x)-> log(level=4,"After : #{x}"),mb)
    log("Transition: crossed, fade-in, fade-out.")
    add(fade.out(sa),fade.in(sb))
  end

  smart_cross(width=width, duration=start_next, conservative=conservative,
              transition,s)
end

live = merge_tracks(live)

live = buffer(fallible=true,buffer=10.,live)


radio = switch(track_sensitive=false, [ 
    #Live DJ
    ({!live_enabled}, live),
    #Monday
    ({1w and 5h-6h}, once(playlist_szarok_bele)),  
    ({1w and 16h-17h}, once(playlist_szmuti_csorba)),  
    ({1w and 17h-18h}, once(playlist_kezek_a_sebekben)),  
    ({1w and 18h-20h}, once(playlist_erdenklang)),  
    #Tuesday
    ({2w and 11h-12h30m}, once(playlist_csinltam_neked_egy_vlogats_kazettt)),  
    ({2w and 16h-18h}, once(playlist_mmn_radio)),  
    ({2w and 19h-20h}, once(playlist_turmeric_acid)),  
    #Wednesday
    ({3w and 13h-14h}, once(playlist_rt_hallgats)),  
    ({3w and 14h-15h}, once(playlist_wikihow_adventure_cruise)),  
    ({3w and 17h-18h}, once(playlist_geigercounterculture)),  
    ({3w and 18h-19h}, once(playlist_cellz)),  
    #Thursday
    ({4w and 15h-17h}, once(playlist_lazy_calm_raga)),  
    ({4w and 17h-18h}, once(playlist_mt)),  
    ({4w and 19h-21h}, once(playlist_great_galactick_ghaul)),  
    #Friday
    ({5w and 16h-17h}, once(playlist_agybaj)),
    ({5w and 17h-19h}, once(playlist_mkd_mkd)),
    #Saturday
    ({6w and 16h-18h}, once(playlist_rnr666)),  
    #Sunday
    ({7w and 10h-12h}, once(playlist_bambusz)),  
    ({7w and 12h-16h}, once(playlist_donald_kacsa_klub)),  
    ({7w and 18h-19h}, once(playlist_sub_burek)),  
    ({true}, radio) ])


radio = smart_crossfade(radio)