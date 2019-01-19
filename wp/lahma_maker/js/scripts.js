/* LAHMACUN GLOBAL SCRIPTS */

var $ = jQuery.noConflict();


function is_touch_device() {
if(window.matchMedia("(any-pointer: coarse)").matches) {
    // touchscreen
    //console.log( "touch!" );
    $("html").addClass("ismobile");
}
}


// A $( document ).ready() block.
$( document ).ready(function() {
    // console.log( "ready!" );
    is_touch_device();
});