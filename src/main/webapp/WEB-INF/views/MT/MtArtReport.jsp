<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>666666</title>
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
//     	var xhr0 = new XMLHttpRequest();
//     	xhr0.open("GET", "<c:url value='/getNewsCountForBB.json'/>", true);
//     	xhr0.send();
//     	xhr0.onreadystatechange = function() {
//     		if (xhr0.readyState == 4 ) {
//     			if (xhr0.status == 200){
//     				var responseData0 = xhr0.responseText;

//      				console.log(responseData0);
//      				newsTypeCount = JSON.parse(responseData0);
//  //    				Type(newsTypeCount);

//     			} else {
//     				alert(xhr0.status);
//     			}
//     		}
    		
//     	}
    	
    	
    }
    </script>
</head>

    <body >
    <jsp:include page="/fragment/BMnav.jsp"></jsp:include> 
		<div class="card-body">
        <div id="container" style="height:700px; -webkit-tap-highlight-color: transparent; user-select: none; position: relative;" _echarts_instance_="ec_1605769547048">
            <div style="position: relative; width: 1536px; height: 666px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;">
                <canvas data-zr-dom-id="zr_0" width="1920" height="832" style="position: absolute; left: 0px; top: 0px; width: 1536px; height: 666px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas>
            </div>
            <div>

            </div>
        </div>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-gl/dist/echarts-gl.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-stat/dist/ecStat.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/dataTool.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/china.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/world.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/bmap.min.js"></script>
 <script type="text/javascript">
 function Type(newsTypeNum,newsTypeCount) {
	let TypeA = newsTypeNum["未分類"];
	let TypeB = newsTypeNum["生活"];
	let TypeC = newsTypeNum["娛樂"];
	let TypeD = newsTypeNum["問卦"];
	let TypeE = newsTypeNum["美食"];
	let TypeF = newsTypeNum["運動"];
	let TypeG = newsTypeNum["趣味"];
	let TypeH = newsTypeNum["寵物"];
	console.log(TypeB);
	
	let CountA = newsTypeCount["未分類"];
	let CountB = newsTypeCount["生活"];
	let CountC = newsTypeCount["娛樂"];
	let CountD = newsTypeCount["問卦"];
	let CountE = newsTypeCount["美食"];
	let CountF = newsTypeCount["運動"];
	let CountG = newsTypeCount["趣味"];
	let CountH = newsTypeCount["寵物"];

 var dom = document.getElementById("container");
 var myChart = echarts.init(dom);
 var app = {};
 option = null;
 option = {
     tooltip: {
         trigger: 'item',
         formatter: '{a} <br/>{b}: {c} ({d}%)'
     },
     legend: {
         orient: 'vertical',
         left: 10,
         data: ['未分類', '生活', '娛樂', '問卦', '美食', '運動', '趣味', '寵物']
     },
     series: [
         {
             name: '筆數',
             type: 'pie',
             selectedMode: 'single',
             radius: [0, '30%'],
 
             label: {
                 position: 'inner'
             },
             labelLine: {
                 show: false
             },
             data: [
                 {value: TypeA, name: '未分類'},
                 {value: TypeB, name: '生活'},
                 {value: TypeC, name: '娛樂'},
                 {value: TypeD, name: '問卦'},
                 {value: TypeE, name: '美食'},
                 {value: TypeF, name: '運動'},
                 {value: TypeG, name: "趣味"},
                 {value: TypeH, name: "寵物"},
             ]
         },
         {
             name: '金額',
             type: 'pie',
             radius: ['40%', '55%'],
             label: {
                 formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
                 backgroundColor: '#eee',
                 borderColor: '#aaa',
                 borderWidth: 1,
                 borderRadius: 4,
                 // shadowBlur:3,
                 // shadowOffsetX: 2,
                 // shadowOffsetY: 2,
                 // shadowColor: '#999',
                 // padding: [0, 7],
                 rich: {
                     a: {
                         color: '#999',
                         lineHeight: 22,
                         align: 'center'
                     },
                     // abg: {
                     //     backgroundColor: '#333',
                     //     width: '100%',
                     //     align: 'right',
                     //     height: 22,
                     //     borderRadius: [4, 4, 0, 0]
                     // },
                     hr: {
                         borderColor: '#aaa',
                         width: '100%',
                         borderWidth: 0.5,
                         height: 0
                     },
                     b: {
                         fontSize: 16,
                         lineHeight: 33
                     },
                     per: {
                         color: '#eee',
                         backgroundColor: '#334455',
                         padding: [2, 4],
                         borderRadius: 2
                     }
                 }
             },
             data: [
                 {value: CountA, name: '未分類'},
                 {value: CountB, name: '生活'},
                 {value: CountC, name: '娛樂'},
                 {value: CountD, name: '問卦'},
                 {value: CountE, name: '美食'},
                 {value: CountF, name: '運動'},
                 {value: CountG, name: '趣味'},
                 {value: CountH, name: '寵物'},
              ]
         }
     ]
 };
 if (option && typeof option === "object") {
     myChart.setOption(option, true);
 }
 }
        </script>
    
</div>
<jsp:include page="/fragment/BMfoot.jsp"></jsp:include> 
</body>
</html>