<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有廣告列表</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
	
	
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-gl/dist/echarts-gl.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-stat/dist/ecStat.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/dataTool.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/china.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/world.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/bmap.min.js"></script>

<style>
/*在此設定margin 以防止被navbar壓到*/
.iiinewsContainer {
	margin-top: 100px;
	margin-bottom: 100px;
	position: relative;
}

html {
	margin-left: calc(100vw - 100%);
	overflow-y: scroll;
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
window.onload = function() {
	var membername ='${CpMemberBean.cpmemberId}';
	console.log(membername);
	let queryString = "?memberId="+ membername;
	console.log(queryString);
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/getCpMemeberSoldListByAjax.json' />" + queryString , true);
	xhr.send();
	
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let responseData = xhr.responseText;
			let ad = JSON.parse(responseData);
			
			let selltotal = 0;
			let jsonlength = 0;
			for (let i in ad){
				selltotal += ad[i].unitPrice;
				jsonlength++;
			}
			$("#thismonthsell").html(selltotal);
			$("#thismonthsoldcount").html(jsonlength);
			console.log("jsonlength:"+jsonlength);
		}
	}
}
</script>
</head>
<body>
	<nav class="navbar fixed-top">
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<div class="iiinewsContainer">
		<div class="container-fluid">


			<div class="row">
				<div class="col-3">
					<div class="col-12 bg-white rounded shadow-sm p-3 mb-5">
						<h3 class="card-header">廣告列表系統</h3>
<%-- 						<h4>帳號：${CpMemberBean.cpmemberId}</h4> --%>
						<h4 class="card-body">${CpMemberBean.cpname}，您好</h4>
					</div>
					<div class="col-12 bg-white rounded shadow-sm p-3 mb-5">
						<h4 class="card-header">檢視報表</h4>
						<div class="card-body">
							<div><i class="fas fa-search"></i>&nbsp;依類型查詢</div>
							<button type="button" class="btn btn-info" id="getCpMemCount" onclick="getCpMemCount()">本月上傳則數</button>
							<button type="button" class="btn btn-info" id="getCpMemPrice" onclick="getCpMemPrice()">本月售出金額</button>
						</div>
					</div>
				</div>
				<div class="col-9">
					<nav>
						<div class="nav nav-tabs" id="nav-tab" role="tablist">
							<a class="nav-item nav-link border-bottom active" id="nav-home-tab"
								data-toggle="tab" href="#nav-home" role="tab"
								aria-controls="nav-home" aria-selected="true">總覽</a>
							<a class="nav-item nav-link border-bottom"id="nav-profile-tab" data-toggle="tab"
								href="#nav-profile" role="tab" aria-controls="nav-profile"
								aria-selected="false">已上傳列表</a>
							<a class="nav-item nav-link border-bottom" id="nav-contact-tab" data-toggle="tab" href="#nav-contact"
								role="tab" aria-controls="nav-contact" aria-selected="false"
								onclick="memberSoldList('${CpAdLists[0].memberId}')">已售出列表</a>
						</div>
					</nav>
					<div class="tab-content bg-white shadow rounded" id="nav-tabContent">
						<div class="tab-pane fade show active p-4" id="nav-home"
							role="tabpanel" aria-labelledby="nav-home-tab">
							<h3>總覽</h3>
							<div class="row">
								<div class="col-4">
									<%-- 								<h3>本月上傳：${fn:length(CpAdLists)}則</h3> --%>
									<div class="card shadow-sm bg-white rounded">
										<div class="card-body">
											<p class="card-title textleft">本月廣告上傳數</p>
											<div
												class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
												<h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0"
													id="thismonthupload">${fn:length(CpAdLists)}</h3>
												<i class="fas fa-file-upload icon-md text-muted fa-3x"></i>
											</div>
<!-- 											<p class="mb-0 mt-2 text-danger"> -->
<!-- 												0.12% <span class="text-black ml-1"><small>(30 -->
<!-- 														days)</small></span> -->
<!-- 											</p> -->
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="card shadow-sm bg-white rounded">
										<div class="card-body">
											<p class="card-title textleft">本月收入收益金額</p>
											<div
												class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
												<h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0"
													id="thismonthsell"></h3>
												<i class="fas fa-money-bill-wave icon-md text-muted fa-3x"></i>
											</div>
<!-- 											<p class="mb-0 mt-2 text-danger"> -->
<!-- 												0.12% <span class="text-black ml-1"><small>(30 -->
<!-- 														days)</small></span> -->
<!-- 											</p> -->
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="card shadow-sm bg-white rounded">
										<div class="card-body">
											<p class="card-title textleft">本月售出則數</p>
											<div
												class="d-flex flex-wrap justify-content-between justify-content-md-center justify-content-xl-between align-items-center">
												<h3 class="mb-0 mb-md-2 mb-xl-0 order-md-1 order-xl-0"
													id="thismonthsoldcount"></h3>
												<i class="fas fa-file-upload icon-md text-muted fa-3x"></i>
											</div>
