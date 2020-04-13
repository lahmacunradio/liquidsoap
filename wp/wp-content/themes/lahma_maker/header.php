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


<div id="page" class="hfeed site">

	<a class="skip-link screen-reader-text" href="#content"><?php esc_html_e( 'Skip to content', 'maker' ); ?></a>

<header id="masthead" class="site-header" role="banner">

  <?php // donatebanner show
  $contDonate = get_option("contDonate");
  $contShower = get_option("shower");
  $contCampaignText = get_option("contCampaignText");  
  $contCampaign = get_option("contCampaign");
  $contCampaignID = get_page_by_path($contCampaign, number, "campaign")->ID;
  $contCampaignButton = get_option("contCampaignButton");
  $contShowCampaign = get_option("showCampaign");
  $contCampaignStartAmount = get_option("CampaignStart");
  $contCampaignEndAmount = get_option("CampaignEnd");

  $campaign = $view_args['campaign'];

  if ( $contShower == "show" ) :

  ?>

  <div id="donatebanner">
    <a id="closedonate" class="avoidAjax"><i class="fa fa-times" aria-hidden="true"></i>
</a>
    <div id="donateholder">

	<?php if ($contShowCampaign == "show") { 
	?>
		<div class="campaignTextBar">
			<div class="campaigntext">
				<?php echo $contCampaignText; ?>
			</div>
				
			<div class="progressinfos">
				<div class="startgoal"><?php echo $contCampaignStartAmount; ?></div>
<div class="infotext">
				<div class="goalprogress"></div>
				<?php echo do_shortcode( "[charitable_stat campaigns=" . $contCampaignID . " display=progress goal=650]" );	?>
</div>
				<div class="endgoal"><?php echo $contCampaignEndAmount; ?></div>
			</div>
		
		</div>

		<a id="campaignbutton" class="donate-button" href="/campaigns/<?php echo $contCampaign; ?>"><?php echo $contCampaignButton; ?></a>

	<?php

	 } else { ?>	

      <p><?php echo $contDonate; ?></p>
	  <a id="donatebutton" class="donate-button" href="<?php echo get_home_url(); ?>/donate">Donate Us</a>

	<?php } ?>  

    </div>
  </div>

<?php endif; ?>


	<div id="playerwrap">
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

	</div><!-- .column -->

		<nav id="site-navigation" class="main-navigation" role="navigation">
			
			<?php 
			wp_nav_menu( array( 
				'theme_location' => 'primary', 
				'menu_id' => 'primary-menu' ) ); 
			
			?>

			<?php 
			wp_nav_menu( array( 
				'theme_location' => 'social', 
				'menu_id' => 'social-menu' ) ); 
			
			?>

		</nav><!-- #site-navigation -->
	

</header><!-- #masthead -->
