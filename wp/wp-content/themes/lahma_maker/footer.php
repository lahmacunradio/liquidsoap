<?php
/**
 * The template for displaying the footer.
 *
 * @package Maker
 */

?>

<footer class="page-footer">
	<?php 
	wp_nav_menu( array( 
		'theme_location' => 'footer', 
		'menu_id' => 'footer-menu' ) ); 
	?>
</footer>

</div><!-- #page -->



<?php wp_footer(); ?>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.swipebox/1.4.4/js/jquery.swipebox.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.swipebox/1.4.4/css/swipebox.min.css">

<script type="text/javascript">
;( function( $ ) {

	$( '.swipebox' ).swipebox({
		// hideCloseButtonOnMobile : true, // true will hide the close button on mobile devices
	});
	

} )( jQuery );
</script>


</body>
</html>
