<?php
/**
 * The template used for displaying page content in page.php.
 *
 * @package Maker
 */

?>

<div class="lahma_home-content">

<div class="halver news-block">
<?php get_template_part('template-parts/loopnews'); ?>
</div>

<div class="halver shows-block">


<section class="schedulewrap">
<h1>Schedule</h1>
<span class="timenotice">All times are CET</span>
<p>In-between shows non-stop</p>

<?php
/**** Automatisation not finished in loopshows.php, needs filtering by day/time

	get_template_part('template-parts/loopshows');

*/
?>


<?php
$query1 = new WP_Query( array( 'pagename'=>'shows-lister' ) );

if ( $query1->have_posts() ) {
	// The Loop
	while ( $query1->have_posts() ) {
		$query1->the_post();
		the_content();
	}
	wp_reset_postdata();
}

?>

<div id="endofweek"></div>

<script type="text/javascript">

var dateobj = new Date();
var ndateobj = dateobj.getDay() || 7 - 1;
var gooddateobj = ndateobj - 1;
var datedifference = 7 - gooddateobj;

window.onfocus = function() {
		var Cdateobj = new Date();
		var Cndateobj = Cdateobj.getDay() || 7 - 1;
		var Cgooddateobj = Cndateobj - 1;

		// console.log(gooddateobj);
		// console.log(Cgooddateobj);

if ( Cgooddateobj !== gooddateobj && $("body").hasClass("home") ) {
		location.reload();
}

};

// console.log(gooddateobj);
// console.log(datedifference);

// var $monday = $(".day").eq(0);
// var $lastday = $(".day").eq(6);
// var $today = $(".day").eq(gooddateobj);

function sortDates() {
	$(".day").not(".sorted").addClass("notsorted");
	$(".day.notsorted").each(function(i){
	// console.log(i);
	if ( i < gooddateobj ) {
		$(this).appendTo($("#endofweek"));
	}
	$(".day").removeClass("notsorted").addClass("sorted");
	});
}


$( document ).ajaxComplete(function() {
		sortDates();
});



</script>


</section>

</div>

</div><!-- .entry-content -->
