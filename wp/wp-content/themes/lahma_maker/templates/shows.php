<?php
/**
 * The template for displaying fullwidth pages.
 *
 * Template Name: Shows page
 *
 * @package Maker
 */

get_header(); ?>

<div id="main" class="site-main" role="main">
	<div id="content" class="site-content">
		<div id="primary" class="content-area">

			<?php
				while ( have_posts() ) : the_post();

					get_template_part( 'template-parts/content', 'show' );
				
				endwhile;
			?>

		</div>
	</div><!-- #content -->
</div><!-- #main -->

<?php get_footer(); ?>
