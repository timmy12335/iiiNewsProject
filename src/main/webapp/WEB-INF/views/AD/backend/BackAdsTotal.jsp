<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後臺管理 廣告商業列表</title>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script>
window.onload=function(){
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/getAllOrderPriceAndCount.map' />", true);
	xhr.send();
	
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var responseData = xhr.responseText;
			console.log("=======OKOK========");
			console.log("responseData :"+responseData);
// 			let text = document.getElementById("BarChartText");
// 			text.innerHTML="各類型上傳則數";
			
			var data = JSON.parse(responseData);
			console.log("JSON parse :"+data);
			var monthPrice = data.monthPrice;
			var monthCount = data.monthCount;
			console.log("colA:"+monthPrice+",colB:"+monthCount);
			
			let price = document.getElementById("monthlyPrice");
			price.innerHTML= monthPrice;
			let count = document.getElementById("monthlyCount");
			count.innerHTML= monthCount;
			
			document.getElementById("monthlyRate").innerHTML= Math.round(monthPrice / monthCount);
		}
	}
	
}
</script>
<style>
	html{
		margin-left:calc(100vw - 100%);
		overflow-y: scroll;
	}
</style>
</head>
<body>
<jsp:include page="/fragment/BMnav.jsp"></jsp:include>

	
	<div class='card-body'>
		<h3>後臺管理 廣告商業列表</h3>
		<br>
		<div class="row">
			<div class="col-md-6 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
	                	<p class="card-title text-md-center text-xl-left">Sales 本月總業績</p>
	                	<div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
	                    	<h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0" id="monthlyPrice"></h3>
	                    	<i class="ti-money icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
	                  	</div>  
<!-- 	                  	<p class="mb-0 mt-2 text-info">2020-11 <span class="text-black ml-1"><small>(2020-11-27)</small></span></p> -->
	                </div>
	                <div class="card-body">
	                	<p class="card-title text-md-center text-xl-left">Sales 交易筆數</p>
	                	<div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
	                    	<h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0" id="monthlyCount"></h3>
	                    	<i class="ti-shopping-cart icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
	                  	</div>  
<!-- 	                  	<p class="mb-0 mt-2 text-danger">0.12% <span class="text-black ml-1"><small>(30 days)</small></span></p> -->
	                </div>
	                <div class="card-body">
	                	<p class="card-title text-md-center text-xl-left">Sales 平均單筆價格</p>
	                	<div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
	                    	<h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0" id="monthlyRate"></h3>
	                    	<i class="ti-stats-up icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
	                  	</div>  
<!-- 	                  	<p class="mb-0 mt-2 text-danger">0.12% <span class="text-black ml-1"><small>(30 days)</small></span></p> -->
	                </div>
				</div>
			</div>

			<div class="col-md-6 grid-margin stretch-card">
            	<div class="card">
            		<div class="card-header">
	                	<div class="d-flex justify-content-center justify-content-md-end">
		                    <button class="btn btn-sm btn-outline-light text-primary rounded-0 border-0 d-none d-md-block" type="button" id="getCount1" onclick="getLine()">得到折線圖</button>
		                    <button class="btn btn-sm btn-outline-light text-primary rounded-0 border-0 d-none d-md-block" type="button" id="getCount" onclick="getCount()">得到柱狀圖</button>
	                  	</div>
                	</div>
                	<div class="card-body">
                		<p class="card-title text-md-center text-xl-left"><i class="ti-bar-chart icon-sm text-muted"></i>&nbsp;&nbsp;Charts 圖表</p>
                		<p class="text-muted font-weight-light" id="BarChartText">點擊以查詢各項圖表</p>
                  		<canvas id="chartBar" width="400" height="180"></canvas>
                	</div>
                	
				</div>
			</div>
			
			
