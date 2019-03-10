<!-- RADIO code -->

<?php

// load in the shows lister
get_template_part( "showslist" );

/*
server
if local - boerek
else lahmacun - lahmacun

then echo
*/

$development = "https://dev.lahmacun.hu";
$main = "https://www.lahmacun.hu";
$port = "8084";
$broadcastServer = "";
$home_url = "";

if ( in_array( $_SERVER['SERVER_NAME'], array( 'dev.lahmacun.hu') ) ) {
    $broadcastServer = "https://dev.lahmacun.hu:8084/";
    $home_url = "https://dev.lahmacun.hu";
} else {
    $broadcastServer = "https://www.lahmacun.hu:8084/";
    $home_url = "https://www.lahmacun.hu/";
}

// echo "<h1>".$broadcastServer."</h1>";

?>

<script type="text/javascript">
	var streamServer = "<?php echo $broadcastServer ?>";
</script>

<link rel="stylesheet" type="text/css" href="<?php echo $broadcastServer ?>static/js/bootgrid/jquery.bootgrid.min.css" />

<link rel="stylesheet" type="text/css" href="<?php echo $broadcastServer ?>static/dist/light-1d16f139b5.css" />

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js" crossorigin="anonymous" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.13/vue.min.js" crossorigin="anonymous" integrity="sha256-1Q2q5hg2YXp9fYlM++sIEXOcUb8BRSDUsQ1zXvLBqmA="></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js" crossorigin="anonymous" integrity="sha256-EGs9T1xMHdvM1geM8jPpoo8EZ1V1VRsmcJz8OByENLA="></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/js/bootstrap.min.js" crossorigin="anonymous" integrity="sha256-xaF9RpdtRxzwYMWg4ldJoyPWqyDPCRD0Cv7YEEe6Ie8="></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/node-waves/0.7.5/waves.min.js" crossorigin="anonymous" integrity="sha256-ICvFZLf7gslwfpvdxzQ8w8oZt0brzoFr8v2dXBecuLY=" defer></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mouse0270-bootstrap-notify/3.1.7/bootstrap-notify.min.js" crossorigin="anonymous" integrity="sha256-LlN0a0J3hMkDLO1mhcMwy+GIMbIRV7kvKHx4oCxNoxI=" defer></script>

<script type="text/javascript" src="<?php echo $broadcastServer ?>static/js/bootgrid/jquery.bootgrid.updated.js"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/store.js/1.3.20/store.min.js" crossorigin="anonymous" integrity="sha256-0jgHNEQo7sIScbcI/Pc5GYJ+VosKM1mJ+fI0iuQ1a9E=" defer></script>


<div class="page-minimal station-lahmacun_radio">

<script type="text/javascript" nonce="BQ4A2ZdmNz1kbMfKQl0nVf6H">

var nowPlaying;
var showsList_lookup = {};
var default_art_url = "<?php echo $home_url ?>/wp-content/uploads/defaultshowart.jpg";
var default_azuracast_art_url = "<?php echo $broadcastServer ?>static/img/generic_song.jpg";

$(function() {
    nowPlaying = new Vue({
        el: '#station-nowplaying',
        data: {"np":{ "live":{"is_live":"Is Live","streamer_name":"Streamer Name"},
                      "now_playing":
                      {"song":{"title":"Song Title","artist":"Song Artist","art":default_art_url},"is_request":false,"elapsed":0,"duration":0},
                      "song_history": [{"song": {"title": "Song Title","artist": "Song Artist"}}]
                    }
              },
        computed: {
            "show_title": function() {
              if (this.np.live.is_live)
                return this.np.live.streamer_name
              else
                return this.np.now_playing.song.title
            },
            "show_subtitle": function() {
              if (this.np.live.is_live)
                return ""
              else
                return this.np.now_playing.song.artist
            },
            "show_art_url": function() {
                if (this.np.live.is_live){
                    try_art_from_show = showsList_lookup[this.np.live.streamer_name] //try to find show artwork url based on streamer name
                    if (try_art_from_show == undefined) //show not found
                        return default_art_url // return default
                    else return try_art_from_show //resturn show art work
                }
                else {
                    song_title_json = this.np.now_playing.song.title;
                    song_artist_json = this.np.now_playing.song.artist;
                    artwork_json = this.np.now_playing.song.art; //art work url in json
                    if (artwork_json == default_azuracast_art_url){ //default url by azuracast (must be returning off air music with art work)
                        try_art_from_show = showsList_lookup[song_title_json] //try to find show artwork url based on show title
                        if (try_art_from_show == undefined){ //show not found
                            artwork_history_json = "";
                            (this.np.song_history).some(function (el){  //check song in history one by one; check by artist not by title!
                                if (el.song.artist == song_artist_json && el.song.art != default_azuracast_art_url){
                                    artwork_history_json = el.song.art;
                                    return true;
                                }
                            })
                            if (artwork_history_json != "")
                                return artwork_history_json
                            else 
                                return default_art_url  //fallback to default art URL
                        }
                        else 
                            return try_art_from_show //return show art work 
                    }
                    else  //it's a valid art work url by azuracast
                        return artwork_json
                }
            }
        }
    });

});
</script>
<script type="text/javascript" nonce="BQ4A2ZdmNz1kbMfKQl0nVf6H">
$(function() {

    function loadNowPlaying() {
        $.getJSON( streamServer + 'api/nowplaying/1', function(row) {
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

    function create_showsList_lookup(){
        showsList.forEach(function (el, i, arr) {
            var key = Object.keys(el)[0];
            showsList_lookup[key] = el[key];
        });
    }
    create_showsList_lookup();

});
</script>


<div class="public-page">
    <div class="card">
        <div class="card-body">


            <div class="stations nowplaying altalanosinfok">
                <div class="media media-left" id="station-nowplaying">
    <div class="pull-left pr-2 pt-3">
        <a class="btn-audio" role="button" title="Play/Pause" href="#" data-url="<?php echo $broadcastServer ?>radio/8000/radio.mp3?1543513066" >
            <i class="material-icons lg">play_circle_outline</i>
        </a>
    </div>
    <div class="pull-left pr-2" v-if="show_art_url">
        <a v-bind:href="show_art_url" data-fancybox target="_blank" class="swipebox programimage" ><img v-bind:src="show_art_url" alt="Album Cover" class="progimg"></a>
    </div>
    <div class="media-body">
        <h4 class="media-heading might-overflow nowplaying-title">
            {{ show_title }}
        </h4>
        <div class="nowplaying-artist might-overflow">
            {{ show_subtitle }}
        </div>
    </div>
</div>
            </div>

            <div class="radio-controls-standalone volumecontrolos" id="radio-player-controls">
                <a href="#" class="text-secondary jp-mute" title="Mute">
                    <i class="material-icons">volume_mute</i>
                </a>
                <input type="range" title="Volume" class="d-inline-block custom-range jp-volume-range" style="" id="jp-volume-range" min="0" max="100" step="1">
                <a href="#" class="text-secondary jp-volume-full" title="Full Volume">
                    <i class="material-icons">volume_up</i>
                </a>
            </div>

        </div>
        <div class="player-wrap creditswrap">
        <a href="schedule.pdf" target="_blank">Schedule</a> | <a href="lahmacun.m3u" target="_blank">Stream</a> | <a href="mailto:lahmacun@mmmnmnm.com" target="_blank">Contact</a>
        </div>

    </div>

</div>




</div>

<!-- RADIO code -->
