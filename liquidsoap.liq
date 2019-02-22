def transition(j,a,b)
  add(normalize=false,
	  [ fade.initial(b),
	    sequence(merge=true,
	            [blank(duration=1.),j,fallback([])]),
	    fade.final(a) ])
end


radio = switch(track_sensitive=false, transitions=[ transition(playlist_jingle),transition(playlist_jingle) ], [ ({5w and 21h7m-21h17m}, once(playlist_inbetween_test1)), ({true}, radio) ])

