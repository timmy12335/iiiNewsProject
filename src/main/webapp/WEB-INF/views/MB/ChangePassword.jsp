<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改密碼</title>
</head>
<body>
	<nav>
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<section style="margin-top: 100px;" align="center">
		<div id="page" class="container"></div>
		<form:form id="regform" modelAttribute="changepwd">
			<table align="center">
				<h2 align="center">修改密碼</h2>
				<tr>
					<td>輸入舊密碼：</td>
					<td><form:input type="password" path="password"
							id='password' /></td>
				</tr>
				<tr>
					<td>輸入新密碼：</td>
					<td><form:input type="password" path="memberNewPassword"
							id='memberNewPassword' /></td>
				</tr>
				<tr>
					<td>輸入新密碼確認：</td>
					<td><input type="password" name="password"
							id='password' /></td>
				</tr>
				<tr align="center">
					<td colspan="3"><input type="submit" value="確認填寫"> <input
						type="reset" value="重新填寫" /></td>
				</tr>
			</table>
		</form:form>
	</section>
</body>
</html>