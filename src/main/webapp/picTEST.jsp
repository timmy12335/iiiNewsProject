<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
<meta charset="UTF-8">

	<title>Doughnut Chart</title>
	<script src="//www.google-analytics.com/analytics.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script src="js/utils.js"></script>
	<script src="js/Moment.js"></script>
	
	
	<style>
	canvas {
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
	}
	</style>
</head>

<body>
<jsp:include page="/fragment/BMnav.jsp"></jsp:include> 
<div class="card-body" >
	<div id="canvas-holder" style="width:70%">
		<canvas id="chart-area"></canvas>
	</div>
<!-- 	<button id="randomizeData">Randomize Data</button> -->
<!-- 	<button id="addDataset">Add Dataset</button> -->
<!-- 	<button id="removeDataset">Remove Dataset</button> -->
<!-- 	<button id="addData">Add Data</button> -->
<!-- 	<button id="removeData">Remove Data</button> -->
	<button id="changeCircleSize">Semi/Full Circle</button>
	<script>
		
		var randomScalingFactor = function() {
			return Math.round(Math.random() * 100);
		};

		var config = {
			type: 'doughnut',
			data: {
				datasets: [{
					data: [
						
						10,
						20,
						30,
						25,
						15,
						10
				],
						
					backgroundColor: [
						window.chartColors.red,
						window.chartColors.orange,
						window.chartColors.yellow,
						window.chartColors.green,
						window.chartColors.blue,
					],

					
				}],
				labels: [
					'感情',
					'交通',
					'糾紛',
					'詐騙',
					'災情',
					'爆料',
					
				]
			},
			options: {
				responsive: true,
				legend: {

					labels:{
						fontSize:20,
						render:'label'
					
					}
					
				},
				title: {
					display: true,
					text: '本月新聞分類',
					fontSize:30,
					position:'top'
					
				},
				animation: {
					animateScale: true,
					animateRotate: true
				}
			},
			d
			
			
		};

		window.onload = function() {
			var ctx = document.getElementById('chart-area').getContext('2d');
			window.myDoughnut = new Chart(ctx, config);
		};



		document.getElementById('changeCircleSize').addEventListener('click', function() {
			if (window.myDoughnut.options.circumference === Math.PI) {
				window.myDoughnut.options.circumference = 2 * Math.PI;
				window.myDoughnut.options.rotation = -Math.PI / 2;
			} else {
				window.myDoughnut.options.circumference = Math.PI;
				window.myDoughnut.options.rotation = -Math.PI;
			}

			window.myDoughnut.update();
		});
	</script>
	<script type="text/javascript">
	
	</script>
	</div>
</body>

</html>