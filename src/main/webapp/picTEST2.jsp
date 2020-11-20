<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> -->
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.4.0/dist/chartjs-plugin-datalabels.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>

<style>

</style>
</head>
<body>

<canvas id="pie-chart"></canvas>

<script>
var data = [{
	   data: [50, 55, 60, 33],
	   labels: ["India", "China", "US", "Canada"],
	   backgroundColor: [
	     "#4b77a9",
	     "#5f255f",
	     "#d21243",
	     "#B27200"
	   ],
	   borderColor: "#fff"
	 }];

	 var options = {
	   tooltips: {
	     enabled: false
	   },
	   plugins: {
	     datalabels: {
	       formatter: (value, ctx) => {

	         let datasets = ctx.chart.data.datasets;

	         if (datasets.indexOf(ctx.dataset) === datasets.length - 1) {
	           let sum = datasets[0].data.reduce((a, b) => a + b, 0);
	           let percentage = Math.round((value / sum) * 100) + '%';
	           return percentage;
	         } else {
	           return percentage;
	         }
	       },
	       color: '#fff',
	     }
	   }
	 };


	 var ctx = document.getElementById("pie-chart").getContext('2d');
	 var myChart = new Chart(ctx, {
	   type: 'pie',
	   data: {
	     datasets: data
	   },
	   options: options
	 });
	        
	        
</script>

</body>
</html>
