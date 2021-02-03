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
$('#main a:not(.swipebox):not(.avoidAjax)').each(function() {
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

//Arcsi player helper functions

let audioLink = null
let audioTitle = ""

function stopAllAudio() {
    radio_player.$children[0].stop()
    $("audio.episodeplay").remove()
}

function arcsiPlay(episodeName) {
    document.body.classList.add("Playing");
    // console.log(episodeName + " playing")
    gtag('event', 'Arcsi play', {
        'event_category': episodeName,
        'event_label': 'Play state',
        'value': 1,
    });
}

function arcsiStop(episodeName) {
    document.body.classList.remove("Playing");
    // console.log(episodeName + " stopped")
    gtag('event', 'Arcsi stop', {
        'event_category': episodeName,
        'event_label': 'Play state',
        'value': 0,
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

    jQuery(document).on("click", ".arcsilisten", function(e) {
        e.preventDefault();

        audioTitle = $(this).attr('title') // maybe from arcsi json is better?

        let listenLink = $(this).attr('href')

        let parentId = $(this).parent("div").attr("id")
        //console.log(parentId)
        $(this).find('i').removeClass('fa-headphones').addClass('fa-cog fa-spin')

        fetch(listenLink) 
            .then(response => response.text()) // Transform the data into simple text (acc. to arcsi's listen interface spec)
            .then(text => {
                audioLink = text // response should be the raw audio URL from Lahma store
            } )
            .then( () => { // assemble and insert player
                stopAllAudio()
                $(".arcsicontrols a").removeClass("hiddenelement")
                let $player = `
                    <audio controls id="arcsiplayer" class="episodeplay" title="${audioTitle}">
                        <source src="${audioLink}" type="audio/mpeg">
                        Your browser does not support the audio tag.
                    </audio>
                `
                $("#" + parentId).append($player)
                $("#" + parentId + " > a").addClass("hiddenelement")
            } )
            .then( () => { // player logistics
                let myPlayer = document.getElementById('arcsiplayer');
                myPlayer.addEventListener("play", (e) => {
                    arcsiPlay(audioTitle)
                })
                myPlayer.addEventListener("pause", (e) => {
                    arcsiStop(audioTitle)
                })
                myPlayer.addEventListener("ended", (e) => {
                    arcsiStop(audioTitle)
                })
                myPlayer.play();
                $(this).find('i').removeClass('fa-cog fa-spin').addClass('fa-headphones')

            } )
            .catch( error => {
                console.log(error)
                $(this).find('i').removeClass('fa-cog fa-spin').addClass('fa-headphones')
            }  )
    
    });

    let ascending = true
    // reverse order
    jQuery(document).on('click', '#sortreverse', function(e) {
        e.preventDefault()

        jQuery('.arcsi-blokks').html(jQuery('.arcsi-blokks').find(jQuery('.arcsi-blokks .arcsiblokk')).get().reverse());

        if (ascending) {
            ascending = false
            $(this).find('i').removeClass('fa-sort-numeric-asc').addClass('fa-sort-numeric-desc')
        } else {
            ascending = true
            $(this).find('i').removeClass('fa-sort-numeric-desc').addClass('fa-sort-numeric-asc')
        }
    })

});

