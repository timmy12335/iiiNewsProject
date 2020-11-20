<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>所有新聞列表</title>
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

#customers tr:hover {background-color:#ffffff;}

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
	//	console.log("sec="+sec);
		return sec;
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
	
	
</script>
</head>
<body>


<jsp:include page="/fragment/BMnav.jsp"></jsp:include> 
<div class="card-body">


<div align="center" class="table-responsive pt-3" >
<h3><b>新聞列表</b></h3>

<c:forEach var='news' items='${newsLists}' varStatus='loop'>
<table id="customers">
	<tr  height='36'>
		
		<th width='600' align='center'>新聞編號</th>
		
		<th width='150' align='center'>上傳時間</th>		
		<th width='100' align='center'>新聞類型</th>		
		<th width='150' align='center'>價格</th>
		<th width='200' align='center'>影像</th>
	</tr>
	<tr style="background-color: #ECF5FF">
		<td width='100' align='center'>${news.newsId}</td>
		
		
		<td align='center'>${fn:substring(news.uploadTime,0,19)}</td>		
		<td align='center'>${ news.newsType}</td>
		<td align='center'>${news.price}</td>
		
		<td><img width='200' height='150' 
	                    	src="<c:url value='/getUpNewsPicture/${news.newsId}'/>" ></td>
		</tr>
    <tr  height='36' >
		<th align='center'>新聞標題</th>
		<th align='center'>發生時間</th>
		
		<th align='center'>到期時間</th>	
		<th align='center'>時間倒數</th>	
		<th align='center'></th>	
		</tr>
		<tr style="background-color: #ECF5FF">
		
		<td align='center' > 
		<a href="<c:url value='/getSingleNews/${news.newsId}'/>" >${news.title}  </a> 
		
		</td>
		<td align='center'>${news.happenDate}&ensp;${news.happenTime}</td>
		
		<td align='center' id="ftime${loop.index}">${fn:substring(news.futureTime,0,19)}</td>
		<td align='center' id='lastime${loop.index}'></td>
		<td align='center'>
			<button type="button" class="btn btn-danger " onclick="delNews('${news.newsId}')">
				<i class="fas fa-trash-alt"></i>&ensp;刪除本則新聞
			</button>
		</td>
		
	</tr>		
	</table>
	<hr>
</c:forEach>
				



<!--<a href="<c:url value='/' />">回前頁</a>   -->
</div>

</div>
<script>

function delNews(Id){
	if (confirm("確定刪除此項商品 ? ") ) {
		location.href="delSingleNewsForBB/"+Id;
	} else {
		;
	}
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
		document.getElementById("lastime"+[i]).innerHTML = time;
	}
}
}
clock();
//每一秒重新整理
setInterval(clock,1000);



</script>
<jsp:include page="/fragment/BMfoot.jsp"></jsp:include> 
</body>
</html>