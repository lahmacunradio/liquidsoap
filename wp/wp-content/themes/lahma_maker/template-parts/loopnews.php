<?php /*
News template for homepage
 */?>

<h1>News</h1>

<article>

<?php
  $args = array(   'category_name' => 'News', 'posts_per_page'   => 3, 'post_type' =>  'post' );
  $postslist = get_posts( $args );
  foreach ($postslist as $post) :  setup_postdata($post);
  ?>

<div class="newslist">
  <h3 class="news-title"><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h3>
  <p class="news-time">Posted on: <?php the_time('l, F jS, Y') ?></p>

  <?php if ( has_post_thumbnail()) : ?>
  <div class="newspic-container">
   <a href="<?php the_permalink(); ?>" title="<?php the_title_attribute(); ?>" class="newsimage">
   <?php the_post_thumbnail("thumbnail"); ?>
   </a>
</div>
<?php endif; ?>

<div class="description">
  <?php the_excerpt(); ?>
  </div>
<div class="clearfix"></div>
</div>

<?php endforeach; ?>

    <p class="morenews">
      <a href="category/news/" class="morebutton">Read more news »</a>
    </p>

</article>
