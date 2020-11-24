<?php
/**
 * The template used for displaying Arcsi on Shows page
 *
 * @package Maker
 */

// $server = 'https://arcsi.lahmacun.hu'; // prod server
$server = 'https://devarcsi.lahmacun.hu'; // dev server
// $server = 'http://docker.for.mac.localhost:40'; // local server

$showslug = get_post_field( 'post_name', get_post() );
$showjson = file_get_contents($server . '/arcsi/show/' . $showslug . '/archive');
// $showjson = file_get_contents('http://docker.for.mac.localhost:40/arcsi/show/mmn-radio/archive');;
$showarcsi = json_decode($showjson, true);

// print_r($showjson)

?>

<?php 
// if arcsi is available for the Show
if ($showjson) : ?>

<article class="arcsi-list" >

<h3>Arcsived shows for <?php the_title(); ?></h3>

<div class="arcsi-blokks">

<?php 
foreach($showarcsi as $archiveitem) :
    $showarchived = $archiveitem['archived'];
    $shownumber = $archiveitem['number'];
    $showname = $archiveitem['name'];
    $showimg = $archiveitem['image_url'];
    $showdescription = $archiveitem['description'];
    $showplaydate = $archiveitem['play_date'];
    $showid = $archiveitem['id'];
?>

<?php 
// if Episode is archived
if ($showarchived) { ?>

<div class="arcsiblokk">
    <div class="arcsiimage">
        <img src="<?php echo $showimg;?>" alt="<?php echo $showname; ?>">  
    </div>
    <div class="arcsiinfos">
        <div>
        <?php /* no episode number ?> 
        Episode nr. <?php echo $shownumber; ?> – 
        <?php */ ?> 
        <span>Aired on <?php echo $showplaydate; ?></span> </div>
        <h4><?php echo $showname; ?></h4>   
        <p><?php echo $showdescription; ?></p> 
        <div id="arcsi-audio-<?php echo $showid; ?>" class="arcsicontrols">
            <a class="arcsibutton arcsidown" href="<?php echo $server; ?>/arcsi/item/<?php echo $showid; ?>/download" target="_blank">
                <i class="fa fa-download" aria-hidden="true"></i> Download
            </a>              
            <a class="arcsibutton arcsilisten avoidAjax" href="<?php echo $server; ?>/arcsi/item/<?php echo $showid; ?>" title="<?php echo $showname; ?>">
                <i class="fa fa-headphones" aria-hidden="true"></i> Listen
            </a>
        </div>
    </div>
</div>
  
<?php
} // endif
endforeach;
?>
</div>

</article><!-- #post-## -->

<script>
// A $( document ).ready() block.
$( document ).ready(function() {

let audioLink = null
let audioTitle = ""

function stopAllAudio() {
    let sounds = document.getElementsByTagName('audio');
    for(i=0; i<sounds.length; i++) sounds[i].pause();
    $("audio.episodeplay").remove()
}

function arcsiPlay(episodeName) {
    document.body.classList.add("Playing");
    // console.log(episodeName + " playing")
    gtag('event', 'Arcsi play', {
        'event_category': episodeName,
        'event_label': 'Play state',
        'value': 1,
    });
}

function arcsiStop(episodeName) {
    document.body.classList.remove("Playing");
    // console.log(episodeName + " stopped")
    gtag('event', 'Arcsi stop', {
        'event_category': episodeName,
        'event_label': 'Play state',
        'value': 0,
    });
}

    jQuery(document).on("click", ".arcsilisten", function(e) {
        e.preventDefault();

        audioTitle = $(this).attr('title') // maybe from arcsi json is better?

        let listenLink = $(this).attr('href')
        // let listenLink = 'https://devarcsi.lahmacun.hu/arcsi/item/7'
        // let listenLink = 'https://streaming.lahmacun.hu/api/nowplaying/1'

        /* dummy audio link */
        audioLink="https://geekanddummy.com/wp-content/uploads/2014/02/ambient-noise-server-room.mp3"

        // console.log(audioTitle)

        let parentId = $(this).parent("div").attr("id")
        //console.log(parentId)

        fetch(listenLink) 
            .then(response => response.json())
            .then(json => {
                // console.log(json)
                audioLink = json.file_url // get audio link from ARCSI json
                // audioLink = json.station.listen_url // get DUMMY audio link from STATION json
            } )
            .then( () => { // assemble and insert player
                stopAllAudio()
                $(".arcsicontrols a").removeClass("hiddenelement")
                let $player = `
                    <audio controls id="arcsiplayer" class="episodeplay" title="${audioTitle}">
                        <source src="${audioLink}" type="audio/mpeg">
                        Your browser does not support the audio tag.
                    </audio>
                `
                $("#" + parentId).append($player)
                $("#" + parentId + " > a").addClass("hiddenelement")
            } )
            .then( () => { // player logistics
                let myPlayer = document.getElementById('arcsiplayer');
                myPlayer.addEventListener("play", (e) => {
                    arcsiPlay(audioTitle)
                })
                myPlayer.addEventListener("pause", (e) => {
                    arcsiStop(audioTitle)
                })
                myPlayer.addEventListener("ended", (e) => {
                    arcsiStop(audioTitle)
                })
                myPlayer.play();
            } )
            .catch( error => console.log(error) )
    
    });
});
</script>

<?php
// close if arcsi is available for the Show
endif; ?>
