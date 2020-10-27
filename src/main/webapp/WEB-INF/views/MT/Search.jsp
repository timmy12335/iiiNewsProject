<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查詢</title>
<link rel="stylesheet" href="/project/css/default.css">
<style>
body {
	background-attachment: fixed;
	/*background-color: #EBFFEB;*/
	background-repeat: no-repeat;
	background-position: 20px 50px;
}

.st1 {
	text-align: left;
	width: 200px;
	margin: 20px;
}

.sub {
	background-color: #dcdcdc;
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
	<form method="post" action="/project/SearchVideoController" >
		<div align="center">
			<h2>查詢資料</h2>
			<hr>
			<div class="st1">
				<label class="t1" for="userNum1">會員帳號:</label> 
				<input type="text" id="userNum1" name="userNum1" size="30" 
				 autofocus placeholder="UserNumber" autocomplete="off">
				 <font color="red" size="1">${errorMsg.userNumber}</font>
			</div>
			<div id="btnArea" align="center">
				<input class="sub" type="submit" name="submit" id="submit" value="送出" /> 
				<input class="sub" type="reset" name="cancel" id="cancel" value="清除" />
			</div>
		</div>
	</form>
	</div>
</div>
</body>
</html>