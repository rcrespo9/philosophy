var bla = {age: "30", value: "30 days", gender: "male"};

function feedDB() {
	$.ajax({
		url: '/receiver',
		method: 'POST',
		dataType: 'json',
		data: {user: bla},
		success: function() {
			window.location = "http://localhost:3000/test_index";
		}
	});
	// .done(function(data){
	// 	console.log(data);
	// });
}

function confirmSuccess() {
	alert("complete");
}