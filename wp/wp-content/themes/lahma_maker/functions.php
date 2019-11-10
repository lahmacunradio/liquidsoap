<?php

add_image_size("post_page_img", 300); // with width 300px
add_image_size("nav_thumb", 80, 80, true); // nav thumb 80x80

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
    $scripts_ver = filemtime(get_stylesheet_directory() . '/js/scripts.js');
    wp_enqueue_script(
        'scripts',
        get_stylesheet_directory_uri() . '/js/scripts.js',
        array( 'jquery' ),
        $scripts_ver
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

 $contCampaignText = get_option("contCampaignText");
 $contCampaign = get_option("contCampaign");
 $contCampaignID = get_page_by_path($contCampaign, number, "campaign")->ID;
 $contCampaignButton = get_option("contCampaignButton");
 $contShowCampaign = get_option("showCampaign");
 $contShowCampaignCheck = $contShowCampaign == "show" ? "checked" : false;

 $contCampaignStartAmount = get_option("CampaignStart");
 $contCampaignEndAmount = get_option("CampaignEnd");

 echo '<div class="wrap">';
 echo '<h1>Lahmacun Donate Options</h1>';
 echo '<form method="POST" action="?page=lahma_donate_menu">
 		<table>
 		<tr valign="top">
 		<td>
             <h2>Donate datas</h2>
        <p>
        <input type="checkbox" name="shower" value="show" ';
            echo $contShowCheck;
            echo '> Show Donate Banner<br>
        </p>                         
        <p>
            <label for="fenticsik">Text for the Donate part:</label><br/>
            <input type="text" name="contDonate" size="500" style="width:100%;" value="';
            echo $contDonate;
                echo '" />
        </p>

        <input type="checkbox" name="showCampaign" value="show" ';
            echo $contShowCampaignCheck;
            echo '> Switch to Campaign Banner<br>

        <p>
            <label for="fenticsik">Text for the Donate Campaign:</label><br/>
            <input type="text" name="contCampaignText" size="500" style="width:100%;" value="';
            echo $contCampaignText;
                echo '" />
        </p>
        <p>
            <label for="campaigncsik">Text of the button:</label><br/>
            <input type="text" name="contCampaignButton" size="100" style="width:50%;" value="';
                echo $contCampaignButton;
                echo '" />
        </p>
        <p>
            <label for="campaigncsik">Slug of the Campaign code page:</label><br/>
            <input type="text" name="contCampaign" size="100" style="width:50%;" value="';
                echo $contCampaign;
                echo '" />
        </p>
             
        <p>
            <label for="campaignstart">Start Amount:</label><br/>
            <input type="text" name="CampaignStart" size="50" style="width:50%;" value="';
                echo $contCampaignStartAmount;
                echo '" />
        </p>

        <p>
            <label for="campaignend">End Amount:</label><br/>
            <input type="text" name="CampaignEnd" size="50" style="width:50%;" value="';
                echo $contCampaignEndAmount;
                echo '" />
        </p>   
             
        </td>        
        </tr>
    </table>
<input type="submit" name="submit" value="Submit" />

</form>';

if ( $contShower == "show" ) { 
    echo "<h4 style='margin-bottom:0.3em;'>Campaign Bar Showed</h4>"; 
    if ( $contShowCampaign == "show" ) { echo "<i>Switched to Campaign with ID number: </i>" . $contCampaignID; }
} else {
    echo "<h4>No Campaign Running!</h4>"; 
}

 echo '</div>';


 if (isset($_POST["submit"])) {

 	$contDonate = esc_attr($_POST["contDonate"]);
    update_option("contDonate", $contDonate);

    $contCampaignText = esc_attr($_POST["contCampaignText"]);
    update_option("contCampaignText", $contCampaignText);
    
    $contCampaign = esc_attr($_POST["contCampaign"]);
    update_option("contCampaign", $contCampaign);

    $contCampaignButton = esc_attr($_POST["contCampaignButton"]);
    update_option("contCampaignButton", $contCampaignButton);

 	$contShower = $_POST["shower"];
    update_option("shower", $contShower);

    $contShowCampaign = $_POST["showCampaign"];
    update_option("showCampaign", $contShowCampaign);
    
    $contCampaignStartAmount = $_POST["CampaignStart"];
    update_option("CampaignStart", $contCampaignStartAmount);
    
    $contCampaignEndAmount = $_POST["CampaignEnd"];
    update_option("CampaignEnd", $contCampaignEndAmount);


 	echo '<script>parent.window.location.reload(true);</script>';
 }

}/* End Lahma Donate menu */

