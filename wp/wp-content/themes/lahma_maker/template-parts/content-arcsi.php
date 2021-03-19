<?php
/**
 * The template used for displaying Arcsi on Shows page
 *
 * @package Maker
 */

/**
 * A method for sorting associative arrays by a key and a direction.
 * Direction can be ASC or DESC.
 *
 * @param $array
 * @param $key
 * @param $direction
 * @return mixed $array
 */
function sortAssociativeArrayByKey($array, $key, $direction){

    switch ($direction){
        case "ASC":
            usort($array, function ($first, $second) use ($key) {
                return $first[$key] <=> $second[$key];
            });
            break;
        case "DESC":
            usort($array, function ($first, $second) use ($key) {
                return $second[$key] <=> $first[$key];
            });
            break;
        default:
            break;
    }

    return $array;
} 

$server = 'https://arcsi.lahmacun.hu'; // prod server
// $server = 'https://devarcsi.lahmacun.hu'; // dev server
// $server = 'http://localhost:40'; // local server
// $server_internal = 'http://docker.for.mac.localhost:40'; // local server

$showslug = get_post_field( 'post_name', get_post() );
//$showjson = file_get_contents($server_internal . '/arcsi/show/' . $showslug . '/archive');
$showjson = file_get_contents($server . '/arcsi/show/' . $showslug . '/archive');
$showarcsi = json_decode($showjson, true);

// print_r($showjson)

/* CHECK IF THERE ARE ARCHIVED SHOWS */
$has_archived = false;

foreach ($showarcsi as $v_arr) {
    if ($v_arr['archived']) {
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

<div class="sort-block">
    <button id="alphabetical" style="margin-right: 1rem;">
        <i class="fa fa-sort-alpha-asc" aria-hidden="true"></i> Order by Title
    </button>
    <button id="bydate">
        <i class="fa fa-sort-numeric-asc" aria-hidden="true"></i> Order by Air time
    </button>
</div>

<div class="arcsi-blokks">

<?php 

$showarcsi = sortAssociativeArrayByKey($showarcsi, "play_date", "ASC");

foreach($showarcsi as $archiveitem) :
    $showtitle = get_the_title();
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
if ($showarchived) { 
    
$fullTitle = $showtitle . ' | ' . $showname;
    
?>


<div class="arcsiblokk">
    <div class="arcsiimage">
        <a href="<?php echo $showimg;?>" class="swipebox">
            <img src="<?php echo $showimg;?>" alt="<?php echo $showname; ?>">
        </a>
    </div>
    <div class="arcsiinfos">
        <div>
        <?php /* no episode number ?> 
        Episode nr. <?php echo $shownumber; ?> – 
        <?php */ ?> 
        Aired on <span class="airtime"><?php echo $showplaydate; ?></span> </div>
        <h4 class="episode-name"><?php echo $showname; ?></h4>   
        <p><?php echo $showdescription; ?></p> 
        <div id="arcsi-audio-<?php echo $showid; ?>" class="arcsicontrols">
            <a class="arcsibutton arcsidown" href="#" data-href="<?php echo $server; ?>/arcsi/item/<?php echo $showid; ?>/download" title="<?php echo $fullTitle; ?>">
                <i class="fa fa-download" aria-hidden="true"></i> Download
            </a>              
            <a class="arcsibutton arcsilisten avoidAjax" href="<?php echo $server; ?>/arcsi/item/<?php echo $showid; ?>/listen" title="<?php echo $fullTitle; ?>">
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
