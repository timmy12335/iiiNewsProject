<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Get All MtBean</title>
<style>
td{
padding: 3px;
}
.td1{
width:150px;
word-break: break-all;
margin:5px;
font-weight:"bold";
}
</style>
</head>
<body>
	<nav>
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<div align="center" style="margin-top: 100px;"><br>
		<h2>所有影片資料</h2>
		<a href="<c:url value='/' />">回首頁</a>
	</div>
	<hr>
	<div align="center">
		<table border="1">
			<tr>
				<td>PK</td>
				<td>文章編號</td>
				<td>使用者</td>
				<td>上傳日期</td>
				<td>文章狀態</td>
				<td>類型</td>
				<td>標題</td>
				<td>圖片</td>
				<td>內文</td>
				<td>是否刪除</td>
			</tr>
			<c:forEach var="all" items="${getAllMtAddList}">
				<tr>
					<td>&nbsp;${all.pkey} &nbsp;</td>
					<td>${all.articleId}</td>
					<td>${all.memberId}</td>
					<td>${all.updateDate}</td>
					<td>${all.articleStatus}</td>
					<td>${all.category}</td>
					<td class="td1">${all.title}</td>
					<td class="td1">${all.imgName}</td>
					<td class="td1">${all.article}</td>
					<td>
						<!-- 					<form action="#" method="POST"> -->
						<form action='<c:url value="/addProductToCart" />' method="POST">
							<input type="hidden" name="quantity" value="1">
							<input type="hidden" name="adPk" value="${all.pkey}">
<!-- 							<input type="submit" value="加入購物車按鈕" /> -->
						</form> 
						<div align="center">
						<a href="<c:url value="/******/${all.pkey}" />">刪除</a>
						</div>
					</td>
				</tr>
			</c:forEach>
		</table>
		<hr>
		<a href="<c:url value='/' />">回首頁</a>
	</div>
</body>
</html>