/* Menu post image */
class Menu_With_Description extends Walker_Nav_Menu {
	function start_el( &$output, $item, $depth, $args ) {
		global $wp_query;
		$indent = ( $depth ) ? str_repeat( "", $depth ) : '';
		$class_names = $value = '';
		$classes = empty( $item->classes ) ? array() : (array) $item->classes;
		$class_names = join( ' ', apply_filters( 'nav_menu_css_class', array_filter( $classes ), $item ) );
		$class_names = ' class="' . esc_attr( $class_names ) . '"';
		$output .= $indent . '<li id="menu-item-' . $item->ID . '"' . $value . $class_names . '>';
		$attributes = ! empty( $item->attr_title ) ? ' title="' . esc_attr( $item->attr_title ) . '"' : '';
		$attributes .= ! empty( $item->target ) ? ' target="' . esc_attr( $item->target ) . '"' : '';
		$attributes .= ! empty( $item->xfn ) ? ' rel="' . esc_attr( $item->xfn ) . '"' : '';
		$attributes .= ! empty( $item->url ) ? ' href="' . esc_attr( $item->url ) . '"' : '';
// get user defined attributes for thumbnail images
		$attr_defaults = array(
			'class' => 'nav_thumb',
			'alt'   => esc_attr( $item->attr_title ),
            'title' => esc_attr( $item->attr_title )
		);
		$attr          = isset( $args->thumbnail_attr ) ? $args->thumbnail_attr : '';
		$attr          = wp_parse_args( $attr, $attr_defaults );
		$item_output = $args->before;
// thumbnail image output
        $item_output .= '<a href="' . esc_attr( $item->url ) . '"';
        $item_output .= isset($item->target) ? ' target="' . esc_attr( $item->target ) . '"' : '';
        $item_output .= ' class="nav-post-link">';
		$item_output .= ( isset( $args->thumbnail_link ) && $args->thumbnail_link ) ? '<a' . $attributes . '>' : '';
		$item_output .= apply_filters( 'menu_item_thumbnail', ( isset( $args->thumbnail ) && $args->thumbnail ) ? get_the_post_thumbnail( $item->object_id, ( isset( $args->thumbnail_size ) ) ? $args->thumbnail_size : 'thumbnail', $attr ) : '', $item, $args, $depth );
		$item_output .= ( isset( $args->thumbnail_link ) && $args->thumbnail_link ) ? '</a>' : '';
// menu link output
		$item_output .= '<div class="nav-text">';
		$item_output .= $args->link_before . '<span class="maintitle">' . apply_filters( 'the_title', $item->title, $item->ID ) . '</span>' . $args->link_after;
// menu description output based on depth
		$item_output .= ( $args->desc_depth >= $depth ) ? '<span class="sub">' . $item->description . '</span>' : '';
// close menu link anchor
		$item_output .= '</div></a>';
		$item_output .= $args->after;
		$output .= apply_filters( 'walker_nav_menu_start_el', $item_output, $item, $depth, $args );
	}
}

add_filter( 'wp_nav_menu_args', 'my_add_menu_descriptions' );
function my_add_menu_descriptions( $args ) {
	if ( $args['theme_location'] == 'primary' ) {
		$args['walker']         = new Menu_With_Description;
		$args['desc_depth']     = 1;
		$args['thumbnail']      = true;
		$args['thumbnail_link'] = false;
		$args['thumbnail_size'] = 'nav_thumb';
		$args['thumbnail_attr'] = array( 'class' => 'nav_thumb my_thumb' );
	}
	return $args;
}

?>
