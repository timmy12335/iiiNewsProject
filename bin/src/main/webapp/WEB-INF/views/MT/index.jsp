<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FUN</title>
<link rel="stylesheet" href="/project/css/default.css">
<!-- <style>
body {
	background-attachment: fixed;
	background-color: #EBFFEB;
	background-repeat: no-repeat;
	background-position: 20px 50px;
}

a {
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}
</style> -->
</head>
<body>
<%-- <jsp:include page="/test/topside.html"/> --%>
<div id="content">
	<div id="sidebar">
		<ul>
			<li><a href="IndexTest.jsp" accesskey="1" title="">首頁</a></li>
			<li><a href="uploadFormTest.jsp" accesskey="2" title="">新增上傳</a></li>
			<li><a href="../ExclusiveNews/GetNews.html" accesskey="3" title="">查詢</a></li>
			<li><a href="/practice/RetrieveAllNews" accesskey="4" title="">全部內容</a></li>
			<li><a href="#" accesskey="5" title="">Contact Us</a></li>
		</ul>
	</div>
	<div id="page" class="container">
		<div align='center'>
			<h1>休閒專區</h1>
			<hr>
			<a href="Create.jsp">新增文章</a><br><br>
			<a href="mod03/queryLottery.jsp">修改文章</a><br><br>
			<a href="Delete.jsp">刪除文章</a><br><br>
			<a href="Search.jsp">查詢發文</a><br>
		</div>
	</div>
</div>
</body>
</html>