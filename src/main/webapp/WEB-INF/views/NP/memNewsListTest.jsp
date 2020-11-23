<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><meta http-equiv="X-UA-Compatible" content="IE=edge">
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
<style>
.incss {
	width: 150px;
	height: 45px;
	margin: 10px;
	font-size: 20px;
	background-color: #BC214C;
	border: none;
	outline: none;
	box-shadow: 3px 3px 3px #9D9D9D;
	color: white;
}

.incss:hover {
	background-color: #e884a0;
}

p {
	margin: 4px auto;
}

.title0 {
	margin: 1em 0;
	position: relative;
	padding: 0.25em 0;
	font-weight: bold;
}

.title0:after {
	content: "";
	display: block;
	height: 4px;
	background-image: linear-gradient(to right, #FF7365 0%, transparent);
	/* 自訂的顏色 */
}

.dstyle {
	background-color: lightpink;
	margin: 20px;
	border-radius: 15px;
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
			<b>會員「${MBBean.name}」，您好&nbsp;&nbsp;這是您的未上架新聞列表</b>
		</h3>
		<c:choose>
			<c:when test="${empty memNewsList}">
				<tr height='36'>
					<td colspan='8' align='center'><font color='red'>無上傳新聞資料</font></td>
				</tr>
			</c:when>
			<c:otherwise>
			
			
			
			<form method="POST"  id="form1" action="<c:url value='/updateLimitTime' />" >
			
				<c:forEach var='news' items='${memNewsList}' varStatus='loop' >
				<div class="border dstyle" >
							<div style="background-color:lavenderblush;border-radius:15px;margin:0px 20px">
							<div class="row" style="margin:15px">
								<div class="col-sm-2" >
								<img width='250' height='180' src="<c:url value='/getNewsPicture/${news.newsId}'/>">
								</div>
																								
								<div class="col-sm-3" align='left'  style="padding-left:60px;">								
									
									<p><b>${news.newsId}</b></p>
									<p>新聞類型：${news.newsType}</p>
									<p>發生時間：${news.happenDate}&ensp;${news.happenTime}</p>
									<p>發生地點：${news.location}</p>									
									<p>上傳時間：${fn:substring(news.uploadTime,0,19)}</p>
									<p class="text-danger"><b>販賣計時：尚未輸入</b></p>
								</div>
								<div class="col-sm-5" >
									<div class="col-12 text-left">
										<div class="title0" style="font-size:18px;margin:3px;"><b>${news.title}</b></div>
									</div>
									<div class="col-12 text-left">
										<h6>${news.outline}</h6>
										
										<input type="hidden" id="limitTime${loop.index}"  placeholder="00:00:00"/>
										<div id="ftime${loop.index}" style="display:none;">
										<input type="hidden" id="newsId${loop.index}" value="${news.newsId}"/>										
										</div>
										
										<input type="button" id="keyin${loop.index}" value="輸入計時時間" onclick="clickToText(${loop.index})" class="btn btn-secondary">
										<input type="hidden" name="submit" id="submit${loop.index}" onclick="return inputLimitTime(${loop.index})" value="確認送出" class="btn btn-secondary ">
									</div>
								</div>
<!-- 									<div class="col-sm-2" style="border:1px solid black;"> -->
									<table class="col-sm-2" style="text-align:center;margin:10px auto;" >
										
										<tr>
											<td style="">
											
										</tr>
																				
										<tr>
											<td>
											<div >
												<h3 class="text-danger">
													<small class="text-muted" ></small>NT$${news.price} <br>
												</h3>
											</div>
											</td>
										</tr>
										<tr>
											<td>
											<button type="button" class="btn btn-primary " onclick="location.href='<c:url value="/getUpdateSingleNews/${news.newsId}"/>'">
											<i class="fas fa-pencil-alt"></i>&ensp;修改本則新聞
											</button>
											</td>
										</tr>
										<tr>
											<td>
											<button type="button" class="btn btn-secondary " onclick="delNews('${news.newsId}')">
											<i class="fas fa-trash-alt"></i>&ensp;刪除本則新聞
											</button>
											</td>
										</tr>
										<tr>
											<td>
											<button type="button" class="btn btn-danger " onclick="location.href='<c:url value="/getSingleNewsForUpdate/${news.newsId}"/>'">
											<i class="fas fa-info-circle"></i>&ensp;本則詳細資訊
											</button>
											</td>
										</tr>
									</table>

							</div>
							</div>
						</div>

				</c:forEach>
				</form>
			</c:otherwise>
		</c:choose>

		<br>
		<div  align="center">
			<input type="button" class="incss" value="回首頁" onclick="location.href='/iiiNews'">
		</div>
		
</div>
	</div>
	<script>
	function clickToText(c) {
		$("#limitTime"+[c]).attr("type","text");
		$("#submit"+[c]).attr("type","submit");
		$("#keyin"+[c]).attr("type","hidden");
	}
	
	function delNews(Id){
		if (confirm("確定刪除此項商品 ? ") ) {
			location.href="delSingleNews/"+Id;
		} else {
			;
		}
	}
	
	function inputLimitTime(g) {
//		let time = prompt("請輸入限時時間", "");
		let time = $("#limitTime"+[g]).val();
		console.log(time);
		if(time){			
//			$("#limitTime"+[g]).attr("value",time);
			$("#limitTime"+[g]).attr("name","limitTime");
			$("#newsId"+[g]).attr("name","newsId");
			console.log(time);
		}else if(time==""){
			alert("請輸入正確時間")
			return false;
				
			}
			
				 
			
		}
	
	</script>
</body>
</html>