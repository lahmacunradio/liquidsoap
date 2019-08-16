<template>
  <div class="stations nowplaying altalanosinfok">
    <div class="radio-player-widget">
        <div class="now-playing-details">

          <div class="radio-controls">
              <div class="radio-control-play-button" v-if="is_playing">
                  <a href="#" role="button" :title="$t('pause_btn')" :aria-label="$t('pause_btn')" @click.prevent="toggle()">
                      <i class="material-icons lg" aria-hidden="true">pause_circle_outline</i>
                  </a>
              </div>
              <div class="radio-control-play-button" v-else>
                  <a href="#" role="button" :title="$t('play_btn')" :aria-label="$t('play_btn')" @click.prevent="toggle()">
                      <i class="material-icons lg" aria-hidden="true">play_circle_outline</i>
                  </a>
              </div>

            <div class="now-playing-art" v-if="show_album_art && np.now_playing.song.art">
                <a v-bind:href="show_art_url" class="swipebox programimage" target="_blank" rel="playerimg">
                  <div v-if="np.live.is_live || (np.now_playing.playlist !== 'OFF AIR' && np.now_playing.playlist !== 'Between Shows' && np.now_playing.playlist !== 'Jingle' && np.now_playing.playlist !== 'Jingle AFTER SHOW')" class="onair">On air</div>
                    <img class="progimg" v-bind:src="show_art_url" :alt="$t('album_art_alt')">
                </a>
            </div>

            <div class="now-playing-main">
              <div class="media-body">
                <div v-if="np.now_playing.song.title !== ''">
                    <h4 v-bind:title="show_title" class="now-playing-title">
                      <a v-if="show_check == true" v-bind:href="show_url">{{ show_title }}</a>
                      <span v-if="show_check == false">{{ show_title }}</span>
                    </h4>
                    <h5 v-bind:title="show_subtitle" class="now-playing-artist">{{ show_subtitle }}</h5>
                </div>
                <div v-else>
                    <h4 class="now-playing-title">{{ show_title }}</h4>
                </div>
              </div>

                <div class="time-display" v-if="time_display_played" style="display:none;">
                    <div class="time-display-played text-secondary">
                        {{ time_display_played }}
                    </div>
                    <div class="time-display-progress">
                        <div class="progress">
                            <div class="progress-bar bg-secondary" role="progressbar" v-bind:style="{ width: time_percent+'%' }"></div>
                        </div>
                    </div>
                    <div class="time-display-total text-secondary">
                        {{ time_display_total }}
                    </div>
                </div>
            </div>
        </div>


            <div class="radio-control-select-stream" style="display:none;">
                <div v-if="this.streams.length > 1" class="dropdown">
                    <button class="btn btn-sm btn-outline-primary dropdown-toggle" type="button" id="btn-select-stream" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        {{ current_stream.name }}
                    </button>
                    <div class="dropdown-menu" aria-labelledby="btn-select-stream">
                        <a class="dropdown-item" v-for="stream in streams" href="javascript:;" @click="switchStream(stream)">
                            {{ stream.name }}
                        </a>
                    </div>
                </div>
            </div>
        </div>

          <div class="radio-controls-standalone volumecontrolos" id="radio-player-controls">
            <div class="radio-control-mute-button">
                <a href="#" class="text-secondary" :title="$t('mute_btn')" @click.prevent="volume = 0">
                    <i class="material-icons" aria-hidden="true">volume_mute</i>
                </a>
            </div>
            <div class="radio-control-volume-slider">
                <input type="range" :title="$t('volume_slider')" class="custom-range jp-volume-range" min="0" max="100" step="1" v-model="volume" id="jp-volume-range">
            </div>
            <div class="radio-control-max-volume-button">
                <a href="#" class="text-secondary" :title="$t('full_volume_btn')" @click.prevent="volume = 100">
                    <i class="material-icons" aria-hidden="true">volume_up</i>
                </a>
            </div>
          </div>
        </div>
    </div>
</template>

