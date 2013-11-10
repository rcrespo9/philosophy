var days = {message: "feedback"};

function feedDB(days) {
	$.ajax({
		method: "POST",
		dataType: "json",
		url: "/users/feeder",
		data: days,
		complete: confirmSuccess
	});
}

function confirmSuccess() {
	alert("complete");
}