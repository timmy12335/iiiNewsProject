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
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>iiiNews Admin</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" />
  <script>
  
  
  
  
  </script>
  
  
  
</head>
<body>
<jsp:include page="/fragment/BMnav.jsp"></jsp:include>

<%-- <canvas id="sales-chart" width="675" height="337" class="chartjs-render-monitor" style="display: block; height: 270px; width: 540px;"></canvas> --%>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['廣告購買區', 80],
          ['新聞購買區', 70],
          ['影片觀看區', 100],
          ['新聞追蹤區', 80],
          ['客服專區', 20]
        ]);

        // Set chart options
        var options = {'title':'主要參觀區域人數比例',
                       'width':1000,
                       'height':800};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
      
      
      google.charts.load('current', {packages: ['corechart', 'bar']});
      google.charts.setOnLoadCallback(drawBasic);

      function drawBasic() {

            var data = new google.visualization.DataTable();
            data.addColumn('date', '日期');
            data.addColumn('number', '客服單');
            var dateTime = new Date();
            dateTime=dateTime.setDate(dateTime.getDate()-1);
            dateTime=new Date(dateTime);
            var dateTime2 = new Date();
            dateTime2=dateTime2.setDate(dateTime2.getDate()-2);
            dateTime2=new Date(dateTime2);
            var dateTime3 = new Date();
            dateTime3=dateTime3.setDate(dateTime3.getDate()-2);
            dateTime3=new Date(dateTime3);
            var dateTime4 = new Date();
            dateTime4=dateTime4.setDate(dateTime4.getDate()-2);
            dateTime4=new Date(dateTime4);
            data.addRows([
              [new Date(), 1],
              [dateTime, 20],
              [dateTime2, 3],
              [dateTime3, 5],
              [dateTime4, 6]
//               [new Date(), 1],
//               [new Date(), 1],
//               [new Date(), 200],
//               [new Date(), 1]
//               [{v: [9, 0, 0], f: '9 am'}, 2],
//               [{v: [10, 0, 0], f:'10 am'}, 3],
//               [{v: [11, 0, 0], f: '11 am'}, 4],
//               [{v: [12, 0, 0], f: '12 pm'}, 5],
//               [{v: [13, 0, 0], f: '1 pm'}, 6],
//               [{v: [14, 0, 0], f: '2 pm'}, 7],
//               [{v: [15, 0, 0], f: '3 pm'}, 8],
//               [{v: [16, 0, 0], f: '4 pm'}, 9],
//               [{v: [17, 0, 0], f: '5 pm'}, 10],
            ]);

            var options = {
              title: '各日期客服統計',
              hAxis: {
                title: '日期',
                format: 'YYYY-MM-dd',
//                 viewWindow: {
//                   min: [2020-01-01, 0],
//                   max: [2020-12-31, 1]
                }
              ,
              vAxis: {
                title: '客服數量'
              }
            };

            var chart = new google.visualization.ColumnChart(
              document.getElementById('chart_div2'));

            chart.draw(data, options);
          }
    </script>

  </head>

  <body>
    <!--Div that will hold the pie chart-->
    <div id="chart_div" width="400" height="400"></div>
     <div id="chart_div2" width="400" height="400"></div>
<hr>


<div class='card-body'>



<div id="container" style="height:700px;"></div>



</div>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-gl/dist/echarts-gl.min.js"></script>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-stat/dist/ecStat.min.js"></script>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/dataTool.min.js"></script>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/china.js"></script>
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/world.js"></script>
     
       <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/bmap.min.js"></script>
       <script type="text/javascript">
       
       
       
window.onload=function(){
	
		var xhr2 = new XMLHttpRequest();
		xhr2.open("GET","<c:url value='/calCR'/>",true);
		xhr2.setRequestHeader("Content-Type","application/json;charset=UTF-8");
		xhr2.send();
		xhr2.onreadystatechange=function(){
		if (xhr2.readyState == 4 && (xhr2.status == 200 || xhr2.status == 204) ) { 
		var map = JSON.parse(xhr2.responseText);
	      console.log(map);
	      var data=[];
	      var cate=[]; 
	      var value=[];
	 		data.push(map); 
		 console.log(data);
	      
		
		for(var k in map){
			cate.push(k);
			value.push(map[k]);
		}
		console.log(cate)
		console.log(value)
	      getPiePic(cate,value)
	}	
		}
}

      

       
       
       
       
       
       
       
       
function getPiePic(cate,value){       
	
var arr = []
for(let i = 0;i <cate.length ;i++){
	arr.push( {value:value[i] , name: cate[i]})
}
var dom = document.getElementById("container");
var myChart = echarts.init(dom);
var app = {};
option = null;
option = {
    title: {
        text: '客服來源',
        subtext: '纯属虚构',
        left: 'center'
    },
    tooltip: {
        trigger: 'item',
        formatter: '{a} <br/>{b} : {c} ({d}%)'
    },
    legend: {
        orient: 'vertical',
        left: 'left',
        data: cate
    },
    series: [
        {
            name: '客服類別',
            type: 'pie',
            radius: '55%',
            center: ['50%', '60%'],
            data: 
               arr
            ,
            emphasis: {
                itemStyle: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }
    ]
};
;
if (option && typeof option === "object") {
    myChart.setOption(option, true);
}
}
       </script>
















<jsp:include page="/fragment/BMfoot.jsp"></jsp:include>
</body>
</html>

