(function ($, root, undefined) {
    /**
 * Radio Player Script
 */

    function is_touch_device() {
        if(window.matchMedia("(any-pointer: coarse)").matches) {
            // touchscreen
            //console.log( "touch!" );
            $("html").addClass("ismobile");
        }
    }

    // A $( document ).ready() block.
    $( document ).ready(function() {
        // console.log( "ready!" );
        is_touch_device();
    });

    var volume = 55,
        is_playing = false,
        player,
        $player,
        nowPlaying;

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

    function stopAllPlayers() {
        player.pause();
        player.src = '';

        is_playing = false;

        $('.btn-audio').each(function() {
            var play_icon = $(this).removeClass('playing').find('i');
            if (play_icon.hasClass('material-icons')) {
                play_icon.text('play_circle_outline');
            } else {
                play_icon.removeClass('zmdi-stop').addClass('zmdi-play');
                play_icon.text('play_arrow');
            }
        });

        $('#radio-player-controls').removeClass('jp-state-playing');
    }

    function setVolume(new_volume)
    {
        volume = parseInt(new_volume);

        $('.jp-volume-bar-value').css('width', volume+'%');
        $('.jp-volume-range').val(volume);

        // Set volume logarithmically based on original input.
        player.volume = Math.min((Math.exp(volume/100)-1)/(Math.E-1), 1);

        if (store.enabled)
            store.set('player_volume', volume);
    }

    function playAudio(source_url)
    {
        player.src = source_url;
        player.play().catch(function(error) {
            console.error(error);
            stopAllPlayers();
        });
    }

    function handlePlayClick(audio_source)
    {
        btn = $('.btn-audio[data-url="'+audio_source+'"]');

        if (btn.hasClass('playing')) {
            stopAllPlayers();
        } else {
            if (is_playing) {
                stopAllPlayers();
            }

            playAudio(audio_source);

            var play_icon = btn.addClass('playing').find('i');
            if (play_icon.hasClass('material-icons')) {
                play_icon.text('pause_circle_outline');
            } else {
                play_icon.removeClass('zmdi-play').addClass('zmdi-stop');
            }
        }
    }

    $(function() {

        // Check webstorage for existing volume preference.
        if (store.enabled && store.get('player_volume') !== undefined) {
            volume = store.get('player_volume', volume);
        }

        // Check the query string if browser supports easy query string access.
        if (typeof URLSearchParams !== 'undefined') {
            var urlParams = new URLSearchParams(window.location.search);
            if (urlParams.has('volume')) {
                volume = parseInt(urlParams.get('volume'));
            }
        }

        $('.btn-audio').on('click', function(e) {
            e.preventDefault();
            handlePlayClick($(this).data('url'));
            return false;
        });

        // Create audio element.
        player = document.createElement('audio');
        $player = $(player);

        setVolume(volume);

        // Handle events.
        $player.on('play', function(e) {
            is_playing = true;

            $('.jp-unmute').hide();
            $('#radio-player-controls').addClass('jp-state-playing');
        });

        $player.on('ended', function(e) {
            stopAllPlayers();
        });

        if ('mediaSession' in navigator) {
            navigator.mediaSession.setActionHandler('pause', function() {
                stopAllPlayers();
            });
        }

        // Handle button clicks.
        $('.jp-pause').on('click', function(e) {
            stopAllPlayers();
        });

        $('.jp-mute').on('click', function(e) {
            setVolume(0);
        });

        $('.jp-unmute').on('click', function(e) {
            setVolume(55);
        });

        $('.jp-volume-full').on('click', function(e) {
            setVolume(100);
        });

        $('.jp-volume-bar').on('click', function(e) {
            var $bar = $(e.currentTarget),
                offset = $bar.offset(),
                x = e.pageX - offset.left,
                w = $bar.width(),
                y = $bar.height() - e.pageY + offset.top,
                h = $bar.height();

            setVolume(Math.round((x/w) * 100));
        });

        $('.jp-volume-range').on('change', function(e) {
            setVolume($(this).val());
        });

        // Handle autoplay.
        $('.btn-audio[data-autoplay="true"]:first').click();

        nowPlaying = new Vue({
            el: '#station-nowplaying',
            data: {"np":{ "live":{"is_live":"Is Live","streamer_name":"Streamer Name"},
                          "now_playing":
                          {"song":{"title":"Song Title","artist":"Song Artist","art":"http:\/\/178.238.217.146:8083\/static\/img\/generic_song.jpg"},"is_request":false,"elapsed":0,"duration":0}
                        }
                  },
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
    
                    return formatTime(time_played) + ' / ' + formatTime(time_total);
                },
                "show_title": function() {
                  if (this.np.live.is_live)
                    return this.np.live.streamer_name
                  else
                    return this.np.now_playing.song.title
                }
            }
        });
    
        setInterval(iterateTimer, 1000);

        songHistory = new Vue({
            el: '#station-history',
            data: {
                history: [
                    {
                        song: {
                            title: 'Song Title',
                            artist: 'Song Artist'
                        }
                    }
                ]
            }
        });
    
        function loadNowPlaying() {
            $.getJSON('https://www.lahmacun.hu:8084/api/nowplaying/1', function(row) {
                nowPlaying.np = row;
                songHistory.history = row.song_history;
    
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
    
        $('[data-fancybox]').fancybox({
            buttons: ['close']
        });
    
        var request_dialog = $('#modal-request');
    
        request_dialog.on('show.bs.modal', function (event) {
    
            if (!request_dialog.data('request_loaded'))
            {
                var grid = $("#requests-table").bootgrid({
                    ajax: true,
                    rowSelect: false,
                    caseSensitive: false,
                    url: "/api/station/1/requests",
                    formatters: {
                        "commands": function(column, row) {
                            return '<a class="btn btn-request btn-sm btn-primary" data-url="'+row.request_url+'">Request</a>';
                        }
                    }
                }).on("loaded.rs.jquery.bootgrid", function()
                {
                    /* Executes after data is loaded and rendered */
                    grid.find(".btn-request").on("click", function(e)
                    {
                        e.preventDefault();
                        request_dialog.modal('hide');
    
                        $.ajax({
                            dataType: "json",
                            url: $(this).data('url')
                        }).done(function(data) {
                            notify(data, 'success');
                        }).fail(function(jqXhr) {
                            notify('Error: ' + jqXhr.responseJSON, 'danger');
                        });
    
                        return false;
                    });
                });
    
                request_dialog.data('request_loaded', true);
            }
        });
    });
})(jQuery, this);
