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
			<h1>資料刪除成功</h1>
			<tr><td><div class="A1">使用者: ${videoBean.userNumber} , 文章刪除成功!</div></td></tr>
			<font color="red" size="1">${errorMsg.userNumber}</font>
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