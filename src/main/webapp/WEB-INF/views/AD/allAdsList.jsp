<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有廣告列表</title>
</head>
<body>
	<div align="center">
		<h2>所有廣告列表</h2>
		<a href="<c:url value='/' />">回首頁</a>
	</div>
	<hr>
	<div align="center">
		<table border="1">
			<tr><td>產品編號</td><td>上傳日期</td><td>分類</td><td>寬</td><td>高</td><td>日期</td><td>單價</td><td>庫存</td></tr>
			<c:forEach var="ad" items="${adLists}">
				<tr>
				<td>${ad.adNo}</td><td>${ad.uploadDate}</td><td>${ad.categoryNo}</td>
				<td>${ad.width}</td><td>${ad.height}</td><td>${ad.adDate}</td><td>${ad.price}</td><td>${ad.stock}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	
	
	
	
</body>
</html>