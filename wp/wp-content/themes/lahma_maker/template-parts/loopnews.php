<?php /*
News template for homepage
 */?>

<h1><a href="category/news/">News</a></h1>

<article>

<?php
  $args = array(   'category_name' => 'News', 'posts_per_page'   => 3, 'post_type' =>  'post' );
  $postslist = get_posts( $args );
  foreach ($postslist as $post) :  setup_postdata($post);
  ?>

<div class="newslist">
  <a href="<?php the_permalink(); ?>">
  <h3 class="news-title">
    <?php the_title(); ?>
  </h3>

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

</div>

<?php endforeach; ?>

</article>
