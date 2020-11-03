<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品內容</title>
</head>
<body>
<nav>
<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
</nav>

	<div align="center" style="margin-top:100px;">
		<h2>商品內容</h2>
		<a href="<c:url value='/' />">回首頁</a>
	</div>
	<span>${msgMap.addStatus}</span>
	<hr>
	<div align="center">
		<table border="1">
			<tr><td>廣告編號</td><td>賣家</td><td>廣告日期</td><td>欄位分類</td></tr>
			<tr>
				<td>${oneItem.adNo}</td><td>${oneItem.sellerMemberId}</td><td>${oneItem.adDate}</td><td>${oneItem.categoryNo}</td>
				</tr>
			<tr><td>寬</td><td>高</td><td>單價</td><td>設定</td></tr>
				<tr>
				<td>${oneItem.width}</td><td>${oneItem.height}</td>
				<td>${oneItem.unitPrice}</td>
				<td>
					<a href="<c:url value="#" />" onclick="return confirm('Are you sure?')">上傳圖片</a>
				</td>
				</tr>
		</table>
	</div>
</body>
</html>