<?php


function lahma_maker_enqueue_styles() {

    $parent_style = 'maker';

    wp_enqueue_style( $parent_style, get_template_directory_uri() . '/style.css' );
    /* wp_enqueue_style( 'lahma_maker',
        get_stylesheet_directory_uri() . '/style.css',
        array( $parent_style ),
        wp_get_theme()->get('Version')
    ); */
}

add_action( 'wp_enqueue_scripts', 'lahma_maker_enqueue_styles' );


function add_modernizr() {
    wp_register_script('add_modernizr', "https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js", array('jquery'), false, false);
    wp_enqueue_script('add_modernizr');
}

add_action('wp_enqueue_scripts', 'add_modernizr');


function lahma_enqueue_js() {
    wp_enqueue_script(
        'scripts',
        get_stylesheet_directory_uri() . '/js/scripts.js',
        array( 'jquery' ),
        wp_get_theme()->get('Version')
    );
}

add_action( 'wp_enqueue_scripts', 'lahma_enqueue_js' );


/* Player styles + scripts */

function lahma_player_css() {
    wp_enqueue_style('lahmaplayer',  get_stylesheet_directory_uri() . '/radio_files/web-lahmacun-player.css');
}

add_action( 'get_footer', 'lahma_player_css' );

function lahma_enqueue_playerjs() {
    wp_enqueue_script(
        'player_scripts',
        get_stylesheet_directory_uri() . '/radio_files/web-radio_BG.js',
        array( 'jquery' ), null, true
    );
}

add_action( 'wp_enqueue_scripts', 'lahma_enqueue_playerjs' );

// Changing excerpt more

function new_excerpt_more($more) {
    return '';
}
add_filter('excerpt_more', 'new_excerpt_more', 21 );


 function excerpt_length_home( $length ) {
 if ( is_front_page() || is_home() ) {
 	return 30;
 } else {
 	return 50;
 }
 }
 add_filter( 'excerpt_length', 'excerpt_length_home' );


?>
