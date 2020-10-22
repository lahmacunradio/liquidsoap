<?php
/**
 * The template used for displaying Arcsi on Shows page
 *
 * @package Maker
 */

?>

<article class="arcsi-list" >

<h3>Arcsived shows for <?php the_title(); ?></h3>

<?php

$showslug = get_post_field( 'post_name', get_post() );
$showjson = file_get_contents('https://arcsi.lahmacun.hu/arcsi/show/' . $showslug . '/archive');
$showarcsi = json_decode($showjson, true);

?>

<script>

</script>


<?php 
foreach($showarcsi as $archiveitem) {
    $shownumber = $archiveitem['number'];
    $showname = $archiveitem['name'];
    $showimg = $archiveitem['image_url'];
    $showdescription = $archiveitem['description'];
    $showplaydate = $archiveitem['play_date'];
    $showid = $archiveitem['id'];
?>

<div class="arcsiblokk">
    <div class="arcsiimage">
        <img src="<?php echo $showimg;?>" alt="<?php echo $showname; ?>">  
    </div>
    <div class="arcsiinfos">
        <div>Episode nr. <?php echo $shownumber; ?> – <span>Was aired on <?php echo $showplaydate; ?></span> </div>
        <h4><?php echo $showname; ?></h4>   
        <p><?php echo $showdescription; ?></p> 
        <div>
            <a class="arcsibutton" href="https://arcsi.lahmacun.hu/arcsi/item/<?php echo $showid; ?>/download" target="_blank">
                <i class="fa fa-download" aria-hidden="true"></i> Download
            </a>              
            <a class="arcsibutton" href="https://arcsi.lahmacun.hu/arcsi/item/<?php echo $showid; ?>/listen" target="_blank">
                <i class="fa fa-headphones" aria-hidden="true"></i> Listen
            </a>              
        </div>
    </div>
</div>
  
<?php

}
?>

</article><!-- #post-## -->
