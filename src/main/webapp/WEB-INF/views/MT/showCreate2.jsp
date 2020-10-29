<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有廣告列表</title>
</head>
<body>
	<nav>
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<div align="center" style="margin-top: 80px"> <br> 
		<h1>資料新增成功</h1>
	</div>
	<form action="/showCreate" method="post" enctype="multipart/form-data" id="form">
		<div align='center'>
			<table border="1">
<!-- 				<tr> -->
<%-- 					<td><div>PKKKKKK: ${mtbean.pkey}</div></td> --%>
<!-- 				</tr> -->
				<tr>
					<td><div>文章編號: ${mtbean.articleId}</div></td>
				</tr>
				<tr>
					<td><div>會員編號: ${mtbean.memberId}</div></td>
				</tr>
				<tr>
					<td><div>上傳時間: ${mtbean.updateDate}</div></td>
				</tr>
				<tr>
					<td><div>文章狀態: ${mtbean.articleStatus}</div></td>
				</tr>
				<tr>
					<td><div>${mtbean.category} -- ${mtbean.title}</div></td>
				</tr>
<!-- 				<tr> -->
<%-- 					<td><div>標籤: ${mtbean.category}</div></td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<%-- 					<td><div>標題: ${mtbean.title}</div></td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<%-- 					<td><div>影片連結: ${mtbean.videoLink}</div></td> --%>
<!-- 				</tr> -->
				<tr>
					<td><div style="width:500px;height:300px">內文: ${mtbean.imgLink} ******** ${mtbean.article}</div></td>
				</tr>
<!-- 				<tr> -->
<%-- 					<td><div>預覽連結: <a href="${videoBean.link}">${videoBean.link}</a> --%>
<!-- 							<iframe align="center" width="500" height="300"  -->
<%-- 							src="https://www.youtube.com/embed/${videoBean.link}" frameborder="0"> </iframe> --%>
<!-- 						</div> <br> <br> <br> <br> <br></td> -->
<!-- 				</tr> -->
			</table>
			<br> <a href="<c:url value='/' />">回首頁</a> <br>
		</div>
	</form>
</body>
</html>