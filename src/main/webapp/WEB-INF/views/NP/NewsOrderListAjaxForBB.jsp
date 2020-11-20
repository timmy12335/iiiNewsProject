<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>分頁新聞列表</title>
<style>
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 90%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:hover {background-color: #ffffff;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #0066CC;
  color: white;
}

td {
	padding: 3px;
	 text-align:center; 
	 valign:middle;'
}

.td1 {
	width: 150px;
	word-break: break-all;
	margin: 5px;
	font-weight: "bold";
}
</style>
<script>
window.onload=function(){

	//本網頁一開始時先向後端發出非同步請求：/ch04/_07/pagingBookData.json，要求第一頁 
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/getOrderByAjaxForBB.json' />", true);
	xhr.send();
	//***本網頁一開始時先向後端發出非同步請求：/ch04/_07/pagingBookData.json，要求第一頁 
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 ) {
			if (xhr.status == 200){
				var responseData = xhr.responseText;

// 				console.log(responseData);
				displayNewsOrderList(responseData);   // 顯示讀取到的非文字性資料
			} else {
				alert(xhr.status);
			}
		}
	}		   


function displayNewsOrderList(responseData){
	  var content = "<div align='center' class='table-responsive pt-3'><table id='customers'><tr align='center' height='42' bgcolor='#99ffcc' border='1'>";
	      content +=  " <th width='100'>訂單編號</th><th width='100'>企業編號</th><th width='100'>會員編號</th>";
	      content +=  "<th width='350'>新聞標題</th><th width='100'>購買時間</th>";
	      content +=  "<th width='100'>新聞編號</th><th width='100' >購買價錢</th>";	    
		  
		
		var newsOrderList = JSON.parse(responseData);		// 傳回一個陣列
		
			
		var bgColor = "";   // 每一項商品的背影 
		 
		for(var i=0; i < newsOrderList.length; i++){
			bgColor = "#ECF5FF";
			content += "<tr align='center' height='80' bgcolor='" + bgColor + "'>" + 
			           "<td> " + newsOrderList[i].orderId + "&nbsp;</td>" + 
			           "<td>" + newsOrderList[i].companyId + "&nbsp;</td>" +
			           "<td>" + newsOrderList[i].memberId + "&nbsp;</td>" +
		               "<td>" + newsOrderList[i].newsBean.title + "</td>" +
		               "<td>" + newsOrderList[i].soldTime + "</td>" +
		               "<td>" + newsOrderList[i].newsId + "</td>" +
		               "<td>" + newsOrderList[i].orderPrice + "&nbsp;</td>" +	      		               
			           "</tr>";  			           
		}
		content += "</div></table>";
		document.getElementById("somedivS").innerHTML = content;
		
	}
}
</script>
</head>
<body>
<jsp:include page="/fragment/BMnav.jsp"></jsp:include> 
<div class="card-body">
	
	<div align='center' >
		<h3>後台顯示訂單列表(JSON)</h3>
		<hr>
		<div id='somedivS'></div>
<!-- 		<div id='navigation' style='height: 60px; margin: 250px;'></div> -->
		
		
	</div>
</div>
<jsp:include page="/fragment/BMfoot.jsp"></jsp:include> 
</body>
</html>