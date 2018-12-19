<?php get_header(); ?>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.13/vue.min.js" crossorigin="anonymous" integrity="sha256-1Q2q5hg2YXp9fYlM++sIEXOcUb8BRSDUsQ1zXvLBqmA="></script>


	<main role="main">
		<!-- section -->
		<section>

<!-- 			<h1><?php //_e( 'Latest Posts', 'html5blank' ); ?></h1> -->

			<?php get_template_part('player'); ?>

			<?php //get_template_part('pagination'); ?>
			

		</section>
		<!-- /section -->
	</main>

<?php get_sidebar(); ?>

<?php get_footer(); ?>
