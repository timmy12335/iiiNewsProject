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
	<div align="center" style="margin-top:150px;">
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
			<p>新聞內文:</p><p>${ newsSingle.article }</p>
			<p>價格: ${ newsSingle.price }</p>
			<p>販賣計時: ${ newsSingle.limitTime }</p>
			<a href="<c:url value="" />">購買</a>
			<a href="<c:url value="" />">回前頁</a>		
		
	</div>
</body>
</html>