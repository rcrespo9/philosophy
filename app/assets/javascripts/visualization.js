var female_array = [];
var male_array = [];

$(function(){
	payloadReceiver();
});

// send ajax GET request to server
function payloadReceiver() {
	var request = $.ajax({
		url: '/transmit',
		method: 'GET',
		dataType: 'json',
		success: function(data) {
			female_array = data.female_data;
			male_array = data.male_data;
			createChart();
		}
	});
}

function createChart() {
	// line graph
	var lineChartData = {
		labels : ["under 21","21-25","26-30","31-35","36-40","41-45","46-50", "51-55", "56-60", "61-65", "65+"],
		datasets : [
			{
				fillColor : "rgba(255,102,102,0.5)",
				strokeColor : "rgba(255,102,102,1)",
				pointColor : "rgba(255,102,102,1)",
				pointStrokeColor : "#fff",
				data : female_array
			},
			{
				fillColor : "rgba(11,44,60,0.5)",
				strokeColor : "rgba(11,44,60,1)",
				pointColor : "rgba(11,44,60,1)",
				pointStrokeColor : "#fff",
				data : male_array
			}
		],
	};

	var chartOptions = {
		scaleFontColor: '#333745',
		scaleLineColor: "rgba(51,55,69,.1)",
		scaleFontFamily: "'Droid Sans'",
		scaleFontSize: 10
	};
	var myLine = new Chart(document.getElementById("canvas").getContext("2d")).Line(lineChartData, chartOptions);
}

