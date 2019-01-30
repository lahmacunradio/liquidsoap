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

		<?php /* for now hardcoded
		the_content(); */
		?>
		
		<table class="tg">
  <tbody><tr>
    <th class="tg-idopont"></th>
    <th class="tg-wp8o">H</th>
    <th class="tg-wp8o">K</th>
    <th class="tg-wp8o">SZ</th>
    <th class="tg-wp8o">CS</th>
    <th class="tg-wp8o">P</th>
    <th class="tg-wp8o">SZ</th>
    <th class="tg-wp8o">V</th>
    <th class="tg-idopont"></th>
  </tr>
  <tr>
    <td class="tg-idopont" style="font-weight: bold">12-14h</td>
    <td class="tg-wp8o"></td>
    <td class="tg-wp8o"></td>
    <td class="tg-wp8o"></td>
    <td class="tg-wp8o"></td>
    <td class="tg-wp8o"></td>
    <td class="tg-wp8o"></td>
    <td class="tg-wp8o">Bambuszrádió</td>
    <td class="tg-idopont" style="font-weight: bold">12-14h</td>
  </tr>
  <tr>
    <td class="tg-idopont" style="font-weight: bold">14-16h</td>
    <td class="tg-baqh"></td>
    <td class="tg-baqh"></td>
    <td class="tg-baqh"></td>
    <td class="tg-baqh"></td>
    <td class="tg-baqh"></td>
    <td class="tg-baqh"></td>
    <td class="tg-baqh" rowspan="2">Donald<br>Kacsa<br>Klub</td>
    <td class="tg-idopont" style="font-weight: bold">14-16h</td>
  </tr>
  <tr>
    <td class="tg-idopont" rowspan="2" style="font-weight: bold">16-18h</td>
    <td class="tg-baqh" rowspan="2"></td>
    <td class="tg-baqh" rowspan="2"></td>
    <td class="tg-baqh" rowspan="2"></td>
    <td class="tg-baqh"></td>
    <td class="tg-baqh"></td>
    <td class="tg-baqh"></td>
    <td class="tg-idopont" rowspan="2" style="font-weight: bold">16-18h</td>
  </tr>
  <tr>
    <td class="tg-baqh" rowspan="2">Lazy<br>Calm<br>Raga</td>
    <td class="tg-baqh"></td>
    <td class="tg-baqh"><br></td>
    <td class="tg-baqh"></td>
  </tr>
  <tr>
    <td class="tg-idopont" rowspan="2" style="font-weight: bold">18-20h</td>
    <td class="tg-wp8o">Szmúti csórba</td>
    <td class="tg-wp8o" rowspan="2">MMN radio</td>
    <td class="tg-wp8o">Wikihow Advanture <br>Cruise</td>
    <td class="tg-wp8o">Agybaj</td>
    <td class="tg-wp8o" rowspan="2">rnr666 radioshow</td>
    <td class="tg-wp8o"></td>
    <td class="tg-idopont" rowspan="2" style="font-weight: bold">18-20h</td>
  </tr>
  <tr>
    <td class="tg-wp8o">TBA</td>
    <td class="tg-wp8o">Geigercounterculture</td>
    <td class="tg-wp8o">MŰTŐ</td>
    <td class="tg-wp8o" rowspan="2">Működő Működ</td>
    <td class="tg-wp8o"></td>
  </tr>
  <tr>
    <td class="tg-idopont" rowspan="2" style="font-weight: bold"> 20-22h</td>
    <td class="tg-wp8o" rowspan="2">TBA</td>
    <td class="tg-wp8o" rowspan="2"></td>
    <td class="tg-wp8o" rowspan="2"></td>
    <td class="tg-wp8o" rowspan="2"></td>
    <td class="tg-wp8o"><br></td>
    <td class="tg-wp8o"></td>
    <td class="tg-idopont" rowspan="2" style="font-weight: bold">20-22h</td>
  </tr>
  <tr>
    <td class="tg-baqh"></td>
    <td class="tg-baqh"></td>
    <td class="tg-baqh"><br></td>
  </tr>
</tbody></table>
		

		<?php wp_link_pages( array( 'before' => '<div class="page-links">' . __( 'Pages:', 'maker' ), 'after' => '</div>' ) ); ?>

</div><!-- .entry-content -->

</article><!-- #post-## -->
