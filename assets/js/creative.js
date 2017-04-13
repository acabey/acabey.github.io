(function($) {
    "use strict"; // Start of use strict

    // jQuery for page scrolling feature - requires jQuery Easing plugin
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: ($($anchor.attr('href')).offset().top - 50)
        }, 1250, 'easeInOutExpo');
        event.preventDefault();
    });

    // Highlight the top nav as scrolling occurs
    $('body').scrollspy({
        target: '.navbar-fixed-top',
        offset: 51
    });

    // Closes the Responsive Menu on Menu Item Click
    $('.navbar-collapse ul li a').click(function() {
        $('.navbar-toggle:visible').click();
    });

    // Offset for Main Navigation
    $('#mainNav').affix({
        offset: {
            top: 100
        }
    })

    // Initialize and Configure Scroll Reveal Animation
    window.sr = ScrollReveal();
    sr.reveal('.sr-icons', {
        duration: 600,
        scale: 0.3,
        distance: '0px'
    }, 200);
    sr.reveal('.sr-button', {
        duration: 1000,
        delay: 200
    });
    sr.reveal('.sr-contact', {
        duration: 600,
        scale: 0.3,
        distance: '0px'
    }, 300);

    // Initialize and Configure Magnific Popup Lightbox Plugin
    $('#popup-gallery-1').magnificPopup({
        delegate: 'a',
        type: 'image',
        tLoading: 'Loading image #%curr%...',
        mainClass: 'mfp-img-mobile',
        gallery: {
            enabled: true,
            navigateByImgClick: true,
            preload: [0, 1] // Will preload 0 - before current, and 1 after the current image
        },
        image: {
            tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
            titleSrc: 'title',
            titleSrc: function(item) {
                return '' +
                '<p class="text text-center">' + 
                    'Lead Programmer for FIRST Team 1757 through the most ' + 
                    '<a href="https://twitter.com/WWRobotics1757/status/850465241259487234"> ' +
                        'successfull season' + 
                    '</a>' +
                    ' in the team\'s history.\n' +
                    'Innovated new methods of ' + 
                    '<a href="https://www.youtube.com/watch?v=YrOXxlsnZ70">' +
                        'robot control ' + 
                    '</a>' +
                    'with PID-assisted driving and vision-processing backed targeting all implemented in ' +
                    '<a href="https://github.com/1757WestwoodRobotics/2017-Steamworks">' +
                        'Java programming' +
                    '</a>' +
                '</p>';
            }
        }
    });
    
        $('#popup-gallery-2').magnificPopup({
        delegate: 'a',
        type: 'image',
        tLoading: 'Loading image #%curr%...',
        mainClass: 'mfp-img-mobile',
        gallery: {
            enabled: true,
            navigateByImgClick: true,
            preload: [0, 1] // Will preload 0 - before current, and 1 after the current image
        },
        image: {
            tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
            titleSrc: 'title',
            titleSrc: function(item) {
                return '' + 
                '<p class="text text-center">' +
                    'Java teacher for supplementary education program, <a href="https://ussteam.org">USSTEAM Academy</a>' +
                '</p>';
            }
        }
    });
    
        $('#popup-gallery-3').magnificPopup({
        delegate: 'a',
        type: 'image',
        tLoading: 'Loading image #%curr%...',
        mainClass: 'mfp-img-mobile',
        gallery: {
            enabled: true,
            navigateByImgClick: true,
            preload: [0, 1] // Will preload 0 - before current, and 1 after the current image
        },
        image: {
            tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
            titleSrc: 'title',
            titleSrc: function(item) {
                return '' + 
                '<p class="text text-center">' +
                    'Assembler for scratch-built computer engineering project, check out the code on <a href="https://github.com/acabey/LogiTimAssembler">Github</a>' +
                '</p>';
            }
        }
    });

})(jQuery); // End of use strict

$(document).ready(function() {
        $('.popup-youtube, .popup-vimeo, .popup-gmaps').magnificPopup({
            disableOn: 700,
            type: 'iframe',
            mainClass: 'mfp-fade',
            removalDelay: 160,
            preloader: false,

            fixedContentPos: false
        });
    });