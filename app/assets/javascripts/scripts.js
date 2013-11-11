
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
				days = "+2000";
				money = "+$1000000";
			}
			
			$(this).next('#days').text(
				days + ' days sold'
			);

			$(this).nextAll('#money').text(
				money + ' earned'
			);
		}
	});

	// submit onclick event
	$('#submit_value').on("click", function(){
		var days = parseInt($('.noUiSlider').val());
		if (days == "2001") {
			days = "+2000";
		}

		var age = $('#age option:selected').val();
		if (age == ""){
			alert("Please select an age range")
		}
		var gender = $('input[name=gender]:checked').val();

		// send ajax POST request to server
		function feedDB() {
			$.ajax({
				url: '/receiver',
				method: 'POST',
				dataType: 'json',
				data: {user: {age: age, gender: gender, value: days }},

				// callback function performs redirect
				success: function() {
					window.location = "http://localhost:3000/test_index";
				}
			});
		}
		if (age != "") {
		feedDB();
		}
	});
});
