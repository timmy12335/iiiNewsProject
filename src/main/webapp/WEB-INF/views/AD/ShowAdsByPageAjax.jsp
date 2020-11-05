<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>分頁廣告列表</title>
<script>
window.onload=function(){

	var pageNo = 0;
	var totalPage  = 0;
	//本網頁一開始時先向後端發出非同步請求：/ch04/_07/pagingBookData.json，要求第一頁 
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/pagingAdsData.json' />", true);
	xhr.send();
	
	var xhr2 = new XMLHttpRequest();
	xhr2.open("GET", "<c:url value='/pagingAdsNo' />", true);
	xhr2.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr2.readyState == 4) {
			if (xhr.status == 200 && xhr2.status == 200){
				var responseData = xhr.responseText + "&&&" + xhr2.responseText;

				console.log(responseData);
				displayPageAds(responseData);   // 顯示讀取到的非文字性資料
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
		    if (id == "first") {		// 算出查詢字串中，要送出的pageNo為何?
		    	no = 1;
		    } else if (id == "prev") {
		    	no = pageNo - 1;
		    } else if (id == "next") {
		    	no = pageNo + 1;
		    } else if (id == "last") {
		    	no = totalPage;	    	
		    }
		 // 查詢字串包含1.即將要讀取的頁數(pageNo), 2.總共有幾頁(totalPage)
		    // 注意，查詢字串的前面有問號
		    queryString = "?pageNo=" + no + "&totalPage=" + totalPage;
			console.log(queryString);
			xhr.open("GET", "<c:url value='/pagingAdsData.json' />" + queryString , true);
			xhr.send();
			
			var xhr2 = new XMLHttpRequest();
			xhr2.open("GET", "<c:url value='/pagingAdsNo' />"+ queryString, true);
			xhr2.send();
			
			xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200 && xhr2.readyState == 4 && xhr2.status == 200) {
				var responseData = xhr.responseText + "&&&" + xhr2.responseText;
				displayPageAds(responseData);
			}
		}
	}


function displayPageAds(responseData){
	  var content = "<table border='1'><tr height='42' bgcolor='#fbdb98'><th width='10' align='center'>序號</th>";
	      content +=  "<th width='600' align='center'>廣告PK值</th><th width='100' align='center'>廣告編號</th><th width='60' align='center'>上傳時間</th>";
	      content +=  "<th width='100' align='center'>類型</th><th width='100' align='center'>販賣日期</th><th width='600' align='center'>單價</th>";	    
		  content +=  "<th width='600' align='center'>texting</th></tr>";
		var data = responseData.split("&&&");
		var ad = JSON.parse(data[0]);		// 傳回一個陣列
		var mapData = JSON.parse(data[1]);		// 傳回一個JavaScript物件
		var bgColor = "";   // 每一項商品的背影 
		 
		for(var i=0; i < ad.length; i++){
			bgColor = (i % 2 == 0 ? "#d4f5b2" : "#b2f5e5");
			content += "<tr height='80' bgcolor='" + bgColor + "'>" + 
						"<td  align='center' >" + (i+1) + "&nbsp;</td>" + 
			           "<td  align='center' >" + ad[i].adPk + "&nbsp;</td>" + 
		               "<td>" + ad[i].adNo + "</td>" +
		               "<td align='center'>" + ad[i].uploadDate + "</td>" +
		               "<td align='right'>" + ad[i].categoryNo + "&nbsp;</td>" +
		               "<td align='center'>" + ad[i].adDate + "</td>" +
		               "<td align='right'>" + ad[i].price + "</td>" + 
		               "<td align='center'>hello</td>" +
//		               "<td><img  width='200' height='150' " +   
//		               " src='../../ch00/util/GetImage?no=" + news[i].newsId + "'></td>" + 
			           "</tr>";  			           
		}
		content += "</table>";
		document.getElementById("somedivS").innerHTML = content;
		pageNo = mapData.currPage;
		totalPage  = mapData.totalPage;
		
		var navContent = "<table border='1' ><tr height='36' bgcolor='#fbdb98'>" ;
		if (pageNo != 1){
			navContent += "<td width='80' align='center'><button id='first'>第一頁</button></td>";
			navContent += "<td width='80' align='center'><button id='prev'>前一頁</button></td>";
		}  else {
			navContent += "<td width='80' align='center'>&nbsp;</td>";
			navContent += "<td width='80' align='center'>&nbsp;</td>";
		}
		navContent += "<td width='200' align='center'>第" + pageNo + "頁 / 共" + totalPage + "頁</td>";
		if (pageNo != totalPage){
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
		<h3>分頁顯示(JSON)</h3>
		<hr>
		<div id='somedivS' style='height: 260px;'></div>
		<div id='navigation' style='height: 60px; margin: 250px;'></div>
		<hr>
		<a href='..'>回前頁</a>
	</div>

</body>
</html>