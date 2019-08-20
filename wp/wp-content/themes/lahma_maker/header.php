<?php
/**
 * The header for our theme.
 *
 * Displays all of the <head> section and everything up till <div id="content">
 *
 * @package Maker
 */

?><!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="profile" href="http://gmpg.org/xfn/11">

<?php wp_head(); ?>

<link href="https://fonts.googleapis.com/css?family=Rubik:300,300i,400,400i,500,500i,700,700i&amp;subset=latin-ext" rel="stylesheet">

<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">


</head>

<?php if ( is_home() ) : ?>
    <body <?php body_class("home"); ?>>
<?php else : ?>
    <body <?php body_class(); ?>>
<?php endif; ?>

<body>

  <?php // donatebanner show
  $contDonate = get_option("contDonate");
  $contShower = get_option("shower");

  if ( $contShower == "show" ) :

  ?>

  <div id="donatebanner">
    <a id="closedonate"><i class="fa fa-times" aria-hidden="true"></i>
</a>
    <div id="donateholder">
      <p><?php echo $contDonate; ?></p>
      <a id="donatebutton" href="../donate">Donate Us</a>
    </div>
  </div>
  <?php endif; ?>

<div id="page" class="hfeed site">

	<a class="skip-link screen-reader-text" href="#content"><?php esc_html_e( 'Skip to content', 'maker' ); ?></a>

<header id="masthead" class="site-header" role="banner">

<div id="playerdiv">
<?php
	get_template_part( 'playercode' );
?>
</div>

	<div class="wrap">
		<div class="site-branding">
			<?php maker_site_logo(); ?>
			<?php maker_site_title(); ?>
			<?php maker_site_description(); ?>
		</div><!-- .site-branding -->

		<button id="site-navigation-toggle" class="menu-toggle" >
			<span class="menu-toggle-icon"></span>
			<?php esc_html_e( 'Primary Menu', 'maker' ); ?>
		</button><!-- #site-navigation-menu-toggle -->

		<nav id="site-navigation" class="main-navigation" role="navigation">
			<?php wp_nav_menu( array( 'theme_location' => 'primary', 'menu_id' => 'primary-menu' ) ); ?>
		</nav><!-- #site-navigation -->
	</div><!-- .column -->
</header><!-- #masthead -->
