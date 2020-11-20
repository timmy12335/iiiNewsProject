<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>客服報表</title>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/echarts-gl/dist/echarts-gl.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/echarts-stat/dist/ecStat.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/dataTool.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/echarts/map/js/china.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/echarts/map/js/world.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/bmap.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		//圓餅圖
		var xhr2 = new XMLHttpRequest();
		xhr2.open("GET", "<c:url value='/calCR'/>", true);
		xhr2.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
		xhr2.send();
		xhr2.onreadystatechange = function() {
			if (xhr2.readyState == 4
					&& (xhr2.status == 200 || xhr2.status == 204)) {
				var map = JSON.parse(xhr2.responseText);
				console.log(map);
				var data = [];
				var cate = [];
				var value = [];
				data.push(map);
				console.log(data);
				for ( var k in map) {
					cate.push(k);
					value.push(map[k]);
				}
				console.log(cate)
				console.log(value)
				getPiePic(cate, value)
			}
		}

		//柱狀圖
		var xhr1 = new XMLHttpRequest();
		xhr1.open("GET", "<c:url value='/calCRfromEmp'/>", true);
		xhr1.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
		xhr1.send();
		xhr1.onreadystatechange = function() {
			if (xhr1.readyState == 4
					&& (xhr1.status == 200 || xhr1.status == 204)) {
				var map = JSON.parse(xhr1.responseText);
				console.log(map);
				var data1 = [];
				var emp = [];
				var report = [];
				console.log(data1);
				for ( var k in map) {
					emp.push(k);
					report.push(map[k]);
				}
				console.log(emp);
				console.log(report);
				getLinePic(emp, report);
			}
		}

	}

	//圓餅圖 
	function getPiePic(cate, value) {

		var arr = []
		for (let i = 0; i < cate.length; i++) {
			arr.push({
				value : value[i],
				name : cate[i]
			})
		}
		var dom = document.getElementById("container");
		var myChart = echarts.init(dom);
		var app = {};
		option = null;
		option = {
			title : {
				text : '客服表單統計',
				subtext : '類別統計',
				left : 'center'
			},
			tooltip : {
				trigger : 'item',
				formatter : '{a} <br/>{b} : {c} ({d}%)'
			},
			legend : {
				orient : 'vertical',
				left : 'left',
				data : cate
			},
			series : [ {
				name : '客服類別',
				type : 'pie',
				radius : '50%',
				center : [ '50%', '50%' ],
				data : arr,
				emphasis : {
					itemStyle : {
						shadowBlur : 10,
						shadowOffsetX : 0,
						shadowColor : 'rgba(0, 0, 0, 0.5)'
					}
				}
			} ]
		};
		;
		if (option && typeof option === "object") {
			myChart.setOption(option, true);
		}
	}

	//柱狀圖
	function getLinePic(emp, report) {
		var arr = []
		for (let i = 0; i < emp.length; i++) {
			arr.push({
				value : report[i],
				name : emp[i]
			})
		}
		var dom = document.getElementById("selectLine");
		var myChart = echarts.init(dom);
		var app = {};
		option = null;

		option = {
			title : {
				text : '人員客服統計',
				subtext : '未處理客服單統計',
				left : 'center'
			},
			color : [ '#3398DB' ],
			tooltip : {
				trigger : 'axis',
			//         axisPointer: {            // 坐标轴指示器，坐标轴触发有效
			//             type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
			//         }
			},
			grid : {
				left : '3%',
				right : '4%',
				bottom : '3%',
				containLabel : true
			},
			xAxis : [ {
				type : 'category',
				data : emp,
				axisTick : {
					alignWithLabel : true
				}
			} ],
			yAxis : [ {
				type : 'value'
			} ],
			series : [ {
				name : '尚未處理客服單數',
				type : 'bar',
				center : [ '50%', '50%' ],
				barWidth : '40%',
				data : report
			} ]
		};
		;
		if (option && typeof option === "object") {
			myChart.setOption(option, true);
		}
	}
</script>
</head>
<body>
	<jsp:include page="/fragment/BMnav.jsp"></jsp:include>

	<h3>各項客服報表</h3>
	<div style='margin-top: 20px; margin-bottom: 20px;'>
		<a href=<c:url value='/addemployee'/>><button
				class='btn btn-primary btn-icon-text' id='add'>客服單總計</button></a> <a
			href=<c:url value='/addemployee'/>><button
				class='btn btn-primary btn-icon-text' id='add'>未處理客服單</button></a> <a
			href=<c:url value='/addemployee'/>><button
				class='btn btn-primary btn-icon-text' id='add'>處理完客服單</button></a>
	</div>
	<div class="row">

		<div class='col-md-6 grid-margin stretch-card'>

			<div class="card">
				<div class='card-body' style='background: #F0F0F0'>
					<div id="container" style="width: 700px; height: 300px"></div>
				</div>
			</div>
		</div>
		<div class='col-md-6 grid-margin stretch-card'>
			<div class="card">
				<div class='card-body' style='background: #F0F0F0; align: center;'>
					<div id="selectLine"
						style="width: 400px; height: 300px; left: 40px;"></div>
					<!-- <div id="selectLinewithre" style="width:300px; height:300px;"></div> -->
				</div>
			</div>

		</div>
	</div>
	<div class="row">

		<div class='col-md-6 grid-margin stretch-card'>

			<div class="card">
				<div class='card-body' style='background: #F0F0F0'>
					<canvas id="myChartDateemp"></canvas>
				</div>
			</div>
		</div>
		<div class='col-md-6 grid-margin stretch-card'>
			<div class="card">
				<div class='card-body' style='background: #F0F0F0; align: center;'>
					<canvas id="myChartDateReport"></canvas>
					<!-- <div id="selectLinewithre" style="width:300px; height:300px;"></div> -->
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="/fragment/BMfoot.jsp"></jsp:include>
</body>
</html>