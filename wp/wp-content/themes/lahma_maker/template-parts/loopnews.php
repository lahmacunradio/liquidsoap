<?php /*
News template for homepage
 */?>

<h1>
  <a href="category/news/">
  News
  <span class="morenewslink">More news...</span>
  </a>
</h1>

<article class="homenews">

<?php
  $args = array(   'category_name' => 'News', 'posts_per_page'   => 3, 'post_type' =>  'post' );
  $postslist = get_posts( $args );
  foreach ($postslist as $post) :  setup_postdata($post);
  ?>

<div class="newslist">
  <a href="<?php the_permalink(); ?>">

  <?php if ( has_post_thumbnail()) : ?>
  <div class="newspic-full">
      <?php the_post_thumbnail("newsonhome"); ?>
  </div>
  <?php endif; ?>
  <h3 class="news-title">
      <?php the_title(); ?>
  </h3>

  </a>

</div>

<?php endforeach; ?>

</article>
