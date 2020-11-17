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
<!--    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
   
<%--     <script  type="text/javascript" src="${pageContext.request.contextPath}/js/Hoverpulse.js"></script> --%>
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
box-shadow: 0 5px 30px rgba(0, 0, 0, 0.4);
}
</style>

<script src="js/jquery.hoverpulse.js"></script>
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
	<section class="container-fluid" style="margin-top:150px;">
	
		<div class="row col-12 " >
			<!-- 標題/開始 -->
			<div class="col-12 ">
			
				<h1 class="text-center">
					<strong>新聞列表</strong>
				</h1><br>
			</div>
			<!-- 標題/結束 -->
			<div class="col-3" style="border-radius:15px;">
<!-- 				<div class="col-12 col-md-4"> -->
                <!-- 搜尋/start -->
                
                <div  id="WordsForm"  class="bg-white p-3 mb-3 border rounded" >
                    <div class="input-group" >
                        <input type="text"  id="wordsSearch"  class="form-control" placeholder="搜尋" aria-label="Search for">
                        <span class="input-group-append">
                            <button type="submit" class="btn btn-secondary" onclick="searchByWord()">Go!</button>
                        </span>
                    </div>
                </div>
                <div id="TypeForm" class="bg-white p-3 mb-3 border rounded">
							<select id="type" class="form-control" onchange="searchByType()">
								<option value="-1">分類項目</option>
								<option value="交通">交通</option>
								<option value="糾紛">糾紛</option>
								<option value="感情">感情</option>
								<option value="詐騙">詐騙</option>
								<option value="災情">災情</option>
								<option value="爆料">爆料</option>
							</select>
				</div>
                <!-- 搜尋/end -->
                <!-- 分類/start -->
                <div class="bg-white p-3 mb-3 border rounded">
                    <h5 class="mb-3">
                        <strong>分類</strong>
                    </h5>
                    <ul class="list-category category">
                        <li>
                            <a href="<c:url value='/getNewsByType?type=交通' />">交通
                                <span class="badge badge-pill badge-secondary ml-2">3</span>
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/getNewsByType?type=糾紛' />">糾紛</a>
                        </li>
                        <li>
                            <a href="<c:url value='/getNewsByType?type=感情' />">感情</a>
                        </li>
                        <li>
                            <a href="<c:url value='/getNewsByType?type=詐騙' />">詐騙</a>
                        </li>
                        <li>
                            <a href="<c:url value='/getNewsByType?type=災情' />">災情</a>
                        </li>
                        <li>
                            <a href="<c:url value='/getNewsByType?type=爆料' />">爆料</a>
                        </li>
                    </ul>
                </div>
                <!-- 分類/end -->
<!--                 </div> -->
          	</div>
			<!-- 課程1/開始 -->
			<div class="col-9">
			<div class="row">
			<c:choose>
				<c:when test="${empty newsLists}">
					<tr height='36'class="text-center">
						<td class="text-center"><font color='red'>無符合條件新聞</font></td>
					</tr>
				</c:when>
				<c:otherwise>
			<c:forEach var='news' items='${newsLists}' varStatus='loop'>
				<div class="col-12 col-md-4">
					<div class="box-content bg-white wei-grid-special0" style="margin-bottom:20px;border-radius:15px;">
						<div id="imgdiv">
							<img  width='220' height='150'
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
							<i class="fas fa-shopping-cart"></i>&ensp;購買
							</button>
							
						</div>
					</div>
				</div>
				<br>
			</c:forEach>
				</c:otherwise>
			</c:choose>
			</div>
			</div> 
			
			<script type="text/javascript">hello();</script>
			</div>
			
		
		 
	</section>

<script>
$(document).ready(function() {
    $("div.imgdiv img").hoverpulse();
});

function searchByType() {
	let type = document.getElementById("type").value;
	var queryStringtype = "?type=" + type;
	console.log(queryStringtype);
	var urlType = '<c:url value='/getNewsByType' />'+queryStringtype;
	window.location.href = urlType;
}

function searchByWord() {
//	var WordsForm = document.getElementById("WordsForm");
	let words = document.getElementById("wordsSearch").value;
	var queryStringWord = "?words=" + words;
	console.log(queryStringWord);
//	WordsForm.setAttribute('action','<c:url value='/getNewsByWords' />'+queryStringWord);
	var urla = '<c:url value='/getNewsByWords' />'+queryStringWord;
	console.log(urla);
// 	$("#WordsForm").attr('action',urla);
 	window.location.href = urla;
}
	
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
		document.getElementById("lastime"+[i]).innerHTML = "<i class='fas fa-stopwatch'></i>&ensp;"+time;
	}
}
}
clock();
//每一秒重新整理
setInterval(clock,1000);



</script>
</body>
</html>