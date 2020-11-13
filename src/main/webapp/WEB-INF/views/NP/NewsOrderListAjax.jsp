<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>分頁新聞列表</title>
<script>
window.onload=function(){

	//本網頁一開始時先向後端發出非同步請求：/ch04/_07/pagingBookData.json，要求第一頁 
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/getOrderByAjax.json' />", true);
	xhr.send();
	//***本網頁一開始時先向後端發出非同步請求：/ch04/_07/pagingBookData.json，要求第一頁 
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 ) {
			if (xhr.status == 200){
				var responseData = xhr.responseText;

				console.log(responseData);
				displayNewsOrderList(responseData);   // 顯示讀取到的非文字性資料
			} else {
				alert(xhr.status);
			}
		}
	}		   


function displayNewsOrderList(responseData){
	  var content = "<table border='1'><tr height='42' bgcolor='#fbdb98'>";
	      content +=  " <th width='100' align='center'>訂單編號</th><th width='200' align='center'>新聞標題</th><th width='100' align='center'>購買時間</th>";
	      content +=  "<th width='100' align='center'>新聞編號</th><th width='100' align='center'>購買價錢</th><th width='100' align='center'>詳細內容</th>";	    
		  
		
		var newsOrderList = JSON.parse(responseData);		// 傳回一個陣列
			
		var bgColor = "";   // 每一項商品的背影 
		 
		for(var i=0; i < newsOrderList.length; i++){
			bgColor = (i % 2 == 0 ? "#d4f5b2" : "#b2f5e5");
			content += "<tr height='80' bgcolor='" + bgColor + "'>" + 
			           "<td  align='center' >" + newsOrderList[i].orderId + "&nbsp;</td>" + 
		               "<td>" + newsOrderList[i].newsBean.title + "</td>" +
		               "<td>" + newsOrderList[i].soldTime + "</td>" +
		               "<td align='center'>" + newsOrderList[i].newsId + "</td>" +
		               "<td align='right'>" + newsOrderList[i].orderPrice + "&nbsp;</td>" +	 
		               "<td align='right'><a href=<c:url value='/getOrderedSingleNews/"+newsOrderList[i].newsId+"' /> >看單一新聞</a></td>"+
// 		               							  <c:url value='/getUpNewsPicture/${news.newsId}'/>
			           "</tr>";  			           
		}
		content += "</table><hr><a href=''>回前頁</a>";
		document.getElementById("somedivS").innerHTML = content;
		
	}
}
</script>
</head>
<body>
	<nav>
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<div align='center' style="margin-top: 150px;">
		<h3>顯示企業訂單列表(JSON)</h3>
		<hr>
		<div id='somedivS' style='height: 300px;'></div>
<!-- 		<div id='navigation' style='height: 60px; margin: 250px;'></div> -->
		
		
	</div>

</body>
</html>