$(function(){
	$("#day_button").on("click", function() {
		var day = $('#user_form option:selected').text();
		alert(day);
	});
});