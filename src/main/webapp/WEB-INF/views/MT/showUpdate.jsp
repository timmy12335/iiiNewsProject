<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show All</title>
<link rel="stylesheet" href="/project/css/default.css">
<style>
body {
	background-attachment: fixed;
	/*background-color: #EBFFEB;*/
	background-repeat: no-repeat;
	background-position: 20px 50px;
}

.A1 {
	width: 500px;
	word-break: break-all;
	margin: 5px;
	font-weight: "bold";
}
div {
word-break:break-all;
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
			<div align='center'>
				<h2>查詢結果</h2>
				<hr>
				<table border='1'>
					<tr>
						<td width="120" align="center">文章編號</td>
						<td width="90" align="center">登錄時間</td>
						<td width="120" align="center">會員編號</td>
						<td width="120" align="center">類型</td>
						<td width="120" align="center">標題</td>
						<td width="120" align="center">連結</td>
						<td width="120" align="center">內文敘述</td>
					</tr>
					<c:choose>
						<c:when test="${empty allVideos}">
							<tr height='36'>
								<td colspan='7' align='center'><font color='red'>查無會員資料</font></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var='vi' items='${allVideos}'>
								<tr>
									<td align="center">${vi.serialNumber}</td>
									<td align="center">${vi.time}</td>
									<td align="center">${vi.userNumber}</td>
									<td align="center">${vi.tag}</td>
									<td align="center">${vi.title}</td>
									<td align="left">${vi.link}</td>
									<td align="left">${vi.text}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
				<hr>
				<a href="<c:url value="/html/index.jsp" />">回首頁</a>
			</div>
		</div>
	</div>
</body>
</html>