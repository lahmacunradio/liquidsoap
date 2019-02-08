<?php
/**
 * The template used for displaying page content in page.php.
 *
 * @package Maker
 */

?>

<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>

<header class="lahma_post-title">

	<?php // the_title( '<h1 class="entry-title">', '</h1>' ); ?>

</header><!-- .entry-header -->


<div class="lahma_home-content">

    <?php the_content(); ?>
		<?php wp_link_pages( array( 'before' => '<div class="page-links">' . __( 'Pages:', 'maker' ), 'after' => '</div>' ) ); ?>

</div><!-- .entry-content -->

</article><!-- #post-## -->
