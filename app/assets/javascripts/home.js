var rightKey, leftKey;

// Wait until the document is ready
$(function(){

	//Set up the triggers for the arrow keys
	$(document).keydown(function(e){
		if (e.keyCode == 37 && typeof leftKey === 'function') {
			leftKey();
		} else if(e.keyCode == 39 && typeof rightKey === 'function') {
			rightKey();
		}
	});

	parallax.add($("#selectionPage"))
			.add($("#home"));

	parallax.background = $("body");

	//Clears each page navigation on load
	parallax.preload = function(){
		rightKey = leftKey = "";
		$(".control").hide();
	};

	//Setting up page navigation
	parallax.home.onload=function(){
		setRight("selectionPage", "Start");
	};

	parallax.selectionPage.onload=function(){
		setLeft("home", "Home");
	};

	//Sets the correct triggers for the arrows, plus arrow keys
	function setRight(page, text){
		$(".start-button").show().unbind('click').click(function(){
			parallax[page].right();
		});
		rightKey = function(){
			parallax[page].right();
		};
	}

	function setLeft(page, text){
		$("#leftControl").show().unbind('click').click(function(){
			parallax[page].left();
		});
		leftKey = function(){
			parallax[page].left();
		};
	}


	//The fadey bits
	$("#leftControl").mouseenter(function(){
		$("#leftArrow").fadeTo(500,1);
		$("#leftText").fadeTo(500,1);
	}).mouseleave(function(){
		$("#leftArrow").stop().fadeTo(500, 0.2);
		$("#leftText").stop().fadeTo(500,0);
	});

	$("#rightControl").mouseenter(function(){
		$("#rightArrow").fadeTo(500,1);
		$("#rightText").fadeTo(500,1);
	}).mouseleave(function(){
		$("#rightArrow").stop().fadeTo(500, 0.2);
		$("#rightText").stop().fadeTo(500,0);
	});

	$(".control").hide();
	parallax.home.show();

	// Initialise noUiSlider
	$('.noUiSlider').noUiSlider({
		range: ["0", "2001"],
		start: "0",
		handles: 1,
		connect: "lower",
		slide: function(){
			var days = parseInt($(this).val()),
				money = "$" + parseInt($(this).val()) * 500,
				amountDays = $('#days'),
				amountMoney = $('#money');

			if (days == "2001" && money > "$1000000") {
				days = "+2000";
				money = "+$1000000";
			}
			
			amountDays.text(days);
			amountMoney.text(money);
		}
	});

	// submit onclick event
	$('#submit_value').on("click", function(){
		var days = parseInt($('.noUiSlider').val());
		var age = $('#age option:selected').val();
		if (age === ""){
			bootbox.alert("Please select an age range.");
		}
		var gender = $('input[name=gender]:checked').val();

		if (age != '') {
			bootbox.confirm("Are you sure you want to proceed? If so, click OK to explain your decision and see other verified responses!", function(result) {
				if (result == true) {
					feedDB();
				};
			});
		};
	});
});

// send ajax POST request to server
function feedDB() {
	var days = parseInt($('.noUiSlider').val());
	var age = $('#age option:selected').val();
	var gender = $('input[name=gender]:checked').val();
	$.ajax({
		url: '/receiver',
		method: 'POST',
		dataType: 'json',
		data: {user: {age: age, gender: gender, value: days }},
		success: function() {
			window.location = "./chart";
		}
	});
}

// background slide
$("#home").backstretch([
    "./assets/earthreflection.jpg", 
    "./assets/moonreflection.jpg",
    "./assets/future-room.jpg"   
  ], {duration: 1250, fade: 750, centeredX: true});

// gender buttons
$('input[name=gender]:radio').iCheck({
	radioClass: 'iradio_square-blue'
});