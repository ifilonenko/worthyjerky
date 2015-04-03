$(document).ready(function(){/* activate scrollspy menu */
$('.active form').card({
  container: $('.card-wrapper')
})
});
//     var $win = $(window),
//         $pencil = $('.pencil-crafted'),
//         $parts = null,
//         $pencilForm = $('.pencil-form-section'),
//         $pencilFrames = $pencilForm.find('.frame-list li'),
//         $buyNow = $('a.action-button:contains("Buy now")'),
//         pencilY = 0,
//         isFirefox = navigator.userAgent.match(/Firefox/) !== null;

//     // Experiment to test which Amazon link leads to a higher conversion ratio
//     // Randomizing link to either point to graphite or walnut.
//     //
//     // NOTE: Modified to enable this experiment only if link matches US store
//     // shortcut link to walnut to avoid problems with international store links.
//     // Joe Bryan, sineLABS - 7/12/2014

//     // TODO: This needs to be fixed to work with international, randomly
//     // clobbering the link.
//     // $('.also-available').each(function(i, obj) {
//     //     if ($(this).attr("href") === "http://amzn.to/RWkOsB" && Math.random() > 0.5)
//     //         $(this).attr("href", "http://amzn.to/1gsJrIF");
//     // });

//     if ($('html').hasClass('no-touch')) {
//         $parts = setPartsData();

//         var animationHandler = function() {
//             pencilPartsHandler();

//             // quick fix to disable turn animation in Firefox
//             if ( isFirefox == false) {
//                 pencilTurnHandler();
//             }
//         };

//         $(document).scroll(animationHandler);
//         $win.resize(animationHandler);
//     }

//     // fadeText()
//     // - $el: the jQuery element whose class will be toggled
//     //
//     // Toggle the 'fade-in' class based on the scroll position of the
//     // pencil section and the fade position of the pencil part.
//     function fadeText($el) {
//         $el.toggleClass('fade-in', pencilY > $el.data('fade'));
//     }

//     // setPartsData()
//     //
//     // Finds the pencil parts, sets the data for each part, and returns
//     // the collection.
//     function setPartsData() {
//         return $pencil.find('li').each(function() {
//             var $part = $(this),
//                 anim = $part.attr('data-anim').split('|');

//             $part
//                 .data('name',     $part.find('.part-name'))
//                 .data('desc',     $part.find('.part-desc'))
//                 .data('isSensor', $part.hasClass('pencil-sensor'))
//                 .data('origin',   parseInt(anim[0], 10))
//                 .data('start',    parseInt(anim[1], 10))
//                 .data('fade',     parseInt(anim[2], 10));
//         });
//     }

//     // movePart()
//     // - $el: the jQuery element that will be moved
//     //
//     // Adjust the CSS top property of the element that will be animated
//     // during scroll.
//     function movePart($el) {
//         var origin = $el.data('origin'),
//             start = $el.data('start'),
//             y = (pencilY > start) ? origin + (pencilY - start) : origin;

//         // special case for the sensor to ease with the battery
//         if (pencilY > 1548 && $el.data('isSensor')) {
//             y -= (1 - (1770 - pencilY) / 225) * 140;
//         }

//         $el.css('top', Math.min(0, y));
//     }

//     // pencilPartsHandler()
//     //
//     // Calculate the pencil y value and move each part based on the scroll
//     // position of the browser window.
//     function pencilPartsHandler() {
//         pencilY = -($pencil.offset().top - ($win.scrollTop() + $win.height()));

//         $parts.each(function() {
//             var $part = $(this);

//             movePart($part);
//             fadeText($part);
//         });
//     }

//     // pencilTurnHandler()
//     //
//     //
//     function pencilTurnHandler() {
//         var scroll = ($win.scrollTop() + $win.height()) - ($pencilForm.offset().top + $pencilForm.outerHeight(true) / 2),
//             ratio = scroll / $win.height() * 1.75;

//         if (ratio >= 0 && ratio < 1) {
//             var nextFrame = Math.floor(ratio * $pencilFrames.length);
//             $pencilFrames
//                 .removeClass('active')
//                 .eq(nextFrame).addClass('active');
//         }
//     }

//     // Google Analytics Buy now click event tracking
//     //
//     //
//     $buyNow.on('click', function(e) {
//         if (typeof ga != 'undefined') {
//             ga('send', 'event', 'button', 'click', 'Buy now');
//         }
//     });

// });