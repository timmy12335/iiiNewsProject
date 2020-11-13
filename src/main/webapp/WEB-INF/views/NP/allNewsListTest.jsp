<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/cssmenu/bootstrap_index.css">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://kit.fontawesome.com/ed0adb3a32.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>所有新聞列表</title>
<style>
.tablebyme {
	width: 70%;
	border-collapse: collapse;
}

.tablebyme td {
	padding: 5px;
}

.tablebyme tbody tr:nth-of-type(even) {
	background-color: rgba(194, 223, 255, 0.5)
}

.tablebyme tbody tr:hover {
	color: #212529;
	background-color: rgba(0, 0, 0, .075)
}

.tablebyme th {
	color: #fff;
	background-color: #005AB5;
	border-color: #FFFFFF
}

.tablebyme a {
	text-decoration: none;
	font-weight: 500;
}

.tablebyme a:hover {
	text-decoration: none;
	background: #005AB5;
	color: white;
	font-weight: 500;
}

.table-hover {
	width: 80%;
}

.table-hover thead {
	text-align: center;
	background-color: #001f63;
	color: white;
	border: 1px solid white;
}

.table-hover thead th {
	border-left: 2px solid white;
}

#cssmenu {
	border-bottom: 2px solid white;
}
.wei-grid-special0 {
position: relative;
/* left: 10%; */
top: 0;
margin: 0px 10px 0px 10px;
overflow: hidden;
transition: box-shadow 500ms;
}


.wei-grid-special0:hover {
box-shadow: 0 5px 30px rgba(0, 0, 0, 0.8);
}
</style>
<script>
	
	function goSingleNews(e) {
		
		console.log(e);

//		location.href="/getSingleNews/" + e;
		location.href="<c:url value='/getSingleNews/'/>"+ e;
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
		
		let startTime = timeNow().replace(/\-/g, "/");
		endTime = endTime.replace(/\-/g, "/");
		//將計算間隔類性字元轉換為小寫 
		var sTime = new Date(startTime); //開始時間 
		var eTime = new Date(endTime); //結束時間 
		//作為除數的數字 
		let divsec = 1000;
		let sec = parseInt((eTime.getTime() - sTime.getTime()) / parseInt(divsec));
		return sec;
	}
	
	
</script>

</head>
<body>
	<nav class="navbar fixed-top">
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<section class="container" style="margin-top:150px;">
	
		<div class="row " >
			<!-- 標題/開始 -->
			<div class="col-12">
				<h1 class="text-center">
					<strong>新聞列表</strong>
				</h1>
			</div>
			<!-- 標題/結束 -->
			<!-- 課程1/開始 -->
			<c:forEach var='news' items='${newsLists}' varStatus='loop'>
				<div class="col-12 col-md-4 p2 ">
					<div class="box-content bg-white wei-grid-special0">
						<div >
							<img  width='400' height='300'
								src="<c:url value='/getUpNewsPicture/${news.newsId}'/>"
								alt="Unity" class="img-fluid d-block m-auto w-75">
						</div>
						<div class="mt-2 mb-2">
							<h3>${ news.newsType}</h3>
						</div>
						<div class="text-info mt-2 mb-2">
							<a href="<c:url value='/getSingleNews/${news.newsId}'/>">${news.title}
							</a>
						</div>
						<div class="mt-2 mb-2">
							<span class="text-muted">${ news.location}</span>
						</div>
						<div class="mt-2 mb-2">
							<span class="text-muted">上架時間：${fn:substring(news.uploadTime,0,19)}</span><br>
							
