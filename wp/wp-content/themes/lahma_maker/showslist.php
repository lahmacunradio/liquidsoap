<?php
/* GET SHOWS INFOS */

$args = array(
  'category_name' => 'shows'
);


$showlist = array();

$loop = new WP_Query( $args );

while ( $loop->have_posts() ) : $loop->the_post();

    $slug = get_post_field( 'post_name', get_post() );
    $image = get_the_post_thumbnail_url( $post->ID, 'thumbnail' );

    $showlist[] = array(
        $slug => $image
        // "slug" => "image"
    );

endwhile;

wp_reset_postdata();


// print out array
// print_r ($showlist);

// echo json_encode($showlist);

?>

<script type="text/javascript">
  	var showsList = "<?php echo json_encode($showlist, JSON_UNESCAPED_SLASHES); ?>";
</script>
