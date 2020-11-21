<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>圖表</title>
<script src="https://code.highcharts.com/highcharts.js"></script>
<!-- <script src="https://code.highcharts.com/modules/series-label.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script> -->

<script>
window.onload=function(){
	var newsTypeNum,newsTypeCount;
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/getMtArtReport.json'/>", true);
	xhr.send();
	var xhr0 = new XMLHttpRequest();
	xhr0.open("GET", "<c:url value='/getMtCateReport.json'/>", true);
	xhr0.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr0.readyState == 4) {
			if (xhr.status == 200 && xhr0.status == 200){
				var responseData = xhr.responseText;  
				var responseData0 = xhr0.responseText;
//    				console.log(responseData);
 				
 				newsTypeNum = JSON.parse(responseData);
 				newsTypeCount = JSON.parse(responseData0);
 				
 				console.log(newsTypeNum);
 				console.log(newsTypeCount);
 		    	Type(newsTypeNum,newsTypeCount);

			} else {
				alert(xhr.status);
			}
		}
		
	}
</script>

<style>
.highcharts-figure, .highcharts-data-table table {
	min-width: 360px;
	max-width: 800px;
	margin: 1em auto;
}

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}

.highcharts-data-table caption {
	padding: 1em 0;
	font-size: 1.2em;
	color: #555;
}

.highcharts-data-table th {
	font-weight: 600;
	padding: 0.5em;
}

.highcharts-data-table td, .highcharts-data-table th,
	.highcharts-data-table caption {
	padding: 0.5em;
}

.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even)
	{
	background: #f8f8f8;
}

.highcharts-data-table tr:hover {
	background: #f1f7ff;
}
</style>
</head>
<body>
	<figure class="highcharts-figure">
		<div id="artReport"></div>

	</figure>
	<script>
		Highcharts.chart('artReport', {

			title : {
				text : '一週報表'
			},

			legend : {
				layout : 'vertical',
				align : 'right',
				verticalAlign : 'middle'
			},

			plotOptions : {
				series : {
					label : {
						connectorAllowed : false
					},
					pointStart : 2010
				}
			},

			series : [
					{
						name : '每日數量',
						data : [ 43934, 52503, 57177, 69658, 97031, 119931,
								137133, 154175 ]
					},
					{
						name : '未分類',
						data : [ 24916, 24064, 29742, 29851, 32490, 30282,
								38121, 40434 ]
					},
					{
						name : '生活',
						data : [ 11744, 17722, 16005, 19771, 20185, 24377,
								32147, 39387 ]
					},
					{
						name : '娛樂',
						data : [ null, null, 7988, 12169, 15112, 22452, 34400,
								34227 ]
					},
					{
						name : '問卦',
						data : [ 12908, 5948, 8105, 11248, 8989, 11816, 18274,
								18111 ]
					},
					{
						name : '美食',
						data : [ 55688, 7634, 7521, 8851, 9475, 24158, 6733,
								4555 ]
					}, {
						name : '運動',
						data : [ 1290, 594, 810, 1124, 898, 1181, 1827, 1111 ]
					}, {
						name : '趣味',
						data : [ 1208, 598, 8105, 1248, 889, 1116, 1874, 8111 ]
					}, {
						name : '寵物',
						data : [ 2908, 548, 105, 1248, 989, 1816, 274, 811 ]
					} ],

			responsive : {
				rules : [ {
					condition : {
						maxWidth : 500
					},
					chartOptions : {
						legend : {
							layout : 'horizontal',
							align : 'center',
							verticalAlign : 'bottom'
						}
					}
				} ]
			}

		});
		
		window.onload = function() {
			var ctx = document.getElementById('artReport').getContext('2d');
			window.myDoughnut = new Chart(ctx, config);
		};

	</script>


</body>
</html>