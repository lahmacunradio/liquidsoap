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
         .replace(/&/g, "&amp;")
         .replace(/</g, "&lt;")
         .replace(/>/g, "&gt;")
         .replace(/"/g, "&quot;")
         .replace(/'/g, "&#039;")
         .replace(/–/g, "&#8211;");
 }

// A $( document ).ready() block.
$( document ).ready(function() {
    // console.log( "ready!" );
    is_touch_device();
    
/* AJAX link click */
jQuery(document).on("click", "a[target!='_blank']:not(a[href^='#'])", function(e){
	var link = jQuery(this).attr("href");
	// var title = jQuery(responseHtml).filter('title').text();
	// console.log(title);
	jQuery("#content").load( link + " #content", function(responseText) {
	  var newtitle = escapeHtml(responseText.match(/<title>([^<]*)/)[1]);
	  document.title = newtitle; } 
	);
	e.preventDefault();
	history.pushState({}, null, link);
	// jQuery(document).find("title").text(jQuery(responseHtml).filter('title').text());
});
    
    
});



