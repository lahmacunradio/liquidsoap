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
$showarcsiJSON = 
'[
    {
        "id" : 123456,
        "number" : 1,
        "archived" : true,
        "image_url" : "https://www.lahmacun.hu/wp-content/uploads/95501220_1681612051978410_2631130930130976768_n-300x285.jpg",
        "play_date" : "2020-06-01",
        "name" : "First Episode",
        "description" : "Lovely first episode",
        "download_link" : "https://our.rad.io/arcsi/item/1/download",        
        "download_count" : "5"       
    },
    {
        "id" : 56789,
        "number" : 2,
        "archived" : true,
        "image_url" : "https://www.lahmacun.hu/wp-content/uploads/lahma_merites_EP01-300x330.png",
        "play_date" : "2020-06-11",
        "name" : "Second Episode",
        "description" : "Lovely second episode",
        "download_link" : "https://our.rad.io/arcsi/item/2/download",
        "download_count" : "10"
    },
    {
        "id" : 987564,
        "number" : 3,
        "archived" : true,
        "image_url" : "https://www.lahmacun.hu/wp-content/uploads/HAVIZAJ-300x136.jpg",
        "play_date" : "2020-08-18",
        "name" : "Third Episode",
        "description" : "Lovely third episode",
        "download_link" : "https://our.rad.io/arcsi/item/3/download",
        "download_count" : "2"        
    }
]';

$showarcsi = json_decode($showarcsiJSON, true);

?>


<?php 
// print_r($showarcsi);
foreach($showarcsi as $archiveitem) {
?>

<div class="arcsiblokk">
    <div class="arcsiimage">
        <img src="<?php echo $archiveitem['image_url']; ?>" alt="">  
    </div>
    <div class="arcsiinfos">
        <div>Episode nr. <?php echo $archiveitem['number']; ?></div>
        <h4><?php echo $archiveitem['name']; ?></h4>   
        <p><?php echo $archiveitem['description']; ?></p> 
        <p>Was aired on <?php echo $archiveitem['play_date']; ?></p> 
        <a href="<?php echo $archiveitem['download_link']; ?>">Download</a>              
    </div>
</div>
  
<?php
}
?>


</article><!-- #post-## -->
