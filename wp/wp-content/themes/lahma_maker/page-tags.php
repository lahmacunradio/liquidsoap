<?php
/* Template Name: Tags page */

get_header();
?>

<div id="main" class="site-main" role="main">
	<div id="content" class="site-content">
		<div id="primary" class="content-area fullwidth">

            <?php while ( have_posts() ) : the_post(); ?>
            
            <header class="lahma_post-title">

                <?php the_title( '<h1 class="entry-title">', '</h1>' ); ?>

            </header><!-- .entry-header -->

            <?php the_content(); ?>

            <?php endwhile; ?>
            
            <div class="taglist">
            <?php
            $tags = get_tags('post_tag'); //taxonomy=post_tag

            if ( $tags ) :
                foreach ( $tags as $tag ) : ?>
                
                <a class="tag" href="<?php echo esc_url( get_tag_link( $tag->term_id ) ); ?>" title="<?php echo esc_attr( $tag->name ); ?>">
                    <?php echo esc_html( $tag->name ); ?>
                </a>
                <?php endforeach; ?>
                
            <?php endif; ?>
            </div>

		</div>

	</div><!-- #content -->
</div><!-- #main -->

<?php get_footer(); ?>
