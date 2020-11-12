<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
     "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Email with Spring MVC</title>
<script
	src='http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js'></script>
</head>
<body>
<nav>
<jsp:include page="/fragment/navbar.jsp"></jsp:include>
</nav>
<center style="margin-top:100px">
		<ul>

			<c:forEach var='ser' items='${CrReport}' varStatus="report">

			<table width="825" height="43" border="0">

				<tr>
						
					<td width="64"><li>${ msg.getUsername}</li></td>

					<td width="127"><li>${msg.getTitle}</li></td>

					<td width="620">${msg.getContent}</td>

				</tr>

			</table>

			</c:forEach>

		</ul>

		在這裡把那個留言列表 列出來就可以了

		<form action="/insermsg" method="post" name="loginform">

			<table bgcolor="#B3B3FF">

				<caption>歡迎訪問留言板</caption>

				<tr>

					<td>使用者名稱：</td>

					<td><input type="text" name="username" size="40"></td>

				</tr>

				<tr>

					<td>主題：</td>

					<td><input type="text" name="title" size="40"></td>

				</tr>

				<tr>

					<td>內容：</td>

					<td><textarea name="content" rows="10" cols="40"></textarea>

					</td>

				</tr>

				<tr>

					<td><input type="submit" value=" 提交 "></td>

					<td><input type="reset" value=" 重填 "></td>

				</tr>

			</table>

		</form>

	</center>
</body>
</html>