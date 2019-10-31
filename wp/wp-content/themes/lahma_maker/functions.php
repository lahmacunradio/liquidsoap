<?php

add_image_size("post_page_img", 300); // with width 300px

function maker_enqueue_styles() {

    $parent_style = 'maker';
    $style_ver = filemtime( get_template_directory_uri() . '/style.css' );

    wp_enqueue_style( 
        $parent_style, 
        get_template_directory_uri() . '/style.css', 
        '', $style_ver );
    // wp_enqueue_style( 
    //     'lahma_maker', 
    //     get_stylesheet_directory_uri() . '/style.css',
    //     '', $style_ver );

}

function lahma_maker_enqueue_styles() {

    $main_style = 'lahma_maker';
    $style_ver = filemtime( get_stylesheet_directory() . '/style.css' );

    wp_enqueue_style( 
        $main_style, 
        get_stylesheet_directory_uri() . '/style.css', 
        '', $style_ver );

}

add_action( 'wp_enqueue_scripts', 'maker_enqueue_styles' );
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


// Changing excerpt more

function new_excerpt_more($more) {
    return '';
}
add_filter('excerpt_more', 'new_excerpt_more', 21 );

function the_excerpt_more_link( $excerpt ){
    $post = get_post();
    $excerpt .= '<span class="moresign"> ... </span>';
    // $excerpt .= '... <a class="readmorelink" href="'. get_permalink($post->ID) . '">Open news item »</a>';
    return $excerpt;
}
add_filter( 'the_excerpt', 'the_excerpt_more_link', 21 );

 function excerpt_length_home( $length ) {
 if ( is_front_page() || is_home() ) {
 	return 30;
 } else {
 	return 50;
 }
 }
 add_filter( 'excerpt_length', 'excerpt_length_home' );


 /* Add admin menu pages */

 if( is_admin() ){
     add_action( 'admin_menu', 'lahma_donate_menu' );
 }

 function lahma_donate_menu(){

   $page_title = 'Donate banner';
   $menu_title = 'Donate banner';
   $capability = 'edit_posts';
   $menu_slug  = 'lahma_donate_menu';
   $function   = 'lahma_donate_menu_page';
   $icon_url   = 'dashicons-smiley';
   $position   = 3;

   add_menu_page( $page_title,
                  $menu_title,
                  $capability,
                  $menu_slug,
                  $function,
                  $icon_url,
                  $position );
 }

 function lahma_donate_menu_page(){

 $contDonate = get_option("contDonate");
 $contShower = get_option("shower");
 $contShowCheck = $contShower == "show" ? "checked" : false;

 echo '<div class="wrap">';
 echo '<h1>Lahmacun Donate Options</h1>';
 echo '<form method="POST" action="?page=lahma_donate_menu">
 		<table>
 		<tr valign="top">
 		<td>
 			<h2>Donate datas</h2>
 			<p><label for="fenticsik">Text for the Donate part:</label><br/>
 			<input type="text" name="contDonate" size="500" style="width:100%;" value="';
 				echo $contDonate;
 				echo '" /></p>
 			<p>
      <input type="checkbox" name="shower" value="show" ';
        echo $contShowCheck;
        echo '> Show Donate Banner<br>
        </p>
 			</td>
 			</tr>
 			<tr valign="top"><td>

 			</td></tr>
 		</table>
    <input type="submit" name="submit" value="Submit" />

 	</form>';

echo "<br/>" . $contShower . " " .  $contShowCheck ;

 echo '</div>';

 if (isset($_POST["submit"])) {

 	$contDonate = esc_attr($_POST["contDonate"]);
 	update_option("contDonate", $contDonate);

 	$contShower = $_POST["shower"];
 	update_option("shower", $contShower);

 	echo '<script>parent.window.location.reload(true);</script>';
 }

}/* End Lahma Donate menu */



?>
