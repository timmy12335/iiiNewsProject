<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>發文紀錄</title>
<script type='text/javascript'>
window.onload = function() { //刪除文章，OK
	$('.delSingle').click(function() {
		if (confirm('確定刪除此筆紀錄? ')) {
			var href = $(this).attr('href');
			location.href = href;
		}
		return false;
	});
}

</script>


<style>
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 90%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}


#customers tr:hover {background-color: #FFF3EE;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #FFAD86;
  color: block;
}

td {
	background-color: #FFF3EE;
	padding: 3px;
	text-align:center;
}

.td1 {
/* 	width: 150px; */
	word-break: break-all;
	margin: 5px;
	font-weight: "bold";
	font-size:18px;
}

.ellipsis {
	overflow:hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	white-space: normal;
}

a {
	color:#0000FF; 
    

}
a:hover{
	color:#0000FF ;
	text-decoration:none;
}

.aline{
	margin: 1em 0;
	position: relative;
	padding: 0.25em 0;
	font-weight: bold;
}
</style>
</head>
<body>
<div class="iiinewsContainer">
	<div class="container">
	<nav class="navbar fixed-top">
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<div align="center" style="background-color: #f8f2e4">
	<div style="margin-top: 30px;">
		<br><br><br>
		<h2>${MBBean.name}的發文紀錄</h2>
<%-- 		<a href="<c:url value='/' />">回首頁</a> --%>
	</div>
	<hr>
	<c:choose>
			<c:when test="${empty memArticleList}">
			<tr>
				<td colspan="10"><div style="font-size:20px;color:red;text-align:center;">&nbsp;暫無發文紀錄&nbsp;<br><br>
				<a href="<c:url value='/MtCreate' />">&nbsp;立刻與好友分享你的第一篇文章!!!&nbsp;</a></div></td>
			</tr>
			</c:when>
			<c:otherwise>
	<div align="center">
		<table id="customers">
			<tr style="font-size:20px">
<!-- 				<th>PK</th> -->
<!-- 				<th>文章編號</th> -->
<!-- 				<th>發文者</th> -->
				
				<th>類型</th>
				<th>標題</th>
				<th>文章狀態</th>
				<th>上傳日期</th>
<!-- 				<th>圖片</th> -->
<!-- 				<th>內文</th> -->
				<th>維護</th>
			</tr>
<%-- 			<c:if test="${MBBean != null}"> --%>
			<c:forEach var="memList" items="${memArticleList}">
				<tr>
					<td>${memList.category}</td>
					<td class="td1 aline"><a href="<c:url value='/getSingleArticle/${memList.articleId}'/>" >${memList.title}</a> </td>
<%-- 					<td class="td1"><img style="width:160px;height:90px" src="<c:url value='/getMtCreate/${memList.articleId}' />" />${memList.imgName}</td> --%>
					<c:if test="${ memList.status == 1}"><td>可瀏覽</td></c:if>
					<c:if test="${ memList.status == 0}"><td>***已下架***</td></c:if>
					<c:set var="date" value="${fn:substring(memList.updateDate, 0, 10)}" />
					<td>${date}</td>
					<td class="td1">
						<div align="center">
							<a class="btn btn-secondary" href="${pageContext.request.contextPath}/modifyArticle/${memList.pkey}">編輯資料</a>
							<a class='delSingle btn btn-danger' href="${pageContext.request.contextPath}/delMemArticle/${memList.articleId}">
							<c:if test="${ memList.status == 0}" ><a href='' ></a></c:if>刪除</a>
<%-- 							<a href="${pageContext.request.contextPath}/getAllMtAdd/Del/${all.pkey}">從DB刪除</a> --%>
						</div>
					</td>
				</tr>
			</c:forEach>
<%-- 			</c:if> --%>
<%-- 			<c:if test="${MBBean == null}"> --%>
<!-- 				<tr> -->
<!-- 					<td colspan="10"><div style="font-size:20px;color:red;text-align:center;">&nbsp;暫無發文紀錄&nbsp;</div></td> -->
<!-- 				</tr> -->
<%-- 			</c:if> --%>
		</table>
		<hr>
		<a class="btn btn-primary" href="<c:url value="" />">TOP</a>
		<a class="btn btn-primary" href="<c:url value='/' />">回首頁</a><br><br>
	</div>
	</c:otherwise>
		</c:choose>
		</div>
		</div>
    </div>
</body>
</html>