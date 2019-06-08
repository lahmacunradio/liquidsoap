<!-- RADIO code -->

<link rel="apple-touch-icon" sizes="180x180" href="/static/icons/production/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/static/icons/production/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/static/icons/production/favicon-16x16.png">
<link rel="manifest" href="/static/icons/production/site.webmanifest">
<link rel="mask-icon" href="/static/icons/production/safari-pinned-tab.svg" color="#5bbad5">
<link rel="shortcut icon" href="/static/icons/production/favicon.ico">
<meta name="msapplication-TileColor" content="#2196F3">
<meta name="msapplication-config" content="/static/icons/production/browserconfig.xml">
<meta name="theme-color" content="#2196F3">

<link rel="stylesheet" type="text/css" href="/static/js/bootgrid/jquery.bootgrid.min.css" />
<link rel="stylesheet" type="text/css" href="/static/dist/lib/fancybox/jquery-a2d4258429.fancybox.min.css" />
<link rel="stylesheet" type="text/css" href="/static/dist/light-7708c1e378.css" />
<script type="text/javascript" src="/static/dist/lib/jquery/jquery-220afd743d.min.js"></script>
<script type="text/javascript" src="/static/dist/lib/vue/vue-17e942ea08.min.js"></script>
<script type="text/javascript" src="/static/dist/lib/vue-i18n/vue-i18n-40a1d42f5a.min.js"></script>
<script type="text/javascript" src="/static/dist/lib/bootstrap/bootstrap-a454220fc0.bundle.min.js"></script>
<script type="text/javascript" src="/static/dist/lib/bootstrap-notify/bootstrap-notify-a02f92a499.min.js" defer></script>
<script type="text/javascript" src="/static/dist/app-d20352e929.js" defer></script>
<script type="text/javascript" src="/static/dist/material-c652fed16a.js"></script>
<script type="text/javascript" src="/static/js/bootgrid/jquery.bootgrid.updated.js"></script>
<script type="text/javascript" src="/static/dist/bootgrid-acbc545ec1.js"></script>
<script type="text/javascript" src="/static/dist/lib/fancybox/jquery-49a6b4d019.fancybox.min.js" defer></script>
<script type="text/javascript" src="/assets/playerfiles/radio_player.js"></script>
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
                    now_playing_uri: '/api/nowplaying/1'
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

    $('[data-fancybox]').fancybox({
        buttons: ['close']
    });

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


<div class="public-page">
    <div class="card">
        <div class="card-body">
            <h2 class="card-title">Lahmacun radio</h2>

            <div class="stations nowplaying">
                
<div id="station-nowplaying"></div>
            </div>
        </div>

        <div class="card-actions">
            <a class="btn btn-sm btn-outline-secondary" href="#modal-history" data-toggle="modal" data-target="#modal-history">
                <i class="material-icons" aria-hidden="true">history</i> Song History            </a>
                        <a class="btn btn-sm btn-outline-secondary" href="/public/lahmacun_radio/playlist/pls">
                <i class="material-icons" aria-hidden="true">file_download</i> Playlist            </a>
        </div>
    </div>
</div>

<div class="modal fade" id="modal-history" tabindex="-1" role="dialog" aria-labelledby="modal-history-label">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modal-history-label">Song History</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <ol type="1" id="station-history">
                    <li v-for="row in history">
                        <b>{{ row.song.title }}</b><br>
                        {{ row.song.artist }}
                    </li>
                </ol>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modal-request" tabindex="-1" role="dialog" aria-labelledby="modal-request-label">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="modal-request-label">Request a Song</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">

                <table class="data-table table table-striped" id="requests-table">
                    <thead>
                    <tr>
                        <th data-column-id="song_id" data-identifier="true" data-visible="false" data-visible-in-selection="false">ID</th>
                        <th data-column-id="song_title">Title</th>
                        <th data-column-id="song_artist">Artist</th>
                        <th data-column-id="song_album" data-visible="false">Album</th>
                        <th data-column-id="commands" data-formatter="commands" data-sortable="false">Actions</th>
                    </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- RADIO code -->