<!-- 			<div class="col-md-6 grid-margin stretch-card"> -->
<!--             	<div class="card"> -->
<!--                 	<div class="card-body"> -->
<!--                 		<p class="card-title">Sales details</p> -->
<!--                 		<p class="text-muted font-weight-light">Received overcame oh sensible so at an. Formed do change merely to county it. Am separate contempt domestic to to oh. On relation my so addition branched.</p> -->
<!--                  		<div id="sales-legend" class="chartjs-legend mt-4 mb-2"></div> -->
<%--                   		<canvas id="cateChart"></canvas> --%>
<!--                 	</div> -->
<!--                 <div class="card border-right-0 border-left-0 border-bottom-0"> -->
<!--                 	<div class="d-flex justify-content-center justify-content-md-end"> -->
<!--                     <div class="dropdown flex-md-grow-1 flex-xl-grow-0"> -->
<!--                     	<button class="btn btn-lg btn-outline-light dropdown-toggle rounded-0 border-top-0 border-bottom-0" type="button" id="dropdownMenuDate2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"> -->
<!--                         Today -->
<!--                     	</button> -->
<!--                     	<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuDate2"> -->
<!-- 	                        <a class="dropdown-item" href="#">January - March</a> -->
<!-- 	                        <a class="dropdown-item" href="#">March - June</a> -->
<!-- 	                        <a class="dropdown-item" href="#">June - August</a> -->
<!-- 	                        <a class="dropdown-item" href="#">August - November</a> -->
<!--                     	</div> -->
<!--                     </div> -->
<!--                     <button class="btn btn-lg btn-outline-light text-primary rounded-0 border-0 d-none d-md-block" type="button"> View all </button> -->
<!--                   	</div> -->
<!--                 	</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
		<hr>
		</div>
	</div>
	<jsp:include page="/fragment/BMfoot.jsp"></jsp:include>
	
<script type="text/javascript">
function getCount(){
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/getEachCatePrice.map' />", true);
	xhr.send();
	
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var responseData = xhr.responseText;
			console.log("=======OKOK========");
			console.log("responseData :"+responseData);
			let text = document.getElementById("BarChartText");
			text.innerHTML="各類型上傳則數";
			
			var count = JSON.parse(responseData);
			var bardata = Object.values(count);
			var maxdata = Math.max(...bardata);
			
			  if ($("#chartBar").length) {
			      var SalesChartCanvas = $("#chartBar").get(0).getContext("2d");
			      var SalesChart = new Chart(SalesChartCanvas, {
			        type: 'bar',
			        data: {
			          labels: ["A 頭版頁首", "B 頭版側標", "C 內頁頁首", "D 內頁側標", "E 內文小廣告"],
			          datasets: [{
			              label: '上傳則數',
			              data: bardata,
			              backgroundColor: '#EAC83F'
			            }
			          ]
			        },
			        options: {
			          responsive: true,
			          maintainAspectRatio: true,
			          title:{
			        	  display:false,
			        	  text:"各類型上傳則數"
			          },
			          layout: {
			            padding: {
			              left: 0,
			              right: 0,
			              top: 20,
			              bottom: 0
			            }
			          },
			          scales: {
			            yAxes: [{
			              display: true,
			              gridLines: {
			                display: false,
			                drawBorder: false
			              },
			              ticks: {
			                display: true,
			                min: 0,
			                max: maxdata*1.5
			              }
			            }],
			            xAxes: [{
			              stacked: false,
			              ticks: {
			                beginAtZero: true,
			                fontColor: "#8B8C8E"
			              },
			              gridLines: {
			                color: "rgba(0, 0, 0, 0)",
			                display: false
			              },
			              barPercentage: 1
			            }]
			          },
			          legend: {
			            display: false,
			            position: 'left',
			            labels:{fontSize:15}
			          },
			          elements: {
			            point: {
			              radius: 0
			            }
			          }
			        },
			      });
			    }
		}
	}
}


function getLine(){
	if ($("#chartArea").length) {
	    var lineChartCanvas = $("#chartArea").get(0).getContext("2d");
	    let text = document.getElementById("BarChartText");
		text.innerHTML="日期折線圖";
	    var lineChart = new Chart(lineChartCanvas, {
	      type: 'line',
	      data: data,
	      options: options
	    });
	  }
}


var data = {
	    labels: ["2013", "2014", "2014", "2015", "2016", "2017"],
	    datasets: [{
	      label: '# of Votes',
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

</script>
</body>
</html>