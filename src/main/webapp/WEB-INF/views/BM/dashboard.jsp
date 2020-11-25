<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="tw">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>iiiNews Admin</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/base/vendor.bundle.base.css">
<!-- endinject -->
<!-- plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<!-- endinject -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/images/favicon.png" />
<script>
	
</script>



</head>
<body>
	<jsp:include page="/fragment/BMnav.jsp"></jsp:include>

	<!--Div that will hold the pie chart-->
	<div id="chart_div" width="400" height="400" align='center;'></div>
	<div id="chart_div2" width="400" height="400"></div>
	
	<div class="container">
		<div class="row">
<!-- 			<div class="col-5"> -->
<!-- 				<div class="card"> -->
<!-- 					<h4 class="p-3">iiiNews新聞後台系統</h4> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<div id="container" class="col-12"	style="height: 600px; -we後臺統計數據bkit-tap-highlight-color: transparent; user-select: none; position: relative;"
				_echarts_instance_="ec_1606114494911">
				<div style="position: relative; width: 1536px; height: 722px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;">
					<canvas data-zr-dom-id="zr_0" style="position: absolute; left: 0px; top: 0px; width: 1536px; height: 722px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-gl/dist/echarts-gl.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-stat/dist/ecStat.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/dataTool.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/bmap.min.js"></script>
	<script type="text/javascript">
		var dom = document.getElementById("container");
		var myChart = echarts.init(dom);
		var app = {};
		option = null;
		option = {
			title : {
				text : 'iiiNews後臺統計數據',
				left : 'center'
			},
			tooltip : {
				trigger : 'item',
				formatter : '{a} <br/>{b} : {c} ({d}%)'
			},
			legend : {
				orient : 'vertical',
				left : 'left',
				data : [ '廣告購買區', '新聞購買區', '社群討論區', '新聞追蹤區', '客服專區' ]
			},
			series : [ {
				name : '後臺統計數據',
				type : 'pie',
				radius : '55%',
				center : [ '50%', '60%' ],
				data : [ {	value : 95,	name : '廣告購買區'	}, 
						{	value : 160,name : '新聞購買區'	},
						{	value : 84,	name : '社群討論區'	},
						{	value : 75,	name : '新聞追蹤區'	}, 
						{	value : 48,	name : '客服專區'	} ],
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
	</script>
	<hr>
	<jsp:include page="/fragment/BMfoot.jsp"></jsp:include>
</body>
</html>

