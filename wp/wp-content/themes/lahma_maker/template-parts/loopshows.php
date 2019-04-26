<?php /*
Schedule template for homepage

TO DO AUTOMATISATION

FIELDS DONE WITH ACF:
$showdaynumber = get_field('show_day');
$showdayname = $showdaynumber['label'];
$starthour = get_field('show_start_time');
$endhour = get_field('show_end_time');
$link = get_field('archive_link');

??? HOW TO SORT AND GROUP THE SHOWS BY DAY, AND THEN SORT BY TIME ???

 */?>


<?php /* SET UP SHOWS  */

$todayname = date('l');
$today = date('N');

$args = array(
    'category_name' => 'shows',
    'meta_key'=>'show_day',
    /* Or for the time
    'meta_key'=>'show_start_time',
    */

    // 'meta_query' => array (
    //   'relation' => 'AND',
    //       array (
    //         'key' => 'show_day',
    //         'value' => $today,
    //         'compare' => '>=',
    //
    //       ),
    //       array (
    //             'key' => 'show_start_time',
    //             'type' => 'TIME',
    //             'compare' => '>=',
    //       ),
    //   ),

     'orderby'=>'meta_value',
     'order'=>'ASC',
     'posts_per_page'=>-1 );


$loop = new WP_Query( $args );

while ( $loop->have_posts() ) : $loop->the_post();

	$title = get_the_title();

  $showdaynumber = get_field('show_day');
  $showdayname = $showdaynumber['label'];
	$starthour = get_field('show_start_time');
  $endhour = get_field('show_end_time');

	$link = get_field('archive_link');

  echo "<br><br>Day " . $showdaynumber['value'] . " - ";
  echo $showdayname;
  echo "<br>Name ";
  var_dump ($title);
  echo "<br>Starttime ";
  var_dump ($starthour);
  echo "Endtime: ";
  var_dump ($endhour);

?>


<?php
endwhile;
wp_reset_query();
// end of the loop. ?>
