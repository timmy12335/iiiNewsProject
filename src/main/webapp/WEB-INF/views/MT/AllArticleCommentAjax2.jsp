<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>使用者文章總覽Ajax</title>
<meta charset="UTF-8">
<style>
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 90%;
}

#customers td {
  border: 1px solid #ddd;
  padding: 8px;
}
#customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:hover {background-color: #FFF3EE;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #FF8F59;
  color: white;
}

td {
/* 	padding: 3px; */
	 text-align:center; 
/* 	 valign:middle;' */
}

.td1 {
	width: 150px;
	word-break: break-all;
	margin: 5px;
	font-weight: "bold";
}
/* .table_tit{ */
/* 	white-space: nowrap;   */
/* 	overflow: hidden;   */
/* 	text-overflow: ellipsis; */
/* } */
</style>
<script>

window.onload=function(){

	var pageNoCom = 0;
	var totalPageCom  = 0;
	//本網頁一開始時先向後端發出非同步請求：/ch04/_07/pagingBookData.json，要求第一頁 
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/allArtCom.json' />", true);
	xhr.send();
	//***本網頁一開始時先向後端發出非同步請求：/ch04/_07/pagingBookData.json，要求第一頁 
	var xhr2 = new XMLHttpRequest();
	xhr2.open("GET", "<c:url value='/allArtComNo' />", true);
	xhr2.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr2.readyState == 4) {
			if (xhr.status == 200 && xhr2.status == 200){
				var responseData = xhr.responseText + "&&&" + xhr2.responseText;

				console.log(responseData);
				displayPageBooks(responseData);   // 顯示讀取到的非文字性資料
			} else {
				alert(xhr.status);
			}
		}
	}
	
	// 當使用者按下『第一頁』、『前一頁』、『下一頁』、『最末頁』的連結時，由本方法發出非同步請求。
	function asynRequest(id) {
		var xhr = new XMLHttpRequest();
		var no = 0;
	    var queryString = "";     		// queryString紀錄查詢字串
		    if (id == "first") {		// 算出查詢字串中，要送出的pageNoCom為何?
		    	no = 1;
		    } else if (id == "prev") {
		    	no = pageNoCom - 1;
		    } else if (id == "next") {
		    	no = pageNoCom + 1;
		    } else if (id == "last") {
		    	no = totalPageCom;	    	
		    }
		 // 查詢字串包含1.即將要讀取的頁數(pageNoCom), 2.總共有幾頁(totalPageCom)
		    // 注意，查詢字串的前面有問號
		    queryString = "?pageNoCom=" + no + "&totalPageCom=" + 	totalPageCom;
			console.log(queryString);
			xhr.open("GET", "<c:url value='/allArtCom.json' />" + queryString , true);
			xhr.send();
			
			var xhr2 = new XMLHttpRequest();
			xhr2.open("GET", "<c:url value='/allArtComNo' />"+ queryString, true);
			xhr2.send();
			
			xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200 && xhr2.readyState == 4 && xhr2.status == 200) {
				var responseData = xhr.responseText + "&&&" + xhr2.responseText;
				displayPageBooks(responseData);
			}
		}
	}


function displayPageBooks(responseData){
	  var content = "<table id='customers'><tr>";
      		content +=  "<th>類型</th><th>標題</th>";
      		content +=  "<th>發文者</th><th>上傳日期</th><th>圖片</th><th>內文</th></tr>";	    
		var data = responseData.split("&&&");
		var news = JSON.parse(data[0]);		// 傳回一個陣列
		var mapData = JSON.parse(data[1]);		// 傳回一個JavaScript物件
		var bgColor = "";   // 每一項商品的背影 
		 
		for(var i=0; i < news.length; i++){
			content += "<tr height='80'>" + 
		               "<td class='td1'>" + news[i].category + "</td>" +
		               "<td class='td1'><a href='<c:url value='/CreateComment/" + news[i].articleId + "'/>' >" +
		               "<c:if test='" + news[i].status + "== 0}' ><a href='' ></a></c:if>" + news[i].title + "</a></td>" +
		               "<td class='td1'>" + news[i].memberId + "</td>" +
		               "<td class='td1'>" + news[i].updateDate + "</td>" + 
		               "<td class='td1'><div id='Demo' class='demo'><img style='width:160px;height:90px' src='<c:url value='/getMtCreate/" + 
		                news[i].articleId + "' />' /></div></td>" + 
		               "<td class='td1'>" + news[i].article + "</td>"
//		               "<td><img  width='200' height='150' " +   
//		               " src='../../ch00/util/GetImage?no=" + news[i].newsId + "'></td>" + 
			           "</tr>";  
			           
		}
		content += "</table>";
		document.getElementById("somedivS").innerHTML = content;
		pageNoCom = mapData.currPage;
		totalPageCom  = mapData.totalPageCom;
		
		var navContent = "<table border='1' ><tr height='36'>" ;
		if (pageNoCom != 1){
			navContent += "<td width='80' align='center'><button id='first'>第一頁</button></td>";
			navContent += "<td width='80' align='center'><button id='prev'>前一頁</button></td>";
		}  else {
			navContent += "<td width='80' align='center'>&nbsp;</td>";
			navContent += "<td width='80' align='center'>&nbsp;</td>";
		}
		navContent += "<td width='200' align='center'>第" + pageNoCom + "頁 / 共" + totalPageCom + "頁</td>";
		if (pageNoCom != totalPageCom){
			navContent += "<td width='80' align='center'><button id='next'>下一頁</button></td>";
			navContent += "<td width='80' align='center'><button id='last'>最末頁</button></td>";
		}  else {
			navContent += "<td width='80' align='center'>&nbsp;</td>";
			navContent += "<td width='80' align='center'>&nbsp;</td>";
		}
		navContent += "</table>";
		document.getElementById("navigation").innerHTML = navContent;
		var firstBtn = document.getElementById("first");
		var prevBtn  = document.getElementById("prev");
		var nextBtn  = document.getElementById("next");
		var lastBtn  = document.getElementById("last");
		if (firstBtn != null) {
			firstBtn.onclick=function(){
				asynRequest(this.id);
			}
		}
		
		if (prevBtn != null) {
			prevBtn.onclick=function(){
				asynRequest(this.id);
			}
		}
		
		if (nextBtn != null) {
			nextBtn.onclick=function(){
				asynRequest(this.id);
			}
		}
		
		if (lastBtn != null) {
			lastBtn.onclick=function(){
				asynRequest(this.id);				
			}
		}	
	}



}


</script>

</head>
<body>
<nav>
<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
</nav>

<div align='center' style="margin-top: 150px;">
	<h3>分頁顯示文章(JSON)</h3>
	<hr>
	<div id='somedivS' ></div>
	<div id='navigation' ></div>
	<hr>
	<input type="button" onclick="history.back()" value="回前頁" />
	<a href="<c:url value="" />">回前頁</a>
</div>
	
	<jsp:include page="/fragment/BMfoot.jsp"></jsp:include>
</body>
</html>