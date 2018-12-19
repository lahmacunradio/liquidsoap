<div class="stations nowplaying">
<div class="player-wrap topwrap">
    <div id="station-nowplaying" class="media media-left">
		<div class="pull-left pr-2 pt-3">
			<a role="button" title="Play/Pause" href="#" data-url="https://www.lahmacun.hu:8084/radio/8000/radio.mp3" class="btn-audio"><i class="material-icons lg">play_circle_filled</i></a>
		</div>
	    <div class="pull-left pr-2" v-if="np.now_playing.song.art">
        <a v-bind:href="np.now_playing.song.art" data-fancybox target="_blank"><img v-bind:src="np.now_playing.song.art" alt="Album Cover" style="width: 50px; height: auto; border-radius: 5px;"></a>
    </div>
    <div class="media-body">
        <h4 class="media-heading might-overflow nowplaying-title">
            {{ np.now_playing.song.title }}
        </h4>
        <div class="nowplaying-artist might-overflow">
            {{ np.now_playing.song.artist }}
        </div>
        <div class="nowplaying-progress" v-if="time_display">
            {{ time_display }}
        </div>
    </div>
</div>
</div>

<div class="player-wrap bottomwrap">
	<div class="volumesign low">
		<i class="material-icons">volume_mute</i>
	</div>
		 <div class="progress jp-volume-bar d-inline-block" style="width: 290px;">
			 <div class="jp-volume-bar-value progress-bar" role="progressbar"></div>
		 </div>
	<div class="volumesign high">
		<i class="material-icons">volume_up</i>
	</div>


<!--
        <div class="float-left text-left flex-row" id="radio-player-controls">

             <a href="javascript:;" class="jp-mute" title="Mute">
                 <i class="material-icons">volume_off</i>
             </a>
             <a href="javascript:;" class="jp-unmute" title="Unmute">
                 <i class="material-icons">volume_up</i>
             </a>

         </div>
-->

    <!--<div id="radio-embedded-controls" class="jp-state-playing">
        <i class="fa fa-volume-up" aria-hidden="true"></i>
		<div class="progress jp-volume-bar" style="height: 15px; " title="Volume">
			<div class="jp-volume-bar-value progress-bar" role="progressbar" style="width: 84%;">

			</div>
		</div>-->
</div>

<div class="player-wrap creditswrap">
<a href="schedule.pdf" target="_blank">Schedule</a> | <a href="lahmacun.m3u" target="_blank">Stream</a> | <a href="mailto:lahmacun@mmmnmnm.com" target="_blank">Contact</a>
</div>


</div>