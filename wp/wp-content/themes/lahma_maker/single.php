<?php
/**
 * The template for displaying all single posts.
 *
 * @package Maker
 */

get_header(); ?>

<div id="main" class="site-main" role="main">
	<div id="content" class="site-content">
		<div id="primary" class="content-area">

			<?php while ( have_posts() ) : the_post(); ?>

					<?php 
					if ( in_category('shows') || in_category('past-shows') ) {
						get_template_part( 'template-parts/content', 'show' ); 
						get_template_part( 'template-parts/content', 'arcsi' );
					} else if (in_category('news')) {
						get_template_part( 'template-parts/content', 'news' ); 
					} else {
						get_template_part( 'template-parts/content', 'single' ); 
					}
					?>

			<?php endwhile; ?>

		</div>

		<?php /* get_sidebar(); */ ?>

	</div><!-- #content -->
</div><!-- #main -->

<?php get_footer(); ?>
