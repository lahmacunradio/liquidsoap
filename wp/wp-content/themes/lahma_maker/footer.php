<?php
/**
 * The template for displaying the footer.
 *
 * @package Maker
 */

?>
	<footer id="colophon" class="site-footer" role="contentinfo">
		<div class="wrap">
			<?php if ( has_nav_menu( 'footer' ) ) : ?>
				<nav id="site-footer-navigation" class="footer-navigation" role="navigation">
					<?php wp_nav_menu( array( 'theme_location' => 'footer', 'depth' => 1, 'fallback_cb' => false ) ); ?>
				</nav><!-- #site-navigation -->
			<?php endif; ?>

			<div class="site-info">
			Powered by <a href="https://www.mmmnmnm.com" target="_blank">MMN</a> <br>
			</div><!-- .site-info -->
		</div><!-- .column -->
	</footer><!-- #colophon -->
</div><!-- #page -->

<?php wp_footer(); ?>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.swipebox/1.4.4/js/jquery.swipebox.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.swipebox/1.4.4/css/swipebox.min.css">

<script type="text/javascript">
;( function( $ ) {

	$( '.swipebox' ).swipebox();
	
	var X = 0; // set a global var 
	$('.swipebox').each(function() { //for each swipebox
	  X += 1; //increment the global var by 1
	  $(this).attr('rel', 'gallery-' + X); // set the rel attribute to gallery- plus the value of X
	});

} )( jQuery );
</script>


</body>
</html>
