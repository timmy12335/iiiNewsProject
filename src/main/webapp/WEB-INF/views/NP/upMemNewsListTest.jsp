<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/cssmenu/bootstrap_index.css">
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<script src="https://kit.fontawesome.com/ed0adb3a32.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<title>會員新聞列表</title>

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
		var sTime = new Date(startTime); //開始時間 
		var eTime = new Date(endTime); //結束時間 
		//作為除數的數字 
		var divsec = 1000;
		let sec = parseInt((eTime.getTime() - sTime.getTime()) / parseInt(divsec));
		return sec;
	}
	
</script>
<style>
.incss{
			width:150px;
			height:45px;
			margin:10px;
			font-size:20px;
			background-color:#BC214C;
			border:none;
			outline: none;
			box-shadow: 3px 3px 3px #9D9D9D;
			color:white;
		}
		.incss:hover{
			background-color:#e884a0;
		}

p{
 margin:4px auto;

} 
.title0{
margin: 1em 0;
position: relative;
padding: 0.25em 0;
font-weight: bold;
}
.title0:after {
content: "";
display: block;
height: 4px;
background-image: linear-gradient(to right, #FF7365 0%, transparent);  /* 自訂的顏色 */
}
.dstyle{
	background-color:lightpink;
	margin:20px;
	border-radius:15px;
	box-shadow: 4px 4px 4px #9D9D9D;
}
</style>
</head>
<body>
	<nav class="navbar fixed-top">
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>

	<div class="container-fluid">
		<div align='center' style="margin-top: 150px;">
			<h3>
				<b>會員「${MBBean.name}」，您好&nbsp;&nbsp;這是您的已上架新聞列表</b>
			</h3>
			<c:choose>
				<c:when test="${empty upMemNewsList}">
					<tr height='36'>
						<td colspan='8' align='center'><font color='red'>無已上架新聞資料</font></td>
					</tr>
				</c:when>
				<c:otherwise>

					<c:forEach var='news' items='${upMemNewsList}' varStatus='loop'>
						<div class="border dstyle" >
							<div style="background-color:lavenderblush;border-radius:15px;margin:0px 20px">
							<div class="row" style="margin:15px">
								<div class="col-sm-2" >
								<img width='250' height='180' src="<c:url value='/getUpNewsPicture/${news.newsId}'/>">
								</div>
																								
								<div class="col-sm-3" align='left'  style="padding-left:60px;">								
									
									<p><b>${news.newsId}</b></p>
									<p>新聞類型：${news.newsType}</p>
									<p>發生時間：${news.happenDate}&ensp;${news.happenTime}</p>
									<p>發生地點：${news.location}</p>
									<p>販賣計時：${news.limitTime}</p>
									<p>上傳時間：${fn:substring(news.uploadTime,0,19)}</p>
								</div>
								<div class="col-sm-5" >
									<div class="col-12 text-left">
										<div class="title0" style="font-size:18px;margin:3px;"><b>${news.title}</b></div>
									</div>
									<div class="col-12 text-left">
										<h6>${news.outline}</h6>
									</div>
								</div>
<!-- 									<div class="col-sm-2" style="border:1px solid black;"> -->
									<table class="col-sm-2" style="text-align:center;margin:10px auto;" >
										
										<tr>
											<td style="">
											<div class="badge badge-secondary" style="font-size:23px;" id='lastime${loop.index}'></div>
											</td>
											<td id="ftime${loop.index}" style="display:none;"> ${news.futureTime} </td>
										</tr>
																				
										<tr>
											<td>
											<div style="margin:20px auto;">
												<h3 class="text-danger">
													NT$<fmt:formatNumber type="number">${news.price}</fmt:formatNumber>
												</h3>
											</div>
											</td>
										</tr>
										<tr>
											<td>
											<button type="button" class="btn btn-danger btn-lg btn-block" onclick="location.href='<c:url value="/getSingleNewsForMem/${news.newsId}"/>'">
											<i class="fas fa-info-circle"></i>&ensp;詳細資訊
											</button>
											</td>
										</tr>
									</table>
<!-- 								</div> -->
							</div>
							</div>
						</div>

					</c:forEach>

				</c:otherwise>
			</c:choose>

			<br>
			<div align="center">
				<input type="button" class="incss" value="回首頁"
					onclick="location.href='/iiiNews'">
			</div>
			
		</div>
	</div>
	<script>
	var num =  ${upMemNewsList.size()};
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
			document.getElementById("lastime"+[i]).innerHTML = "<i class='fas fa-stopwatch'></i>&ensp;"+ time;
		}
	}
	}
	clock();
	//每一秒重新整理
	setInterval(clock,1000);
	
	
	</script>
</body>
</html>