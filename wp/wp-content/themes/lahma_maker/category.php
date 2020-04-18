<?php
/**
 * The template for displaying Categories
 */

get_header(); ?>

<div id="main" class="site-main categoryposts" role="main">

	<div id="content" class="site-content">

		<div id="primary" class="content-area">

<?php if ( have_posts() ) : ?>

	<header class="page-header categorytitle">

		<?php 
		if ( in_category( 'Shows' ) ) {
			echo '<h1 class="page-title">List of Lahmacun radio shows</h1>';
		} else {
			single_cat_title( '<h1 class="page-title">', '</h1>' ); 
		}
		
		?>

	</header><!-- .page-header -->

<?php while ( have_posts() ) : the_post(); ?>

<?php if ( in_category( 'Shows' ) ) : ?>

<article class="postslister shows">
	<h3 class="news-title"><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h3>
		<?php if ( has_post_thumbnail()) : ?>
		<div class="newspic-container">
		<a href="<?php the_permalink(); ?>" title="<?php the_title_attribute(); ?>" class="newsimage">
		<?php the_post_thumbnail("nav_thumb"); ?>
		</a>
	</div>
	<?php endif; ?>

	<div class="description">
		<?php echo wp_trim_words( get_the_excerpt(), 12, '...' ); ?>
	</div>
	<div class="clearfix"></div>

</article>

<?php elseif ( in_category( 'News' ) ) : ?>

				<article class="postslister newscat">
					<a href="<?php the_permalink(); ?>">
				  	<h3 class="news-title"><?php the_title(); ?></h3>
					<p class="news-time"><?php the_time('l, F jS, Y') ?></p>
				  <?php if ( has_post_thumbnail()) : ?>
				  <div class="newspic-container">
				   <div class="newsimage">
				   <?php the_post_thumbnail("medium"); ?>
				 </div>
				</div>
				<?php endif; ?>

				<div class="description">
				  <?php the_excerpt(); ?>
				  </div>
				</a>
				<div class="clearfix"></div>

				</article>

		<?php else : ?>

				<article class="postslister">
				  <h3 class="news-title"><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h3>
					<p class="news-time"><?php the_time('l, F jS, Y') ?></p>
				  <?php if ( has_post_thumbnail()) : ?>
				  <div class="newspic-container">
				   <a href="<?php the_permalink(); ?>" title="<?php the_title_attribute(); ?>" class="newsimage">
				   <?php the_post_thumbnail("medium"); ?>
				   </a>
				</div>
				<?php endif; ?>

				<div class="description">
				  <?php the_excerpt(); ?>
				  </div>
				<div class="clearfix"></div>

				</article>

<?php endif; ?>


			<?php endwhile; ?>

			<?php maker_posts_pagination(); ?>

		<?php else : ?>

			<?php get_template_part( 'template-parts/content', 'none' ); ?>

		<?php endif; ?>

		</div><!-- #primary -->

		<?php // get_sidebar(); ?>

	</div><!-- #content -->
</div><!-- #main -->

<?php get_footer(); ?>
