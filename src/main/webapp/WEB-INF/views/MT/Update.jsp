<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增影片</title>
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

textarea {
	resize: none;
}
</style>
</head>
<body>
<%-- 	<jsp:include page="/test/topside.html" /> --%>
	<div id="content">
		<div id="sidebar">
			<ul>
				<li><a href="IndexTest.jsp" accesskey="1" title="">首頁</a></li>
				<li><a href="uploadFormTest.jsp" accesskey="2" title="">新增上傳</a></li>
				<li><a href="../ExclusiveNews/GetNews.html" accesskey="3"
					title="">查詢</a></li>
				<li><a href="/practice/RetrieveAllNews" accesskey="4" title="">全部內容</a></li>
				<li><a href="#" accesskey="5" title="">Contact Us</a></li>
			</ul>
		</div>
		<div id="page" class="container">
			<form method="post" action="/project/CreateVideoController">
				<div align="center">
					<h2>新增影片</h2>
					<hr>
					<div class="st1">
						<label for="" class="t1">類別:</label> <select name="tag1">
							<option value="100">生活</option>
							<option value="200">趣味</option>
							<option value="300">美食</option>
							<option value="400">寵物</option>
							<option value="500">惡搞</option>
						</select>
					</div>
					<div class="st1">
						<label class="t1" for="title1">標題:</label> <input type="text"
							id="title1" name="title1" size="30" autofocus
							placeholder="今晚我想來點..." autocomplete="on"> <font
							color="red" size="1">${errorMsg.title}</font>
					</div>
					<div class="st1">
						<label class="t1" for="link1">影片連結:</label> <input type="text"
							id="link1" name="link1" size="30"
							placeholder="https://www.youtube.com/..." autocomplete="off">
						<font color="red" size="1">${errorMsg.link}</font>
					</div>
					<div class="st1">
						<label class="t1" for="">照片:</label> <input type="file" id="img1"
							name="img1" multiple>
					</div>
					<div class="st1">
						<label class="t1" for="text1">內容:</label>
						<textarea name="text1" id="cols1" cols="30" rows="10"
							maxlength="250" placeholder="限輸入250字"></textarea>
					</div>
					<div id="btnArea" align="center">
						<input class="sub" type="submit" name="submit" id="submit"
							value="送出" /> <input class="sub" type="reset" name="cancel"
							id="cancel" value="清除" />
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>