<?php
/**
 * The template used for displaying Arcsi on Shows page
 *
 * @package Maker
 */

$server = 'https://arcsi.lahmacun.hu'; // prod server
// $server = 'https://devarcsi.lahmacun.hu'; // dev server
 $server = 'http://localhost:40'; // local server
 $server_internal = 'http://docker.for.mac.localhost:40'; // local server

$showslug = get_post_field( 'post_name', get_post() );
$showjson = file_get_contents($server_internal . '/arcsi/show/' . $showslug . '/archive');
//$showjson = file_get_contents($server . '/arcsi/show/' . $showslug . '/archive');
$showarcsi = json_decode($showjson, true);

// print_r($showjson)

/* CHECK IF THERE ARE ARCHIVED SHOWS */
$has_archived = false;

foreach ($showarcsi as $k_arr => $v_arr) {
    if ($k_arr == 'archived') {
        $has_archived = true;
    }
}

?>

<?php 
// if arcsi is available for the Show
// check all shows if all 
if ($showjson && $has_archived) : ?>

<article class="arcsi-list" >

<h3>Arcsived shows for <?php the_title(); ?></h3>

<div class="arcsi-blokks">

<?php 
foreach($showarcsi as $archiveitem) :
    $showarchived = $archiveitem['archived'];
    $shownumber = $archiveitem['number'];
    $showname = $archiveitem['name'];
    $showimg = $archiveitem['image_url'];
    $showdescription = $archiveitem['description'];
    $showplaydate = $archiveitem['play_date'];
    $showid = $archiveitem['id'];
?>

<?php 
// if Episode is archived
if ($showarchived) { ?>

<div class="arcsiblokk">
    <div class="arcsiimage">
        <img src="<?php echo $showimg;?>" alt="<?php echo $showname; ?>">  
    </div>
    <div class="arcsiinfos">
        <div>
        <?php /* no episode number ?> 
        Episode nr. <?php echo $shownumber; ?> – 
        <?php */ ?> 
        <span>Aired on <?php echo $showplaydate; ?></span> </div>
        <h4><?php echo $showname; ?></h4>   
        <p><?php echo $showdescription; ?></p> 
        <div id="arcsi-audio-<?php echo $showid; ?>" class="arcsicontrols">
            <a class="arcsibutton arcsidown" href="<?php echo $server; ?>/arcsi/item/<?php echo $showid; ?>/download" target="_blank">
                <i class="fa fa-download" aria-hidden="true"></i> Download
            </a>              
            <a class="arcsibutton arcsilisten avoidAjax" href="<?php echo $server; ?>/arcsi/item/<?php echo $showid; ?>/listen" title="<?php echo $showname; ?>">
                <i class="fa fa-headphones" aria-hidden="true"></i> Listen
            </a>
        </div>
    </div>
</div>
  
<?php
} // endif
endforeach;
?>
</div>

</article><!-- #post-## -->

<?php
// close if arcsi is available for the Show
endif; ?>
