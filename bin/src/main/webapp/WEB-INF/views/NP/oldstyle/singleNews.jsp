<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>單一新聞表</title>
<script>

	//取得現在的時間，放入GetDateDiff()去計算時間
	function timeNow() {
		let time = new Date();
		let Y = time.getFullYear();
		let M = time.getMonth() + 1;
		let D = time.getDate();
		let H = time.getHours();
		let m = time.getMinutes();
		let s = time.getSeconds();
		console.log(Y+"-"+M+"-"+D+" "+H+":"+m+":"+s);
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
	//將秒轉回時:分:秒
	function clock() {
		let sec01,day,hr,hr01,min,sec;
		sec01 = GetDateDiff("${ newsSingle.futureTime }");
		console.log(sec01);
		sec = sec01 % 60 <10 ? '0'+sec01 % 60 :sec01 % 60 ;		
		min = (sec01-sec)/60 % 60 <10 ? '0'+(sec01-sec)/60 % 60 :(sec01-sec)/60 % 60;	
		hr01 =(((sec01-sec) /60) - min) / 60 ;
		hr = hr01 <10 ?'0'+ hr01 :hr01 ;
		console.log(hr);
		console.log(min);
		console.log(sec);
		let time = hr+"小時"+min+"分"+sec+"秒";
		document.getElementById("lastime").innerHTML ="剩餘時間 :"+ time;

	}
	
	//每一秒重新整理
	setInterval(clock,1000);
</script>
</head>
<body>
	<nav>
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<div align="center" style="margin-top: 150px;">
		<h2>單一新聞表</h2>
	</div>
	<hr>
	<div align="left">

		<p>新聞編號： ${ newsSingle.newsId }</p>
		<p>上傳時間：${newsSingle.uploadTime}</p>
		<p>新聞標題: &nbsp;${ newsSingle.title }</p>
		<p>新聞類型: ${ newsSingle.newsType }</p>
		<p>發生日期: ${ newsSingle.happenDate }</p>
		<p>發生時間: ${ newsSingle.happenTime }</p>
		<p>發生地點: ${ newsSingle.location }</p>		
		<img width='300' height='200'
			src="<c:url value='/getUpNewsPicture/${ newsSingle.newsId }'/>">
		<p>新聞內文:</p>
		<p>${ newsSingle.article }</p>
		<p>價格: ${ newsSingle.price }</p>
		<p>販賣計時: ${ newsSingle.limitTime }</p>
		<p>到期時間: ${ newsSingle.futureTime }</p>
		<div id=lastime></div>
		<br>
		<a href="<c:url value="/insertToOrderBean/${newsSingle.newsId}" />" onclick="return confirm('確定購買?')">購買</a>
		<input type ="button" onclick="history.back()" value="回前頁"></input>

	</div>
	<script >
clock();
</script>
</body>
</html>