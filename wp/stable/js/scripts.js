(function ($, root, undefined) {
	
	$(function () {
		
		'use strict';
		
		// DOM ready, take it away
		var nowPlaying;

		function iterateTimer() {
    		var np_elapsed = nowPlaying.np.now_playing.elapsed;
    		var np_total = nowPlaying.np.now_playing.duration;

    		if (np_elapsed < np_total) {
        		nowPlaying.np.now_playing.elapsed = np_elapsed + 1;
    		}
		}

		function formatTime(time) {
			var sec_num = parseInt(time, 10);

			var hours = Math.floor(sec_num / 3600);
			var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
			var seconds = sec_num - (hours * 3600) - (minutes * 60);

			if (hours < 10) {
				hours = "0" + hours;
			}
			if (minutes < 10) {
				minutes = "0" + minutes;
			}
			if (seconds < 10) {
				seconds = "0" + seconds;
			}
			return (hours !== "00" ? hours + ':' : "") + minutes + ':' + seconds;
		}


    nowPlaying = new Vue({
        el: '#station-nowplaying',
        data: {"np":{"now_playing":{"song":{"title":"Song Title","artist":"Song Artist","art":"\/static\/img\/generic_song.jpg"},"is_request":false,"elapsed":0,"duration":0}}},
        computed: {
            "time_display": function() {
                var time_played = this.np.now_playing.elapsed;
                var time_total = this.np.now_playing.duration;

                if (!time_total) {
                    return null;
                }

                if (time_played > time_total) {
                    time_played = time_total;
                }

                if (this.np.now_playing.song.title == "No show no show"){
                  return "OFF AIR"
                } else {
                  return formatTime(time_played) + ' / ' + formatTime(time_total);
                }

            }
        }
    });

    setInterval(iterateTimer, 1000);

    function loadNowPlaying() {
        $.getJSON('https://www.lahmacun.hu:8083/api/nowplaying/1', function(row) {
            nowPlaying.np = row;

            if ('mediaSession' in navigator) {
                navigator.mediaSession.metadata = new MediaMetadata({
                    title: row.now_playing.song.title,
                    artist: row.now_playing.song.artist,
                    artwork: [
                        { src: row.now_playing.song.art }
                    ]
                });
            }

            setTimeout(loadNowPlaying, 15000);
        }).fail(function() {
            setTimeout(loadNowPlaying, 30000);
        });
    }

    loadNowPlaying();
	});
	
})(jQuery, this);
