<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script> 
    <title>Data Report</title>

<script>
window.onload = function() {
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/getMtArtReport.json' />", true);
		xhr.send();

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var responseData = xhr.responseText;
				console.log("responseData :" + responseData);

				var cateObj = JSON.parse(responseData);	//轉成物件
				console.log("cate :" + cateObj);
				Cate(cateObj);
				document.getElementById("container").innerHTML;
			}
		}
	}
</script>
<style>
.highcharts-figure, .highcharts-data-table table {
    min-width: 310px; 
    max-width: 800px;
    margin: 1em auto;
}

#container {
    height: 500px;
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
.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
    padding: 0.5em;
}
.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
    background: #f8f8f8;
}
.highcharts-data-table tr:hover {
    background: #f1f7ff;
}

</style>

</head>
<body>
	<jsp:include page="/fragment/BMnav.jsp"></jsp:include>
	
		<div align="center" style="margin-top: 30px;">
			<h2>數據分析</h2>
		</div>
		
		<figure class="highcharts-figure">
    		<div id="container"></div>
		</figure>
    <jsp:include page="/fragment/BMfoot.jsp"></jsp:include>
<script>
function Cate(cateObj){
	
	let CateA = Object.keys(cateObj);	//Cate取得Key值
	console.log(CateA);
	console.log(CateA[0]);
	
	let CateV = Object.values(cateObj);	//Cate取得Value值
	console.log(CateV);
	console.log(CateV[0]);

	// Create the chart
	Highcharts.chart('container', {
	    chart: {
	        type: 'column'
	    },
	    title: {
	        text: '各類別統計數量'
	    },
	    xAxis: {
	        type: 'category'
	    },
	    yAxis: {
	        title: {
	            text: ''
	        }
	    
	    }, 
	    legend: {
	        enabled: false
	    },

	    series: [
	        {
	            name: "數量",
	            colorByPoint: true,
	            data: [
	                {
	                    name: CateA[0],
	                    y: CateV[0],
	                },
	                {
	                    name: CateA[1],
	                    y: CateV[1],
	                },
	                {
	                    name: CateA[2],
	                    y: CateV[2],
	                },
	                {
	                    name: CateA[3],
	                    y: CateV[3],
	                },
	                {
	                    name: CateA[4],
	                    y: CateV[4],
	                },
	                {
	                    name: CateA[5],
	                    y: CateV[5],
	                },
	                {
	                    name: CateA[6],
	                    y: CateV[6],
	                },
	                {
	                    name: CateA[7],
	                    y: CateV[7],
	                }
	            ]
	        }
	    ],
	});
}

</script>
</body>
</html>