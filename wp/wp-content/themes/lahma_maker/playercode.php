<!-- RADIO code -->


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

$(function() {
    i18n = new VueI18n({"locale":"en","messages":{"en":{"play_btn":"Play","pause_btn":"Pause","mute_btn":"Mute","volume_slider":"Volume","full_volume_btn":"Full Volume","album_art_alt":"Album Art"}}})
    radio_player = new Vue({
        i18n,
        el: '#station-nowplaying',
        render: function(createElement) {
            return createElement(RadioPlayer.default, {
                props: {
                    show_album_art: true,
                    now_playing_uri: 'https://dev.lahmacun.hu:8084/api/nowplaying/1'
                }
            });
        }
    });
});
</script>
<script type="text/javascript" nonce="BgC6RZJvXd9J/qcBqlIz7EFw">
$(function() {
    // Song history Vue component
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
        },
        created: function() {
            Vue.prototype.$eventHub.$on('np_updated', function(np_new) {
                songHistory.history = np_new.song_history;
            });
        }
    });

    // $('[data-fancybox]').swipebox();

    // Song request modal dialog component
	var request_dialog = $('#modal-request');

	request_dialog.on('show.bs.modal', function (event) {

		if (!request_dialog.data('request_loaded'))
		{
			var grid = $("#requests-table").bootgrid({
				ajax: true,
                ajaxSettings: {
                    method: "GET",
                    cache: false
                },
				rowSelect: false,
				caseSensitive: false,
				url: "/api/station/1/requests",
				formatters: {
					"commands": function(column, row) {
						return '<a class="btn btn-request btn-sm btn-primary" data-url="'+row.request_url+'" tabindex="0">Request</a>';
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