<style lang="scss">
.radio-player-widget {
    .now-playing-details {
        display: flex;
        align-items: center;
        .now-playing-art {
              margin-right: 0.7rem;

        }
        .now-playing-main {
            flex: 1;
            min-width: 0;
        }
        h4, h5 {
            margin: 0;
            line-height: 1.3;
        }
        h4 {
            font-size: 15px;
        }
        h5 {
            font-size: 13px;
            font-weight: normal;
        }
        .now-playing-title,
        .now-playing-artist {
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
            &:hover {
                text-overflow: clip;
                /* white-space: normal; */
                word-break: break-all;
            }
        }
        .time-display {
            font-size: 10px;
            margin-top: .25rem;
            flex-direction: row;
            align-items: center;
            display: flex;
            .time-display-played {
                margin-right: .5rem;
            }
            .time-display-progress {
                flex: 1 1 auto;
                .progress-bar {
                    -webkit-transition: width 1s; /* Safari */
                    transition: width 1s;
                    transition-timing-function: linear;
                }
            }
            .time-display-total {
                margin-left: .5rem;
            }
        }
    }
    hr {
        margin-top: .5rem;
        margin-bottom: .5rem;
    }
    i.material-icons {
        line-height: 1;
    }
    .radio-controls {
        display: flex;
        flex-direction: row;
        .radio-control-play-button {
            margin-right: 0.5em;
            margin-top: 0.5em;
        }
        .radio-control-select-stream {
            flex: 1 1 auto;
        }
        .radio-control-mute-button,
        .radio-control-max-volume-button {
            flex-shrink: 0;
        }
        .radio-control-volume-slider {

        }
    }
}
</style>

