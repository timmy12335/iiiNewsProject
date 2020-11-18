<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <title>單一新聞表</title>
  <style>
.all-browsers {
  margin: 0;
  padding: 5px;
  background-color: white;
   border-radius:15px; 
  
}

.all-browsers > h1, .browser {
  margin: 6px;
  padding: 5px;
}

.browser {
  background: white;
}

.browser > h2, p {
  margin: 4px;
  font-size: 90%;
}
.shadow0{
  box-shadow: 3px 3px 3px #9D9D9D;
}
p{
  margin: 3px;
  font-size: 1.2em;
}

</style>

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
// 	/* 
// 	 * 獲得時間差,時間格式為 年-月-日 小時:分鐘:秒 或者 年/月/日 小時：分鐘：秒 
// 	 * 其中，年月日為全格式，例如 ： 2010-10-12 01:00:00 
// 	 * 返回精度為：秒 
// 	 */
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
		document.getElementById("lastime").innerHTML ="<i class='fas fa-stopwatch'></i>&ensp;"+ time;

	}
	
	//每一秒重新整理
	setInterval(clock,1000);
</script>
</head>
<body>
	<nav class="navbar fixed-top">
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>

	<div class="container-sm"  >

		<div  style="margin-top: 100px;">
		<div align="center">
			<h1>新聞詳細內容</h1>
			<p>可於此網頁前往購買</p>
			<p>時間到則無法購買，請抓緊時間喔!要買要快!</p>
		</div>
			<div class="shadow0" style="background-color:lightpink;border-radius:15px;margin-bottom:80px">
				<div class="row">
					<div class="col-sm-6 p-5" >
					<img class="shadow0" style="border:5px white solid ;border-radius:15px;margin-left:20px" width='500' height='300' src="<c:url value='/getUpNewsPicture/${ newsSingle.newsId }'/>">
					</div>
					<div class="col-sm-6 p-5 " align="left">
					<div class="p-2 shadow0" style="background-color:white;border-radius:15px;margin-right:15px">
						<p>新聞編號： ${ newsSingle.newsId }</p>
						<p>上傳時間：${fn:substring(newsSingle.uploadTime,0,19)}</p>
						<p>新聞類型: ${ newsSingle.newsType }</p>
						<p>發生時間: ${ newsSingle.happenDate }&ensp;${ newsSingle.happenTime }</p>
						<p>發生地點: ${ newsSingle.location }</p>												
						<p>到期時間: ${ newsSingle.futureTime }</p>
						
						<div class="badge badge-secondary " style="font-size:25px;" id=lastime></div><br>
						<span class="text-danger" style="font-size:35px;margin:10px">
							<b>NT$${newsSingle.price} </b>
						</span>						
						<a href="#" onclick="history.back()" class="btn btn-primary btn-lg">
						<i class="fas fa-arrow-alt-circle-left"></i>&ensp;回列表</a>						
						</div>
						
						</div>
				</div>
				
				<div class="row " >
					<div class="col-sm-11 " style="margin:0 auto;">
						<article class="all-browsers shadow0">
							
							<article class="browser">
								<h3>新聞標題</h3>
								<h5>${ newsSingle.title }</h5>
							</article>
							<article class="browser">
								<h3>新聞大綱</h3>
								<h5>${ newsSingle.outline }</h5>
							</article>
							<article class="browser">
								<h2>Microsoft Edge</h2>
								<p>Microsoft Edge is a web browser developed by Microsoft,
									released in 2015. Microsoft Edge replaced Internet Explorer.</p>
							</article>
						</article>
						<div align="center" style="margin:50px;">
					
						</div>
					</div>
					
				</div>
				
			</div>
		</div>
		
	</div>

			
<script>
clock();

</script>
</body>
</html>