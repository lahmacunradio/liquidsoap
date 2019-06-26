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

/* Only for development, uncomment - Gas
$broadcastServer = "https://dev.lahmacun.hu:8084/";
$home_url = "https://dev.lahmacun.hu";
*/

// echo "<h1>".$broadcastServer."</h1>";

?>

<script type="text/javascript">
	var streamServer = "<?php echo $broadcastServer ?>";
</script>

<link rel="manifest" href="<?php echo get_stylesheet_directory_uri() ?>/assets/playerdependencies/site.webmanifest">
<meta name="msapplication-TileColor" content="#2196F3">
<meta name="msapplication-config" content="<?php echo get_stylesheet_directory_uri() ?>/assets/playerdependencies/browserconfig.xml">
<meta name="theme-color" content="#2196F3">
<link rel="stylesheet" type="text/css" href="<?php echo get_stylesheet_directory_uri() ?>/assets/playerdependencies/jquery.bootgrid.min.css" />
<link rel="stylesheet" type="text/css" href="<?php echo get_stylesheet_directory_uri() ?>/assets/playerdependencies/light-7708c1e378.css" />
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() ?>/assets/playerdependencies/vue-17e942ea08.min.js"></script>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() ?>/assets/playerdependencies/vue-i18n-40a1d42f5a.min.js"></script>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() ?>/assets/playerdependencies/bootstrap-a454220fc0.bundle.min.js"></script>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() ?>/assets/playerdependencies/bootstrap-notify-a02f92a499.min.js" defer></script>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() ?>/assets/playerdependencies/app-7ceeed727b.js" defer></script>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() ?>/assets/playerdependencies/material-c652fed16a.js"></script>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() ?>/assets/playerdependencies/jquery.bootgrid.updated.js"></script>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() ?>/assets/playerdependencies/bootgrid-acbc545ec1.js"></script>
<script type="text/javascript" src="<?php echo get_stylesheet_directory_uri() ?>/assets/playerfiles/dist/radio_player.js"></script>

</head>

<body class="page-minimal station-lahmacun_radio">
<script type="text/javascript" nonce="BgC6RZJvXd9J/qcBqlIz7EFw">
Vue.prototype.$eventHub = new Vue();</script>
<script type="text/javascript" nonce="BgC6RZJvXd9J/qcBqlIz7EFw">

var i18n, radio_player;
var showsList_lookup = {};
var default_art_url = "<?php echo $home_url ?>/wp-content/uploads/defaultshowart.jpg";
var default_azuracast_art_url = "<?php echo $broadcastServer ?>static/img/generic_song.jpg";

function create_showsList_lookup(){
    showsList.forEach(function (el, i, arr) {
        var key = Object.keys(el)[0];
        showsList_lookup[key] = el[key];
    });
}
create_showsList_lookup();

$(function() {
    i18n = new VueI18n({"locale":"en","messages":{"en":{"play_btn":"Play","pause_btn":"Pause","mute_btn":"Mute","volume_slider":"Volume","full_volume_btn":"Full Volume","album_art_alt":"Album Art"}}})
    radio_player = new Vue({
        i18n,
        el: '#station-nowplaying',
        render: function(createElement) {
            return createElement(RadioPlayer.default, {
                props: {
                    show_album_art: true,
                    now_playing_uri: streamServer + 'api/nowplaying/1'
                }
            });
        }
    });
});
</script>


<div id="playerdiv">
<div class="station-lahmacun_radio">
<div class="public-page">
    <div class="card">
        <div class="card-body">

            <div class="stations nowplaying">

<div id="station-nowplaying"></div>
            </div>
        </div>

    </div>
</div>
</div>
</div>

<!-- RADIO code -->
