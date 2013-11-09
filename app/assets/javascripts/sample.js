$(function(){
	$("#day_button").on("click", function() {
		var day = $('#user_form option:selected').text();
		alert(day);
	});

$(".dial").knob({
    'min':0,
    'max':7
    });
});