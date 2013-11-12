// function payloadReceiver() {
// 	var request = $.ajax({
// 		url: '/transmit',
// 		method: 'GET',
// 		dataType: 'json'
// 	})
// 	.done(function(data){
// 		female_array = data.female_data;
// 		male_array = data.male_data;
// 	});
// }

		// function feedDB() {
		// 	$.ajax({
		// 		url: '/receiver',
		// 		method: 'POST',
		// 		dataType: 'json',
		// 		data: {user: {age: age, gender: gender, value: days }},

		// 		// callback function performs redirect
		// 		success: function() {
		// 			console.log('success');
		// 		}
		// 	});
		// }

		// // send ajax GET request to server
		// function payloadReceiver() {
		// 	var request = $.ajax({
		// 		url: '/transmit',
		// 		method: 'GET',
		// 		dataType: 'json',
		// 		success: function(data) {
		// 			female_array = data.female_data;
		// 			male_array = data.male_data;
		// 			window.location = "./chart";
		// 		}
		// 	});
		// }