<?php 
    /* load all wp stuff */
    wp_head(); 
    wp_footer();

    $restEndpoint = 'wp-json/wp/v2'

    // Check if URL contains the restEndpoint
    if (stripos($_SERVER['REQUEST_URI'], $restEndpoint )!==true){
       /* redirect then die */
       header("Location: https://www.lahmacun.hu/");
       die();
    }
?>
