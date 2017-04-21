$('.bxslider').bxSlider({
  minSlides: 4,
  maxSlides: 6,
  slideWidth: 155,
  pager: false
});

function featureSlides() {
 $('ul.feature-slide-wrap').each(function() {
  var $this = $(this);
  var Left = $this.parent().find('.moveleft');
  var Right = $this.next();
  
  $this.cycle({
    fx: 'scrollHorz',
    speed: "fast",
    timeout: 0,
    prev: Left,
    next: Right,  
  });
});     
}
function homeSlides(){
  $('ul.top-inner-wrap') 
  .cycle({ 
   fx: 'scrollHorz',
   speed: "fast",
   timeout: 4000,
   prev: '.prevleft-Home',
   next: '.nextright-Home',
   pager:  '.pager',
   pagerAnchorBuilder: function(index, el) {
    return '<a href="#">&nbsp;</a>';
  }
});
}
featureSlides();
homeSlides();
