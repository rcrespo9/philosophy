// Wait until the document is ready
$(function(){
	// Initialise noUiSlider
	$('.noUiSlider').noUiSlider({
	    range: ["0", "2001"],
	    start: "0",
	    handles: 1,
	    slide: function(){
			var days = parseInt($(this).val());
			var money = "$" + parseInt($(this).val()) * 500;

			if (days == "2001" && money > "$1000000") {
				days = "+2000"
				money = "+$1000000"
			};
			
			$(this).next('#days').text(
				  days + ' days sold'
			);

			$(this).nextAll('#money').text(
				  money + ' earned'
			);				
	    }

	});

	$('#submit_value').on("click", function() {
		var days = parseInt($('.noUiSlider').val());
			if (days == "2001") {
				days = "+2000"
			};
		alert(days);

		var age = $('#age option:selected').text();
		alert(age);

		var gender = $('input[name=gender]:checked').val();
		alert(gender);
	});

});