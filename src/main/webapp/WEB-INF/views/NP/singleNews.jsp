<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>單一新聞表</title>
</head>
<body>
<nav>
<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
</nav>
	<div align="center" style="margin-top:100px;">
	<h2>所有新聞列表</h2>	
	</div>
	<hr>
	<div align="left">
		<c:forEach var='news' items='${newsLists}'>
			<p>新聞編號： ${ news.newsId }</p>
			<p>上傳時間：${news.uploadTime}</p>
			<p>新聞標題: &nbsp;${ news.title }</p>
			<p>新聞類型: ${ news.newsType }</p>
			<p>發生日期: ${ news.happenDate }</p>
			<p>發生時間: ${ news.happenTime }</p>
			<p>發生地點: ${ news.location }</p>
			<p>新聞內文:</p><p>${ news.article }</p>
			<p>價格: ${ news.price }</p>
			<p>販賣計時: ${ news.limitTime }</p>
			<a href="<c:url value="" />">修改</a>
			<a href="<c:url value="" />">刪除</a>		
		</c:forEach>	
	</div>
</body>
</html>