<%-- 							到期時間:<span class="text-muted" id="ftime${loop.index}">${news.futureTime}</span> --%>
						</div>
						<div class="text-left mt-2 mb-2">
							<h4 class="text-danger">
								<small class="text-muted"></small>NT$${news.price}
								<br>
							</h4>
						</div>
						<div class="mt-3">
							<div  id="ftime${loop.index}" style="display:none">${news.futureTime}</div>
							<div class="btn btn-danger btn-lg btn-block" id='lastime${loop.index}'></div>
							<button type="button" class="btn btn-outline-primary btn-lg btn-block" onclick="goSingleNews('${news.newsId}')">
							購買
							</button>
							
						</div>
					</div>
				</div>
			</c:forEach>
			
		</div>
	</section>
	<%-- <c:forEach var='news' items='${newsLists}' varStatus='loop'> --%>
	<!-- <table> -->
	<!-- 	<tr style="background-color:lightblue;"  height='36'> -->
	<!-- 		<th width='600' align='center'>新聞標題</th> -->
	<!-- 		<th width='100' align='center'>新聞編號</th> -->
	<!-- 		<th width='60' align='center'>上傳時間</th>		 -->
	<!-- 		<th width='100' align='center'>新聞類型</th>		 -->
	<!-- 		<th width='100' align='center'>發生地點</th> -->
	<!-- 		<th width='200' align='center'>影像</th> -->
	<!-- 	</tr> -->
	<!-- 	<tr> -->
	<!-- 		<td align='center' >  -->
	<%-- 		<a href="<c:url value='/getSingleNews/${news.newsId}'/>" >${news.title}  </a>  --%>

	<!-- 		</td> -->
	<%-- 		<td width='100' align='center'>${news.newsId}</td> --%>
	<%-- 		<td align='center'>${news.uploadTime}</td>		 --%>
	<%-- 		<td align='center'>${ news.newsType}</td> --%>

	<%-- 		<td align='center'>${news.location}</td> --%>
	<!-- 		<td><img width='200' height='150'  -->
	<%-- 	                    	src="<c:url value='/getUpNewsPicture/${news.newsId}'/>" ></td> --%>
	<!-- 		</tr> -->
	<!--     <tr style="background-color:lightblue;"  height='36'> -->
	<!-- 		<th width='600' align='center'>新聞大綱</th> -->
	<!-- 		<th width='100' align='center'>發生日期</th> -->
	<!-- 		<th width='100' align='center'>發生時間</th> -->
	<!-- 		<th width='100' align='center'>價格</th> -->
	<!-- 		<th width='60' align='center'>到期時間</th>	 -->
	<!-- 		<th width='60' align='center'>時間倒數</th>	 -->
	<!-- 		<th></th> -->
	<!-- 		</tr> -->
	<!-- 		<tr> -->
	<%-- 		<td width='600' align='center'>${news.outline}</td> --%>
	<%-- 		<td align='center'>${news.happenDate}</td> --%>
	<%-- 		<td align='center'>${news.happenTime}</td> --%>
	<%-- 		<td align='center'>${news.price}</td> --%>
	<%-- 		<td align='center' id="ftime${loop.index}">${news.futureTime}</td> --%>
	<%-- 		<td align='center' id='lastime${loop.index}'></td> --%>
	<!-- 		<td> -->
	<%-- 		<a href="<c:url value="/insertToOrderBean/${news.newsId}" />" onclick="return confirm('確定購買?')">購買</a> --%>
	<!-- 		</td> -->
	<!-- 	</tr>		 -->
	<!-- 	</table> -->
	<!-- 	<hr> -->
	<%-- </c:forEach> --%>



<!-- 	<input type="button" value="回目錄" onclick="location.href='/iiiNews'"> -->
	<!--<a href="<c:url value='/' />">回前頁</a>   -->

<script>
	
var num = ${newsLists.size()};
//將秒轉回時:分:秒 
function clock() {
	let sec01,day,hr,hr01,min,sec;
	for(var i=0;i<num;i++){
	var ptime = document.getElementById("ftime"+[i]).innerHTML ;
	sec01 = GetDateDiff(ptime);
	sec = sec01 % 60 <10 ? '0'+sec01 % 60 :sec01 % 60 ;		
	min = (sec01-sec)/60%60 <10 ? '0'+ (sec01-sec)/60%60 : (sec01-sec)/60%60;
	hr01 =(((sec01-sec) /60) - min) / 60 ;
	hr = hr01 <10 ?'0'+ hr01 :hr01 ;
	let zr0 = hr + min + sec;
//若為0時0分0秒 重整頁面下架
	if(zr0 == 0){
		window.location.reload();
	}else{		
		let time = hr+"小時"+min+"分"+sec+"秒";
		document.getElementById("lastime"+[i]).innerHTML = time;
	}
}
}
clock();
//每一秒重新整理
setInterval(clock,1000);



</script>
</body>
</html>