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
  box-shadow: 4px 4px 4px #9D9D9D;
}
p{
  margin: 3px;
  font-size: 1em;
}

</style>

</head>
<body>
	<nav class="navbar fixed-top">
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<div class="container-sm"  >

		<div  style="margin-top: 100px;">
		<div align="center">
			<h1>新聞詳細內容</h1>
			<p>可於前頁輸入時間上架喔!</p>
			<p></p>
		</div>
			<div class="shadow0" style="background-color:lightpink;border-radius:15px;margin-bottom:80px">
				<div class="row">
					<div class="col-sm-6 p-5" >
					<img class="shadow0" style="border:5px white solid ;border-radius:15px;margin-left:70px" width='400' height='250' src="<c:url value='/getNewsPicture/${ newsSingle.newsId }'/>">
					</div>
					<div class="col-sm-6 p-5 " align="left">
					<div class="p-2 shadow0" style="background-color:white;border-radius:15px;margin-right:15px">
						<p>新聞編號： ${ newsSingle.newsId }</p>
						<p>上傳時間：${fn:substring(newsSingle.uploadTime,0,19)}</p>
						<p>新聞類型: ${ newsSingle.newsType }</p>
						<p>發生時間: ${ newsSingle.happenDate }&ensp;${ newsSingle.happenTime }</p>
						<p>發生地點: ${ newsSingle.location }</p>												
<%-- 						<p>到期時間: ${ newsSingle.futureTime }</p> --%>
						
<!-- 						<div class="badge badge-secondary " style="font-size:25px;" id=lastime></div><br> -->
						<span class="text-danger" style="font-size:35px;margin:10px">
							<b>NT$${newsSingle.price} </b>
						</span>						
						<a href="<c:url value='/getMemNewsList'/>" class="btn btn-primary btn-lg">
						<i class="fas fa-arrow-alt-circle-left"></i>&ensp;回列表</a>						
						</div>
						
						</div>
				</div>
				
				<div class="row " >
					<div class="col-sm-11 " style="margin:0 auto;">
						<article class="all-browsers shadow0">
							
							<article class="browser ">
								<h4 class="text-danger"><b>標題</b></h4>
								<h6>${ newsSingle.title }</h6>
							</article>
							<article class="browser">
								<h4 class="text-danger"><b>大綱</b></h4>
								<h6>${ newsSingle.outline }</h6>
							</article>
							<article class="browser">
								<h4 class="text-danger"><b>內文</b></h4>
								<p>${ newsSingle.article }</p>
							</article>
						</article>
						<div align="center" style="margin:50px;">
					
						</div>
					</div>
					
				</div>
				
			</div>
		</div>
		
	</div>


</body>
</html>