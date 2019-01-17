<?php
function lahma_enqueue_styles() {

    $parent_style = 'html5blank';

    wp_enqueue_style( $parent_style, get_template_directory_uri() . '/style.css' );
    wp_enqueue_style( 'lahma',
        get_stylesheet_directory_uri() . '/static/css/style.css',
        array( $parent_style ),
        wp_get_theme()->get('Version')
    );
}

function lahma_fonts() {
    wp_enqueue_style('material-icons', 'https://fonts.googleapis.com/icon?family=Material+Icons');
}

function lahma_scripts() {
    wp_enqueue_script('vuejs', 'https://cdn.jsdelivr.net/npm/vue');
}

function lahma_player_bootgrid() {
    wp_enqueue_style('css_bootgrid', 'https://www.lahmacun.hu:8084/static/js/bootgrid/jquery.bootgrid.min.css');
    wp_enqueue_script('js_bootgrid', 'https://www.lahmacun.hu:8084/static/dist/bootgrid-28de3d6f6d.js');
    wp_enqueue_script('js_bootgrid_jquery', 'https://www.lahmacun.hu:8084/static/js/bootgrid/jquery.bootgrid.updated.js');
}

function lahma_player_fancybox() {
    wp_enqueue_style('css_fancybox', 'https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.2.5/jquery.fancybox.min.css');
    wp_enqueue_script('js_fancybox_jquery', 'https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.2.5/jquery.fancybox.min.js');
}

function lahma_player_light() {
    wp_enqueue_style('light', 'https://www.lahmacun.hu:8084/static/dist/light-31b5d53a55.css');
}

function lahma_player_popper() {
    wp_enqueue_script('popper', 'https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js');
}

function lahma_player_js_bootstrap() {
    wp_enqueue_script('js_bootstrap', 'https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/js/bootstrap.min.js');
    wp_enqueue_script('js_bootstrap_notify', 'https://cdnjs.cloudflare.com/ajax/libs/mouse0270-bootstrap-notify/3.1.7/bootstrap-notify.min.js');
}

function lahma_player_waves() {
    wp_enqueue_script('waves', 'https://cdnjs.cloudflare.com/ajax/libs/node-waves/0.7.5/waves.min.js');
}

function lahma_player_app() {
    wp_enqueue_script('player_app', 'https://www.lahmacun.hu:8084/static/dist/app-74723ca8d4.js');
}

function lahma_player_store() {
    wp_enqueue_script('store', 'https://cdnjs.cloudflare.com/ajax/libs/store.js/1.3.20/store.min.js');
}

function lahma_enqueue_js() {
    wp_enqueue_script(
        'scripts',
        get_stylesheet_directory_uri() . '/static/js/scripts.js',
        array(),
        wp_get_theme()->get('Version')
    );
}

add_filter('nav_menu_link_attributes', function($atts, $item, $args) {
    // if ( $args->has_children )
    // {
        $atts['tabindex'] = '1';
        
    // }

    return $atts;
}, 10, 3);
add_action( 'wp_enqueue_scripts', 'lahma_enqueue_styles' );
add_action( 'wp_enqueue_scripts', 'lahma_fonts' );
add_action( 'wp_enqueue_scripts', 'lahma_scripts' );
add_action( 'wp_enqueue_scripts', 'lahma_enqueue_js' );
// add_action( 'wp_enqueue_scripts', 'lahma_player_bootgrid' );
add_action( 'wp_enqueue_scripts', 'lahma_player_fancybox' );
// add_action( 'wp_enqueue_scripts', 'lahma_player_light' );
// add_action( 'wp_enqueue_scripts', 'lahma_player_popper' );
// add_action( 'wp_enqueue_scripts', 'lahma_player_js_bootstrap' );
// add_action( 'wp_enqueue_scripts', 'lahma_player_waves' );
// add_action( 'wp_enqueue_scripts', 'lahma_player_app' );
add_action( 'wp_enqueue_scripts', 'lahma_player_store' );
?>