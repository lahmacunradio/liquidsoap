<?php
/* GET SHOWS INFOS */

$args = array(
  'category_name' => 'shows',
  'posts_per_page'=>-1
);


$showlist = array();

$loop = new WP_Query( $args );

while ( $loop->have_posts() ) : $loop->the_post();

    $title = get_post_field( 'post_title', get_post() );
    $image = get_the_post_thumbnail_url( $post->ID, 'large' );
    $showurl = get_the_permalink( $post->ID );

    $showlist[] = array(
        $title => $image
        // "slug" => "image"
    );

    $showURLlist[] = array(
        $title => $showurl
    );

endwhile;

wp_reset_postdata();


// print out array
// print_r ($showlist);

// echo json_encode($showlist);

?>

<script type="text/javascript">
  	var showsList = <?php echo json_encode($showlist, JSON_UNESCAPED_SLASHES); ?>;
    var showsURLList = <?php echo json_encode($showURLlist, JSON_UNESCAPED_SLASHES); ?>;
</script>
