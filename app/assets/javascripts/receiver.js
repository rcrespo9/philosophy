var female_array;
var male_array;

function payloadReceiver() {
	var request = $.ajax({
		url: '/transmit',
		method: 'GET',
		dataType: 'json'
	})
	.done(function(data){
		female_array = data.female_data;
		male_array = data.male_data;
	});
}