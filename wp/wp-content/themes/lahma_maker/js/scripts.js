/* LAHMACUN GLOBAL SCRIPTS */

var $ = jQuery.noConflict();

/* Touch detect */
var deviceAgent = navigator.userAgent.toLowerCase();
var isTouchDevice = Modernizr.touch || (deviceAgent.match(/(iphone|ipod|ipad)/) || deviceAgent.match(/(android)/)  || deviceAgent.match(/(iemobile)/) || deviceAgent.match(/iphone/i) || deviceAgent.match(/ipad/i) || deviceAgent.match(/ipod/i) || deviceAgent.match(/blackberry/i) || deviceAgent.match(/bada/i));

function is_touch_device() {

if (isTouchDevice) {
	//Do something touchy
	$('a').off('hover');
    $("html").addClass("ismobile");
} else {
	//Can't touch this
	$("html").addClass("notmobile");
}

}

function escapeHtml(unsafe) {
    return unsafe
         .replace("&#8211;", "—")
         .replace("&amp;", "and")
         .replace("&lt;", "-")
         .replace("&gt;", "-")
         .replace("&quot;", "”")
         .replace("&#039;", "‘");
 }

function openAllExternalBlank() {
$('#main a:not(.swipebox)').each(function() {
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

function set_home_class(scope){
    if (scope.pathname == "/"  &&  scope.hash.length <= 1  &&  scope.search.length <= 1) {
        jQuery("body").addClass("home");
    } else {
        jQuery("body").removeClass("home");
    }
}

// photo album picture click automation
function makeAlbumPictureClick() {
    $(".wp-block-gallery .blocks-gallery-item").each(function(){
        let albumlink = $(this).find("figcaption > a").attr("href");
        if ( albumlink ) {
            $(this).find("figure > img").wrap("<a href=" + albumlink + "></a>");
        }
    });    
}


// A $( document ).ready() block.
$( document ).ready(function() {

    is_touch_device();
    openAllExternalBlank();
    swipeboxGalleryFixer();
    makeAlbumPictureClick();

    // popstate event handler for browser back button
    window.addEventListener("popstate", function(e) {
        var loc = document.location;

        $("#main").load(loc.href + " #primary", function(responseText) {
            var newtitle = escapeHtml(responseText.match(/<title>([^<]*)/)[1]);
            document.title = newtitle;
            openAllExternalBlank();
            swipeboxGalleryFixer();
            makeAlbumPictureClick();
            set_home_class(document.location);
        });
    });

    // check if is on home an add class
    set_home_class(document.location);


    /* AJAX link click */
    jQuery(document).on("click", "#page a[target!='_blank']:not(a[href^='#']):not(.swipebox):not(.avoidAjax)", function(e){
        var link = jQuery(this).attr("href");

        jQuery("#main").load( link + " #primary", function(responseText) {
            var newtitle = escapeHtml(responseText.match(/<title>([^<]*)/)[1]);
            document.title = newtitle;
            openAllExternalBlank();
            swipeboxGalleryFixer();
            makeAlbumPictureClick();
            $("#primary-menu .sub-menu").slideUp("fast", function() {
                $(this).addClass("closed");
            });
            
        }
        );
        e.preventDefault();
        history.pushState({}, null, link);
        set_home_class(document.location);
        jQuery(".main-navigation ul.menu li:hover > ul").hide();

    });

// Main-menu toggler
$(document).on("click", "html.ismobile nav.main-navigation li.menu-item-has-children a", function(e){
    $(this).parentsUntil("ul").find("ul.sub-menu").toggle();
    e.preventDefault;
})


// Shows menu remove closed class on hover
$(document).on("mouseenter", "ul.nav-menu > li", function(e){
    $(this).find("ul.sub-menu").removeClass("closed");
})


// Dates Sorter

var dateobj = new Date();
var ndateobj = dateobj.getDay() || 8 - 1;
var gooddateobj = ndateobj - 1;
var datedifference = 7 - gooddateobj;

window.onfocus = function() {
		var Cdateobj = new Date();
		var Cndateobj = Cdateobj.getDay() || 8 - 1;
		var Cgooddateobj = Cndateobj - 1;

    if ( Cgooddateobj !== gooddateobj && !$("body").hasClass("Playing") ) {
        location.reload();
    }

};

function sortDates( callbackFunction ) {
	$(".day").not(".sorted").addClass("notsorted");
	$(".day.notsorted").each(function(i){
        if ( i < gooddateobj ) {
            $(this).appendTo($("#endofweek"));
        }
        $(".day").removeClass("notsorted").addClass("sorted");
        
    });
    
    $(".schedulewrap > .day").first().addClass("today");
    $(".day.today").children("h3").addClass("openedSchedule");
    $(".day").not(".today").children("ul").hide();

	callbackFunction();

}

function dateWriteSchedule() {
	const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
	var i = 0;
	$(".schedulewrap .sorted > h3:not(.addedDate)").each(function(i){
		var nextday = new Date(dateobj.getFullYear(),dateobj.getMonth(),dateobj.getDate()+i);
		var $dateformat = "<div class='scheddate'>" + monthNames[nextday.getMonth()] + " " + nextday.getDate() + "</div>";
		$(this).addClass("addedDate").append($dateformat);
		i++;
	})

}

$( document ).on("ajaxComplete", function(){
	sortDates( dateWriteSchedule );
});

$( ".shows-block" ).ready(function(){
	sortDates( dateWriteSchedule );
});

// toggle day sub-items
$(document).on("click", ".day > h3", function(){
    $(this).toggleClass("openedSchedule").next("ul").slideToggle();
});

// Close Donate
$(document).on("click", "#donatebanner a#closedonate", function(e){
	$(this).hide();
	$("#donatebanner").slideUp();
	e.preventDefault;
})

// Donate Campaigns
let progresswidth = $( "#donatebanner .campaign-progress-bar" ).attr( "aria-valuenow" );
$("#donatebanner .goalprogress").text(Math.round(progresswidth*100)/100 + "%")
});

