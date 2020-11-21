<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後臺管理 廣告商業列表</title>

<script>

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
	                    	<h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0">34040</h3>
	                    	<i class="ti-money icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
	                  	</div>  
	                  	<p class="mb-0 mt-2 text-danger">0.12% <span class="text-black ml-1"><small>(30 days)</small></span></p>
	                </div>
	                <div class="card-body">
	                	<p class="card-title text-md-center text-xl-left">Sales 交易筆數</p>
	                	<div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
	                    	<h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0">34040</h3>
	                    	<i class="ti-shopping-cart icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
	                  	</div>  
	                  	<p class="mb-0 mt-2 text-danger">0.12% <span class="text-black ml-1"><small>(30 days)</small></span></p>
	                </div>
	                <div class="card-body">
	                	<p class="card-title text-md-center text-xl-left">Sales 成交比例</p>
	                	<div class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
	                    	<h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0">34040</h3>
	                    	<i class="ti-stats-up icon-md text-muted mb-0 mb-md-3 mb-xl-0"></i>
	                  	</div>  
	                  	<p class="mb-0 mt-2 text-danger">0.12% <span class="text-black ml-1"><small>(30 days)</small></span></p>
	                </div>
				</div>
			</div>

			<div class="col-md-6 grid-margin stretch-card">
            	<div class="card">
            		<div class="card-header">
	                	<div class="d-flex justify-content-center justify-content-md-end">
		                    <button class="btn btn-sm btn-outline-light text-primary rounded-0 border-0 d-none d-md-block" type="button" id="getCount1" onclick="#">得到折線圖</button>
		                    <button class="btn btn-sm btn-outline-light text-primary rounded-0 border-0 d-none d-md-block" type="button" id="getCount" onclick="getCount()">得到柱狀圖</button>
	                  	</div>
                	</div>
                	<div class="card-body">
                		<p class="card-title text-md-center text-xl-left"><i class="ti-bar-chart icon-sm text-muted"></i>&nbsp;&nbsp;Charts 圖表</p>
                		<p class="text-muted font-weight-light" id="BarChartText">點擊以查詢各項圖表</p>
                  		<canvas id="BarChart" width="400" height="180"></canvas>
                	</div>
                	
				</div>
			</div>
			
			
			<div class="col-md-6 grid-margin stretch-card">
            	<div class="card">
                	<div class="card-body">
                		<p class="card-title">Sales details</p>
                		<p class="text-muted font-weight-light">Received overcame oh sensible so at an. Formed do change merely to county it. Am separate contempt domestic to to oh. On relation my so addition branched.</p>
                 		<div id="sales-legend" class="chartjs-legend mt-4 mb-2"></div>
                  		<canvas id="cateChart"></canvas>
                	</div>
                <div class="card border-right-0 border-left-0 border-bottom-0">
                	<div class="d-flex justify-content-center justify-content-md-end">
                    <div class="dropdown flex-md-grow-1 flex-xl-grow-0">
                    	<button class="btn btn-lg btn-outline-light dropdown-toggle rounded-0 border-top-0 border-bottom-0" type="button" id="dropdownMenuDate2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        Today
                    	</button>
                    	<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuDate2">
	                        <a class="dropdown-item" href="#">January - March</a>
	                        <a class="dropdown-item" href="#">March - June</a>
	                        <a class="dropdown-item" href="#">June - August</a>
	                        <a class="dropdown-item" href="#">August - November</a>
                    	</div>
                    </div>
                    <button class="btn btn-lg btn-outline-light text-primary rounded-0 border-0 d-none d-md-block" type="button"> View all </button>
                  	</div>
                	</div>
				</div>
			</div>
		<hr>
		<a href='..'>回前頁</a>
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
			var colA = count[100];
			var colB = count[200];
			var colC = count[300];
			var colD = count[400];
			var colE = count[500];
			
			  if ($("#BarChart").length) {
			      var SalesChartCanvas = $("#BarChart").get(0).getContext("2d");
			      var SalesChart = new Chart(SalesChartCanvas, {
			        type: 'bar',
			        data: {
			          labels: ["A 頭版頁首", "B 頭版側標", "C 內頁頁首", "D 內頁側標", "E 內文小廣告"],
			          datasets: [{
			              label: '上傳則數',
			              data: [colA,colB,colC,colD,colE],
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
			                max: 30
			              }
			            }],
			            xAxes: [{
			              stacked: false,
			              ticks: {
			                beginAtZero: true,
			                fontColor: "#9fa0a2"
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


</script>
</body>
</html>