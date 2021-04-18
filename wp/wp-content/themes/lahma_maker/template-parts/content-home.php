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
<p><a href="https://www.facebook.com/events/827099934831111" target="_blank">☽ Easterndaze x Berlin: Community Radio Week</a></p>


<?php
/* Shows Schedule loaded from template file not backend */

	get_template_part('Showsschedule');

?>


<?php
/**** Query post from backend
$query1 = new WP_Query( array( 'pagename'=>'shows-lister' ) );

if ( $query1->have_posts() ) {
	// The Loop
	while ( $query1->have_posts() ) {
		$query1->the_post();
		the_content();
	}
	wp_reset_postdata();
}
*/
?>

<div id="endofweek"></div>

<script type="text/javascript">
/* Added to Scripts.js

// A $( document ).ready() block.
$( document ).ready(function() {

var dateobj = new Date();
var ndateobj = dateobj.getDay() || 8 - 1;
var gooddateobj = ndateobj - 1;
var datedifference = 7 - gooddateobj;
		// console.log(ndateobj);
		// console.log(gooddateobj);
		// console.log(datedifference);

window.onfocus = function() {
		var Cdateobj = new Date();
		var Cndateobj = Cdateobj.getDay() || 8 - 1;
		var Cgooddateobj = Cndateobj - 1;

		// console.log(gooddateobj);
		// console.log(Cgooddateobj);

if ( Cgooddateobj !== gooddateobj && $("body").hasClass("home") ) {
		location.reload();
}

};

// var $monday = $(".day").eq(0);
// var $lastday = $(".day").eq(6);
// var $today = $(".day").eq(gooddateobj);

function sortDates( callbackFunction ) {
	$(".day").not(".sorted").addClass("notsorted");
	$(".day.notsorted").each(function(i){
	// console.log(i);
	if ( i < gooddateobj ) {
		$(this).appendTo($("#endofweek"));
	}
	$(".day").removeClass("notsorted").addClass("sorted");
	});

	callbackFunction();

}

function dateWriteSchedule() {
	const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
	var i = 0;
	$(".schedulewrap .sorted > h3:not(.addedDate)").each(function(i){
		var nextday = new Date(dateobj.getFullYear(),dateobj.getMonth(),dateobj.getDate()+i);
		var $dateformat = "<div class='scheddate'>" + monthNames[nextday.getMonth()] + " " + nextday.getDate() + "</div>";
		$(this).addClass("addedDate").append($dateformat);
		i++;
	})

}

// var nextday = new Date(dateobj.getFullYear(),dateobj.getMonth(),dateobj.getDate()+1);
// console.log(nextday);


$( document ).on("ajaxComplete", function(){
		sortDates( dateWriteSchedule );
});

$( ".shows-block" ).ready(function(){
		sortDates( dateWriteSchedule );
});

// A $( document ).ready() block end
});


*/
</script>


</section>

</div>

</div><!-- .entry-content -->
