// Wait until the document is ready
$(function(){
	// Initialise noUiSlider
	$('.noUiSlider').noUiSlider({
	    range: [0, 2001],
	    start: 0,
	    handles: 1,
	    slide: function(){
			var days = parseInt($(this).val());

			if (days > 2000) {
				days = 2000 + "+"
			};
			
			$(this).next('h1').text(
				days + ' days sold'
			);					
	   }
	});
});