<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>資料新增狀態</title>
<link rel="stylesheet" href="/project/css/default.css">
<style>
body {
	background-attachment: fixed;
	/*background-color: #EBFFEB;*/
	background-repeat: no-repeat;
	background-position: 20px 50px;
}
.A1{
width:500px;
word-break: break-all;
margin:5px;
font-weight:"bold";
}

</style>
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
		<table border="1">
			<h1>資料新增成功</h1>
			<tr><td><div class="A1">時間: ${videoBean.time}</div></td></tr>
			<tr><td><div class="A1">會員編號: ${videoBean.userNumber}</div></td></tr>
			<tr><td><div class="A1">類型: ${videoBean.tag}</div></td></tr>
			<tr><td><div class="A1">標題: ${videoBean.title}</div></td></tr>
			<tr><td><div class="A1">連結: <a href="${videoBean.link}" >${videoBean.link}</a>
			<iframe align="center" width="500" height="300" 
			src="https://www.youtube.com/embed/${videoBean.link}" frameborder="0" >
			</iframe></div></td></tr>
			<tr><td><div class="A1">內文敘述: ${videoBean.text}</div></td></tr>
		</table>
	</div>
	<div align='center'>
		<hr>
		<a href="<c:url value='/html/index.jsp' />">回首頁</a>
	</div>
	</div>
	</div>
</body>
</html>