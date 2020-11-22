<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
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
				// 			let text = document.getElementById("BarChartText");
				// 			text.innerHTML="各類型上傳則數";

				var cateObj = JSON.parse(responseData);
				console.log("cate :" + cateObj);
				Cate(cateObj);
				document.getElementById("barChart").innerHTML;
			}
		}
	}
</script>
<style>
h4{
text-align:center;
}
</style>

</head>
<body>
<jsp:include page="/fragment/BMnav.jsp"></jsp:include>
<!-- <div class="main-panel"> -->
        <!-- <div class="content-wrapper"> -->
        <div>
<!--             <div class="row"> -->
                <div class="col-lg-8 grid-margin stretch-card" style="margin:30px auto;">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">每日發文量</h4>
                            <canvas id="lineChart"></canvas>
                        </div>
                    </div>
                </div>
<!--                 <div class="col-lg-6 grid-margin stretch-card"> -->
<!--                     <div class="card"> -->
<!--                         <div class="card-body"> -->
<!--                             <h4 class="card-title">發文種類</h4> -->
<!--                             <canvas id="barChart"></canvas> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
            <!-- partial -->
        </div>
        
        
        <div>
<!--             <div class="row"> -->
<!--                 <div class="col-lg-6 grid-margin stretch-card"> -->
<!--                     <div class="card"> -->
<!--                         <div class="card-body"> -->
<!--                             <h4 class="card-title">每日發文量</h4> -->
<!--                             <canvas id="lineChart"></canvas> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->

                <div class="col-lg-8 grid-margin stretch-card" style="margin:50px auto;">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">發文類型分析</h4>
                            <canvas id="barChart"></canvas>
                        </div>
                    </div>
                </div>
<!--             </div> -->
            <!-- partial -->
        </div>
    <!-- </div> -->
    <jsp:include page="/fragment/BMfoot.jsp"></jsp:include>
<script>
function Cate(cateObj){
	let CateA = Object.keys(cateObj);	//Cate取得Key值
	console.log(CateA);
	console.log(CateA[0]);
	
	let CateV = Object.values(cateObj);	//Cate取得Value值
	console.log(CateV);
	console.log(CateV[0]);

    var LINECHART = {
        labels: ["2013333", "2014", "2014", "2015", "2016", "2017"],
        datasets: [{
            label: '# 每日發文量',
            data: [10, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1,
            fill: false
        }]
    };

    var BARCHART = {
        labels: CateA,
        datasets: [{
            label: '# 發文數量',
            data: CateV,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(247, 80, 0, 0.2)',
                'rgba(173, 90, 90, 0.2)',
                'rgba(0, 166, 0, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(247, 80, 0, 1)',
                'rgba(173, 90, 90, 1)',
                'rgba(0, 166, 0, 1)'
            ],
            borderWidth: 1,
            fill: false
        }]
    };


    var options = {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        },
        legend: {
            display: false
        },
        elements: {
            point: {
                radius: 0
            }
        }

    };

if ($("#barChart").length) {
        var barChartCanvas = $("#barChart").get(0).getContext("2d");
        // This will get the first returned node in the jQuery collection.
        var barChart = new Chart(barChartCanvas, {
            type: 'bar',
            data: BARCHART,
            options: options
        });
    }

//     if ($("#lineChart").length) {
//         var lineChartCanvas = $("#lineChart").get(0).getContext("2d");
//         var lineChart = new Chart(lineChartCanvas, {
//             type: 'line',
//             data: LINECHART,
//             options: options
//         });
//     }

}

    
</script>
</body>
</html>