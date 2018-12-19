<?php
function lahma_enqueue_styles() {

    $parent_style = 'html5blank';

    wp_enqueue_style( $parent_style, get_template_directory_uri() . '/style.css' );
    wp_enqueue_style( 'lahma',
        get_stylesheet_directory_uri() . '/style.css',
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

function lahma_enqueue_js() {
    wp_enqueue_script(
        'scripts',
        get_stylesheet_directory_uri() . '/js/scripts.js',
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
?>