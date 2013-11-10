var stuff = {age: 30, value: "30", gender: "male"};

function feedDB() {
	$.ajax({
		url: '/receiver',
		method: 'POST',
		dataType: 'json',
		data: stuff
	})
	.done(function(data){
		console.log(data);
	});
}

function confirmSuccess() {
	alert("complete");
}