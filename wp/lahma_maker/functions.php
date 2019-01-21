<?php

function lahma_maker_enqueue_styles() {

    $parent_style = 'maker';

    wp_enqueue_style( $parent_style, get_template_directory_uri() . '/style.css' );
    wp_enqueue_style( 'lahma_maker',
        get_stylesheet_directory_uri() . '/style.css',
        array( $parent_style ),
        wp_get_theme()->get('Version')
    );
}

add_action( 'wp_enqueue_scripts', 'lahma_maker_enqueue_styles' );

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


?>
