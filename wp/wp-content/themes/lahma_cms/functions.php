<?php

add_image_size("post_page_img", 300); // with width 300px
add_image_size("nav_thumb", 80, 80, true); // nav thumb 80x80

function lahma_enqueue_styles() {

    $main_style = 'lahma_cms';
    $style_ver = filemtime( get_stylesheet_directory() . '/style.css' );

    wp_enqueue_style( 
        $main_style, 
        get_stylesheet_directory_uri() . '/style.css', 
        '', $style_ver );

}

add_action( 'wp_enqueue_scripts', 'lahma_enqueue_styles' );


// Changing excerpt more

function new_excerpt_more($more) {
    return '';
}
add_filter('excerpt_more', 'new_excerpt_more', 21 );

// excerpt more 
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
 
 $showDonateButton = get_option("showDonateButton");
 $showDonateButtonCheck = $showDonateButton == "show" ? "checked" : false;
 $contButton = get_option("contButton");
 $linkButton = get_option("linkButton");

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

        <hr>

        <p>
        <input type="checkbox" name="showDonateButton" value="show" ';
            echo $showDonateButtonCheck;
            echo '> Show Donate Button<br>
        </p>   
        <p>
            <label for="contButton">Text for the Button (if empty, the default "Donate Us" is visible):</label><br/>
            <input type="text" name="contButton" size="500" style="width:100%;" value="';
            echo $contButton;
                echo '" />
        </p>
        <p>
            <label for="linkButton">Link on the Button (if empty, the default "Donate" page is linked):</label><br/>
            <input type="text" name="linkButton" size="500" style="width:100%;" value="';
            echo $linkButton;
                echo '" />
        </p>

        <hr>

        <h2>Campaign datas</h2>

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
<input type="submit" name="submit" value="Submit" style="
    background: #23282d;
    color: white;
    padding: 0.7em 1em;
    border: none;
    border-radius: 3px;" 
/>

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
    
    $showDonateButton = $_POST["showDonateButton"];
    update_option("showDonateButton", $showDonateButton);
    
    $contButton = $_POST["contButton"];
    update_option("contButton", $contButton);
    
    $linkButton = $_POST["linkButton"];
    update_option("linkButton", $linkButton);

    $contShowCampaign = $_POST["showCampaign"];
    update_option("showCampaign", $contShowCampaign);
    
    $contCampaignStartAmount = $_POST["CampaignStart"];
    update_option("CampaignStart", $contCampaignStartAmount);
    
    $contCampaignEndAmount = $_POST["CampaignEnd"];
    update_option("CampaignEnd", $contCampaignEndAmount);


 	echo '<script>parent.window.location.reload(true);</script>';
 }

}/* End Lahma Donate menu */


/* Add Social Menu */
register_nav_menus( array(
    'social' => __( 'Social Menu', 'lahma_cms' )
) );

// Add Gallery for REST API query
function create_posttype_rest_galleries() {
 
    register_post_type( 'lahma_gallery',
        array(
            'labels' => array(
                'name' => __( 'Lahma Gallery' ),
                'singular_name' => __( 'Lahma Gallery' )
            ),
            'public' => true,
            'has_archive' => true,
            'rewrite' => array('slug' => 'lahma_gallery'),
            'show_in_rest' => true,
            'supports'  => array( 
                'title', 'editor', 'excerpt', 'author', 'thumbnail', 'revisions', 'custom-fields',
            ),
            'menu_icon' => 'dashicons-images-alt2',
        )
    );
}
add_action( 'init', 'create_posttype_rest_galleries' );

?>