<!-- 											<p class="mb-0 mt-2 text-danger"> -->
<!-- 												0.12% <span class="text-black ml-1"><small>(30 -->
<!-- 														days)</small></span> -->
<!-- 											</p> -->
										</div>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 30px;">
								<div class="col-6">
									<div id="exampleCard">
										<canvas id="example" width="300" height="200"></canvas>
									</div>
								</div>
								<div class="col-6">
									<div id="exampleCard2">
<!-- 										<div id="piecontainer" style="width:400px;height:300px; -webkit-tap-highlight-color: transparent; user-select: none;"> -->
<!--         									<div> -->
												<canvas id="piecontainer" width="300" height="200"></canvas>
<!-- 											</div> -->
<!-- 										</div> -->
									</div>
								</div>
							</div>
						</div>
						<div class="tab-pane fade p-4" id="nav-profile" role="tabpanel"
							aria-labelledby="nav-profile-tab">
							<h3>您所有上傳的廣告列表</h3>
							<div class="table-responsive">
								<table class="table table-bordered">
									<thead>
										<tr>
											<td>產品編號</td>
											<td>上傳日期</td>
											<td>分類</td>
											<td>寬</td>
											<td>高</td>
											<td>欲販售日期</td>
											<td>單價</td>
											<td>上架狀態</td>
											<td>庫存</td>
											<td>設定</td>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${empty CpAdLists}">
												<tr>
													<td colspan='10' align="center">您無上傳清單</td>
												</tr>
												<tr>
													<td colspan='10' align="center"><a
														href="<c:url value='/uploadAds' />">立即前往刊登吧</a></td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach var="ad" items="${CpAdLists}" varStatus="loop">
													<tr>
														<td>${ad.adNo}</td>
														<td>${fn:substring(ad.uploadDate,0,19)}</td>
														<td><c:choose>
																<c:when test="${ad.categoryNo == 100}">頭版頭</c:when>
																<c:when test="${ad.categoryNo == 200}">頭版側標</c:when>
																<c:when test="${ad.categoryNo == 300}">內頁版頭</c:when>
																<c:when test="${ad.categoryNo == 400}">內頁側標</c:when>
																<c:when test="${ad.categoryNo == 500}">小廣告</c:when>
																<c:otherwise>其他</c:otherwise>
															</c:choose></td>
														<td>${ad.width}</td>
														<td>${ad.height}</td>
														<td>${ad.adDate}</td>
														<td>${ad.price}</td>
														<td><c:if test="${ad.status == 0}">已下架</c:if> <c:if
																test="${ad.status == 1}">上架中</c:if></td>
														<td>${ad.stock}</td>
														<td><a href="<c:url value="#" />">修改</a> <%-- 						<a href="<c:url value="/deleteAdProduct/${ad.adPk}" />" onclick="return confirm('Are you sure?')">刪除</a> --%>
															<button class="btn btn-primary" type="button"
																data-toggle="collapse" data-target="#setAd${loop.index}"
																aria-expanded="false" aria-controls="collapseExample">
																<i class="fas fa-angle-double-down"></i>
															</button></td>
													</tr>
													<tr class="collapse" id="setAd${loop.index}">
														<td colspan='10'>
															<form
																action='<c:url value="/updateAdProduct/"/>${ad.adPk}'
																method="POST">
																<div class="row">
																	<div class="col-6">
																		寬：<input type="text" value="${ad.width}"
																			class="form-control" id="widthchange${loop.index}"
																			name="width" disabled><br> 高：<input
																			type="text" value="${ad.height}" class="form-control"
																			id="heightchange${loop.index}" name="height" disabled><br>
																	</div>
																	<div class="col-6">
																		價格：<input type="text" value="${ad.price}"
																			class="form-control" id="pricechange${loop.index}"
																			name="price" disabled><br> 庫存：<input
																			type="text" value="${ad.stock}" class="form-control"
																			id="stockchange${loop.index}" name="stock" disabled><br>
																	</div>
																	<div class="col-12 text-center">
																		<button type="button" class="btn btn-info"
																			id="changeAdid" onclick="changeAd(${loop.index})">修改</button>
																		<input type="submit" class="btn btn-primary"
																			value="送出">
																	</div>
																</div>
															</form>
														</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
						</div>
						<div class="tab-pane fade p-4" id="nav-contact" role="tabpanel"
							aria-labelledby="nav-contact-tab">
							<h3>已賣出列表</h3>
							<div class="table-responsive" id="soldlist"></div>
						</div>
					</div>
				</div>
			</div>


			<!-- container -->
		</div>
	</div>
	<script type="text/javascript">
function changeAd(index){
	$('#widthchange'+index).removeAttr("disabled");
	$('#heightchange'+index).removeAttr("disabled");
	$('#pricechange'+index).removeAttr("disabled");
	$('#stockchange'+index).removeAttr("disabled");
}

