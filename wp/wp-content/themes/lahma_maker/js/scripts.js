/* LAHMACUN GLOBAL SCRIPTS */

var $ = jQuery.noConflict();


function is_touch_device() {
if(window.matchMedia("(any-pointer: coarse)").matches) {
    // touchscreen
    //console.log( "touch!" );
    $("html").addClass("ismobile");
}
}

function escapeHtml(unsafe) {
    return unsafe
         /* 
         .replace(/&/g, "&amp;")
         .replace(/</g, "&lt;")
         .replace(/>/g, "&gt;")
         .replace(/"/g, "&quot;")
         .replace(/'/g, "&#039;")
         .replace(/–/g, "&#8211;");
         */
         .replace("&#8211;", "—")
         .replace("&amp;", "and")
         .replace("&lt;", "-")
         .replace("&gt;", "-")
         .replace("&quot;", "”")
         .replace("&#039;", "‘");
 }
 
function openAllExternalBlank() {
$('a:not(.swipebox)').each(function() {
   var a = new RegExp('/' + window.location.host + '/');
   if(!a.test(this.href)) {
       $(this).click(function(event) {
           event.preventDefault();
           event.stopPropagation();
           window.open(this.href, '_blank');
       });
       $(this).attr('target','_blank');
   }
});
} 
 
function swipeboxGalleryFixer() {
	var X = 0; // set a global var 
	$('.swipebox').each(function() { //for each swipebox
	  X += 1; //increment the global var by 1
	  $(this).attr('rel', 'gallery-' + X); // set the rel attribute to gallery- plus the value of X
	  $(this).attr('target', '');
	});
} 
 

// A $( document ).ready() block.
$( document ).ready(function() {

    // console.log( "ready!" );
    is_touch_device();
    openAllExternalBlank();
    swipeboxGalleryFixer();
    
    
    /* AJAX link click */
    jQuery(document).on("click", "#page a[target!='_blank']:not(a[href^='#']):not(.swipebox)", function(e){
        var link = jQuery(this).attr("href");
        // var title = jQuery(responseHtml).filter('title').text();
        // console.log(title);
        jQuery("#main").load( link + " #primary", function(responseText) {
            var newtitle = escapeHtml(responseText.match(/<title>([^<]*)/)[1]);
            document.title = newtitle; 
            openAllExternalBlank();
            swipeboxGalleryFixer();
            } 
        );
        e.preventDefault();
        history.pushState({}, null, link);
        // jQuery(document).find("title").text(jQuery(responseHtml).filter('title').text());
        jQuery("body").removeClass("home");
        jQuery(".main-navigation ul.menu li:hover > ul").hide();
            
    });

        
    jQuery(document).on("click", ".site-title a", function(e){
        jQuery("body").addClass("home");
    });

    // $(window).on("navigate", function (event, data) {
    //     var direction = data.state.direction;
    //     if (direction == 'back') {
    //       window.history.back;
    //     }
    //     if (direction == 'forward') {
    //       window.history.forward;
    //     }
    //   });
    
        
    // A $( document ).ready() block end    
});


