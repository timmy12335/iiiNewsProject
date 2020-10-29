<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8">
<title>上架廣告欄位</title>
</head>
<body>
	<nav>
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<div id="page" class="container" align="center">
		<h2 class="BoxTitle">廣告欄位置上傳</h2>
		<div>
			<form:form method="POST" modelAttribute="mtBean"
				enctype="multipart/form-data">
				<fieldset>
					<div align="center">
						<h2>新增影片</h2>
						<hr>
						<div class="st1">
							<label for="Category">類別:</label>
							<form:select path="Category">
								<form:option value="生活">生活</form:option>
								<form:option value="趣味">趣味</form:option>
								<form:option value="美食">美食</form:option>
								<form:option value="寵物">寵物</form:option>
								<form:option value="惡搞">惡搞</form:option>
							</form:select>
						</div>
						<div class="st1">
							<label for="title">標題:</label>
							<form:input type="text" id="title" name="title" path="title"
								size="30" placeholder="今晚我想來點..." autocomplete="on" />
							<font color="red" size="1">${errorMsg.title}</font>
						</div>
<!-- 						<div class="st1"> -->
<!-- 							<label for="videoLink">影片連結:</label> -->
<%-- 							<form:input type="text" id="videoLink" name="videoLink" path="videoLink" --%>
<%-- 								size="30" placeholder="https://www.youtube.com/..." --%>
<%-- 								autocomplete="off" /> --%>
<%-- 							<font color="red" size="1">${errorMsg.link}</font> --%>
<!-- 						</div> -->
						<div class="st1">
							<label for="Image">照片:</label>
							<form:input type="file" id="Image" name="Image" path="Image" />
						</div>
						<div class="st1">
							<label for="article">內容:</label>
							<form:textarea name="article" id="article" cols="30" rows="10"
								path="article" maxlength="250" placeholder="限輸入250字"></form:textarea>
						</div>
					</div>
				</fieldset>
				<div id="btn" align="center">
					<input class="sub" type="submit" name="submit" id="submit" value="送出" />
					<input class="sub" type="reset" name="cancel" id="cancel" value="清除" />
				</div>
			</form:form>
		</div>
		<br> <input type="button" value="one" onclick="onebuttontodata()">
	</div>
</body>
</html>