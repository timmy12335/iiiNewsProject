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

	var pageNo = 0;
	var totalPage  = 0;
	//本網頁一開始時先向後端發出非同步請求：/ch04/_07/pagingBookData.json，要求第一頁 
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/pagingNewsData.json' />", true);
	xhr.send();
	//***本網頁一開始時先向後端發出非同步請求：/ch04/_07/pagingBookData.json，要求第一頁 
	var xhr2 = new XMLHttpRequest();
	xhr2.open("GET", "<c:url value='/pagingNewsNo' />", true);
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
		    queryString = "?pageNo=" + no + "&totalPage=" + 	totalPage;
			console.log(queryString);
			xhr.open("GET", "<c:url value='/pagingNewsData.json' />" + queryString , true);
			xhr.send();
			
			var xhr2 = new XMLHttpRequest();
			xhr2.open("GET", "<c:url value='/pagingNewsNo' />"+ queryString, true);
			xhr2.send();
			
			xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200 && xhr2.readyState == 4 && xhr2.status == 200) {
				var responseData = xhr.responseText + "&&&" + xhr2.responseText;
				displayPageBooks(responseData);
			}
		}
	}
	//取得現在的時間，放入GetDateDiff()去計算時間
	function timeNow() {
		let time = new Date();
		let Y = time.getFullYear();
		let M = time.getMonth() + 1;
		let D = time.getDate();
		let H = time.getHours();
		let m = time.getMinutes();
		let s = time.getSeconds();
//		console.log(Y+"-"+M+"-"+D+" "+H+":"+m+":"+s);
		let twtime = Y+"-"+M+"-"+D+" "+H+":"+m+":"+s;
		return twtime;
	}	
	/* 
	 * 獲得時間差,時間格式為 年-月-日 小時:分鐘:秒 或者 年/月/日 小時：分鐘：秒 
	 * 其中，年月日為全格式，例如 ： 2010-10-12 01:00:00 
	 * 返回精度為：秒 
	 */
	function GetDateDiff(endTime) {
		//將xxxx-xx-xx的時間格式，轉換為 xxxx/xx/xx的格式 
		var startTime = timeNow().replace(/\-/g, "/");
		endTime = endTime.replace(/\-/g, "/");
		//將計算間隔類性字元轉換為小寫 
//		diffType = diffType.toLowerCase();
		var sTime = new Date(startTime); //開始時間 
		var eTime = new Date(endTime); //結束時間 
		//作為除數的數字 
		var divsec = 1000;
		let sec = parseInt((eTime.getTime() - sTime.getTime()) / parseInt(divsec));
		return sec;
	}

	



function displayPageBooks(responseData){
	  var content = "<table border='1'><tr height='42' bgcolor='#fbdb98'>";
	      content +=  " <th width='600' align='center'>新聞標題</th><th width='100' align='center'>新聞編號</th><th width='60' align='center'>上傳時間</th>";
	      content +=  "<th width='100' align='center'>新聞類型</th><th width='100' align='center'>發生地點</th><th width='600' align='center'>新聞大綱</th>";	    
		  content +=  "<th width='600' align='center'>剩餘時間</th></tr>";
		var data = responseData.split("&&&");
		var news = JSON.parse(data[0]);		// 傳回一個陣列
		var mapData = JSON.parse(data[1]);		// 傳回一個JavaScript物件
		var bgColor = "";   // 每一項商品的背影 
		 
		for(var i=0; i < news.length; i++){
			bgColor = (i % 2 == 0 ? "#d4f5b2" : "#b2f5e5");
			content += "<tr height='80' bgcolor='" + bgColor + "'>" + 
			           "<td  align='center' >" + news[i].title + "&nbsp;</td>" + 
		               "<td>" + news[i].newsId + "</td>" +
		               "<td align='center'>" + news[i].uploadTime + "</td>" +
		               "<td align='right'>" + news[i].newsType + "&nbsp;</td>" +
		               "<td align='center'>" + news[i].location + "</td>" +
		               "<td align='right'>" + news[i].outline + "</td>" + 
		               "<td align='center' id=lastime> </td>" +
//		               "<td><img  width='200' height='150' " +   
//		               " src='../../ch00/util/GetImage?no=" + news[i].newsId + "'></td>" + 
			           "</tr>";  
			           var timmy = news[i].futureTime
			           console.log(timmy)
			         //將秒轉回時:分:秒
			           function clock() {
			           	let sec01,day,hr,hr01,min,sec;
			           	sec01 = GetDateDiff(timmy);
			           	console.log(sec01);
			           	sec = sec01 % 60 <10 ? '0'+sec01 % 60 :sec01 % 60 ;		
			           	min = (sec01-sec)/60 % 60 <10 ? '0'+(sec01-sec)/60 % 60 :(sec01-sec)/60 % 60;	
			           	hr01 =(((sec01-sec) /60) - min) / 60 ;
			           	hr = hr01 <10 ?'0'+ hr01 :hr01 ;
// 			           	console.log(hr);
// 			           	console.log(min);
// 			           	console.log(sec);
			           	let time = hr+"小時"+min+"分"+sec+"秒";
			           	document.getElementById("lastime").innerHTML = time;

			           }
			         //每一秒重新整理
			           setInterval(clock,1000);
			           
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
		<h3>分頁顯示新聞(JSON)</h3>
		<hr>
		<div id='somedivS' style='height: 260px;'></div>
		<div id='navigation' style='height: 60px; margin: 250px;'></div>
		<hr>
		<a href='..'>回前頁</a>
	</div>

</body>
</html>