<script>
import axios from 'axios';
import store from 'store';
export default {
    props: {
        now_playing_uri: String,
        show_album_art: Boolean
    },
    data: function() {
        return {
            "np": {
                "live": {
                    "is_live":"Is Live",
                    "streamer_name":"Streamer Name"
                },
                "station": {
                    "listen_url": '',
                    "mounts": [],
                    "remotes": []
                },
                "now_playing": {
                    "song": {
                        "title": "Song Title",
                        "artist": "Song Artist",
                        "art": "",
                    },
                    "is_request": false,
                    "elapsed": 0,
                    "duration": 0
                },
                "song_history": {},
            },
            "is_playing": false,
            "volume": 55,
            "current_stream": {
                "name": "",
                "url": ""
            },
            "audio": null,
            "np_timeout": null,
            "clock_interval": null,
        };
    },
    created: function() {
        this.audio = document.createElement('audio');
        this.clock_interval = setInterval(this.iterateTimer, 1000);
        // Handle audio errors.
        this.audio.onerror = (e) => {
            if (e.target.error.code === e.target.error.MEDIA_ERR_NETWORK && this.audio.src !== '') {
                console.log('Network interrupted stream. Automatically reconnecting shortly...');
                setTimeout(this.play, 5000);
            }
        };
        this.audio.onended = () => {
            if (this.is_playing) {
                this.stop();
                console.log('Network interrupted stream. Automatically reconnecting shortly...');
                setTimeout(this.play, 5000);
            } else {
                this.stop();
            }
        };
        // Allow pausing from the mobile metadata update.
        if ('mediaSession' in navigator) {
            navigator.mediaSession.setActionHandler('pause', () => {
                this.stop();
            });
        }
        // Check webstorage for existing volume preference.
        if (store.enabled && store.get('player_volume') !== undefined) {
            this.volume = store.get('player_volume', this.volume);
        }
        // Check the query string if browser supports easy query string access.
        if (typeof URLSearchParams !== 'undefined') {
            var urlParams = new URLSearchParams(window.location.search);
            if (urlParams.has('volume')) {
                this.volume = parseInt(urlParams.get('volume'));
            }
        }
        this.checkNowPlaying();
    },
    computed: {
        "streams": function() {
            let all_streams = [];
            this.np.station.mounts.forEach(function (mount) {
                all_streams.push({
                    "name": mount.name,
                    "url": mount.url
                });
            });
            this.np.station.remotes.forEach(function(remote) {
                all_streams.push({
                    "name": remote.name,
                    "url": remote.url
                })
            });
            return all_streams;
        },
        "time_percent": function() {
            let time_played = this.np.now_playing.elapsed;
            let time_total = this.np.now_playing.duration;
            if (!time_total) {
                return 0;
            }
            if (time_played > time_total) {
                return 100;
            }
            return (time_played / time_total) * 100;
        },
        "time_display_played": function() {
            let time_played = this.np.now_playing.elapsed;
            let time_total = this.np.now_playing.duration;
            if (!time_total) {
                return null;
            }
            if (time_played > time_total) {
                time_played = time_total;
            }
            return this.formatTime(time_played);
        },
        "time_display_total": function() {
            let time_total = this.np.now_playing.duration;
            return (time_total) ? this.formatTime(time_total) : null;
        },
        "show_title": function() {
            if (this.np.live.is_live)
            return this.np.live.streamer_name
            else
            return this.np.now_playing.song.title
        },
        "show_subtitle": function() {
            if (this.np.live.is_live)
            return this.np.now_playing.song.title
            else
            return this.np.now_playing.song.artist
        },
        "show_check": function() {
            if (this.np.now_playing.playlist !== 'OFF AIR' && this.np.now_playing.playlist !== 'Between Shows' && this.np.now_playing.playlist !== 'Jingle' && this.np.now_playing.playlist !== 'Jingle AFTER SHOW') {
              return true;
            } else {
              return false;
            }
        },
        "show_url": function() {
            let try_url_from_show = showsURLList_lookup[this.np.now_playing.song.title];
            let default_url = "https://www.lahmacun.hu/";
            // console.log( try_url_from_show );
            if (try_url_from_show == undefined) //show not found
                return default_url; // return default
            else return try_url_from_show //return show URL
        },
        "show_art_url": function() {
            if (this.np.live.is_live){
                let try_art_from_show = showsList_lookup[this.np.live.streamer_name] //try to find show artwork url based on streamer name
                if (try_art_from_show == undefined) //show not found
                    return default_art_url // return default
                else return try_art_from_show //resturn show art work
            }
            else {
                let song_title_json = this.np.now_playing.song.title;
                let song_artist_json = this.np.now_playing.song.artist;
                let artwork_json = this.np.now_playing.song.art; //art work url in json
                if (artwork_json == default_azuracast_art_url){ //default url by azuracast (must be returning off air music with art work)
                    let try_art_from_show = showsList_lookup[song_title_json] //try to find show artwork url based on show title
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
    },
    watch: {
        "volume": function(volume) {
            this.audio.volume = Math.min((Math.exp(volume/100)-1)/(Math.E-1), 1);
            if (store.enabled) {
                store.set('player_volume', volume);
            }
        },
    },
    methods: {
        "play": function() {
            this.audio.src = this.current_stream.url;
            this.audio.play();
            this.is_playing = true;
        },
        "stop": function() {
            this.is_playing = false;
            this.audio.pause();
            this.audio.src = '';
        },
        "toggle": function() {
            if (this.is_playing) {
                this.stop();
            } else {
                this.play();
            }
        },
        "switchStream": function(new_stream) {
            this.current_stream = new_stream;
            this.play();
        },
        "checkNowPlaying": function() {
            axios.get(this.now_playing_uri).then((response) => {
                let np_new = response.data;
                this.np = np_new;
                // Set a "default" current stream if none exists.
                if (this.current_stream.url === '' && np_new.station.listen_url !== '' && this.streams.length > 0) {
                    let current_stream = null;
                    this.streams.forEach(function(stream) {
                        if (stream.url === np_new.station.listen_url) {
                            current_stream = stream;
                        }
                    });
                    this.current_stream = current_stream;
                }
                // Update the browser metadata for browsers that support it (i.e. Mobile Chrome)
                if ('mediaSession' in navigator) {
                    navigator.mediaSession.metadata = new MediaMetadata({
                        title: np_new.now_playing.song.title,
                        artist: np_new.now_playing.song.artist,
                        artwork: [
                            { src: np_new.now_playing.song.art }
                        ]
                    });
                }
                Vue.prototype.$eventHub.$emit('np_updated', np_new);
            }).catch((error) => {
                console.error(error);
            }).then(() => {
                clearTimeout(this.np_timeout);
                this.np_timeout = setTimeout(this.checkNowPlaying, 15000);
            });
        },
        "iterateTimer": function() {
            let np_elapsed = this.np.now_playing.elapsed;
            let np_total = this.np.now_playing.duration;
            if (np_elapsed < np_total) {
                this.np.now_playing.elapsed = np_elapsed + 1;
            }
        },
        "formatTime": function(time) {
            let sec_num = parseInt(time, 10);
            let hours = Math.floor(sec_num / 3600);
            let minutes = Math.floor((sec_num - (hours * 3600)) / 60);
            let seconds = sec_num - (hours * 3600) - (minutes * 60);
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
    }
}
</script>