function display(responseData){
	  var content = "<table class='table table-striped'><thead><tr><th>序號</th>";
	      content +=  "<th class='text-center'>項目PK值</th><th class='text-center'>廣告編號</th>";
	      content +=  "<th class='text-center'>所販賣之日期</th><th class='text-center'>賣出價格</th>";
	      content +=  "<th class='text-center'>售出日期</th><th class='text-center'>買家帳號</th>";
		  content +=  "<th class='text-center'>狀態</th></tr></thead>";
		var ad = JSON.parse(responseData);		// 傳回一個陣列
		var bgColor = "";   // 每一項商品的背影 
		if(ad == ""){
			content += "<tr><td class='text-center' colspan='9'>您尚無賣出的項目</td></tr></table>"
		}else{
			for(var i=0; i < ad.length; i++){		
				bgColor = (i % 2 == 0 ? "#d4f5b2" : "#b2f5e5");
				content += "<tr height='80' bgcolor='" + bgColor + "'>" + 
							"<td class='text-center'>" + (i+1) + "&nbsp;</td>" + 
				           	"<td class='text-center'>" + ad[i].itemPk + "&nbsp;</td>" + 
			               	"<td class='text-center'>" + ad[i].adNo + "</td>" +
			               	"<td class='text-center'>" + ad[i].adDate + "</td>" +
			               	"<td class='text-right'>" + "NT$ " + ad[i].unitPrice + "</td>" +
			               	"<td class='text-center'>" + ad[i].soldDate + "</td>" + 
			               	"<td class='text-center'>" + ad[i].buyerMemberId + "</td>"
			    
			   if(ad[i].adImageName == null){
					content += "<td class='text-center'>購買會員尚未上傳圖片</td></tr>" 
				}else{
					content += "<td class='text-center'>"+
								"<a class='btn btn-primary' href='<c:url value='/downloadPicture/' />"+ad[i].itemPk+"'>下載圖片</a></td></tr>" 
				}			           
			}
		}
		content += "</table>";
		document.getElementById("soldlist").innerHTML = content;
		console.log(responseData);
		
// 		var selltotal = 0;
// 		for (var i in ad){
// 			selltotal += ad[i].unitPrice;
// 		}
// 		console.log("selltotal:"+selltotal);
}

function memberSoldList(memberId){

	var queryString = "?memberId="+memberId;
	console.log(queryString);
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/getCpMemeberSoldListByAjax.json' />" + queryString , true);
	xhr.send();
	
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var responseData = xhr.responseText;
			display(responseData);
		}
	}
}



function getCpMemCount(){
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/getEachCateCountByCpMem.map' />", true);
	xhr.send();
	
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var responseData = xhr.responseText;
			console.log("=======OKOK========");
			console.log("responseData :"+responseData);
			
			
			var count = JSON.parse(responseData);
// 			for (var key in count) {
// 			       console.log("key:"+key);
// 			       console.log("count:"+count[key]);
// 			}
			var colA = count[100];
			var colB = count[200];
			var colC = count[300];
			var colD = count[400];
			var colE = count[500];
			
			console.log("all var:"+colA+","+colB+","+colC+","+colD+","+colE);
			
			var element = document.getElementById("exampleCard");
			element.classList.add("card");
			
			  if ($("#example").length) {
			      var SalesChartCanvas = $("#example").get(0).getContext("2d");
			      var SalesChart = new Chart(SalesChartCanvas, {
			        type: 'bar',
			        data: {
			          labels: ["A 頭版頁首", "B 頭版側標", "C 內頁頁首", "D 內頁側標", "E 內文小廣告"],
			          datasets: [{
			              label: '上傳則數',
			              data: [colA,colB,colC,colD,colE],
			              backgroundColor: '#FF5733'
//			             },
//			             {
//			               label: '賣出則數',
//			               data: [0, 0, 550],
//			               backgroundColor: '#316FFF'
			            }
			          ]
			        },
			        options: {
			          responsive: true,
			          maintainAspectRatio: true,
			          title:{
			        	  display:true,
			        	  text:"會員各類型上傳則數",
			        	  fontSize:15
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

function getCpMemPrice(){
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/getEachCatePriceByCpMem.map' />", true);
	xhr.send();
	
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var responseData = xhr.responseText;
			console.log("=======OKOK========");
			console.log("Price responseData :"+responseData);
			
			
			var count = JSON.parse(responseData);
			var colA = count[100];
			var colB = count[200];
			var colC = count[300];
			var colD = count[400];
			var colE = count[500];
			
			console.log("all var:"+colA+","+colB+","+colC+","+colD+","+colE);

			var element = document.getElementById("exampleCard2");
			element.classList.add("card");
			
			
	        if ($("#piecontainer").length) {
			      var SalesChartCanvas = $("#piecontainer").get(0).getContext("2d");
			      var SalesChart = new Chart(SalesChartCanvas, {
			        type: 'bar',
			        data: {
			          labels: ["A 頭版頁首", "B 頭版側標", "C 內頁頁首", "D 內頁側標", "E 內文小廣告"],
			          datasets: [{
			              label: '金額',
			              data: [colA,colB,colC,colD,colE],
			              backgroundColor: '#0AA633'
			            }
			          ]
			        },
			        options: {
			          responsive: true,
			          maintainAspectRatio: true,
			          title:{
			        	  display:true,
			        	  text:"會員各類型賣出金額",
			        	  fontSize:15
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
			                max: 20000
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