<?php
/**
 * Displays the campaign content.
 *
 * Override this template by copying it to yourtheme/charitable/content-campaign.php
 *
 * @author  Studio 164a
 * @package Charitable/Templates/Campaign
 * @since   1.0.0
 * @version 1.0.0
 */
// Exit if accessed directly.
if ( ! defined( 'ABSPATH' ) ) {
	exit;
}
$campaign = $view_args['campaign'];
$content  = $view_args['content'];
/**
 * Add something before the campaign content.
 *
 * @since 1.0.0
 *
 * @param $campaign Charitable_Campaign Instance of `Charitable_Campaign`.
 */

echo "<div class='campaigninfos'>";

do_action( 'charitable_campaign_content_before', $campaign );

echo $content;

echo "</div>";

/**
 * Add something after the campaign content.
 *
 * @since 1.0.0
 *
 * @param $campaign Charitable_Campaign Instance of `Charitable_Campaign`.
 */
do_action( 'charitable_campaign_content_after', $campaign );