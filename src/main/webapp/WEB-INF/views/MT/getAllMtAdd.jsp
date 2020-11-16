<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.min.js"></script> -->
<meta charset="UTF-8">
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

<title>使用者文章管理</title>
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

#customers tr:hover {background-color: #F0F0F0;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #0066CC;
  color: white;
}

td {
	padding: 3px;
	 text-align:center; 
	 valign:middle;'
}

.td1 {
	width: 150px;
	word-break: break-all;
	margin: 5px;
	font-weight: "bold";
}
</style>
</head>
<body>
	
		<jsp:include page="/fragment/BMnav.jsp"></jsp:include> 
	
	<div align="center" style="margin-top: 30px;">
			<h2>所有文章</h2>
<%-- 			<a href="<c:url value='/dashboard ' />">回首頁</a> --%>
	</div>
	<hr>
<!-- 	<div class="card-body"> -->
	<div align="center" class="table-responsive pt-3">
		<table id="customers">
			<tr>
				<th style="vertical-align: inherit;">PK</th>
				<th style="vertical-align: inherit;">文章編號</th>
				<th>發文者</th>
				<th>上傳日期</th>
				<th>文章狀態</th>
				<th>類型</th>
				<th>標題</th>
				<th>圖片</th>
				<th>內文</th>
				<th>維護</th>
			</tr>
			<c:forEach var="all" items="${getAllMtList}">
				<tr>
					<td>&nbsp;${all.pkey} &nbsp;</td>
					<td>
<%-- 						<a href="<c:url value='/getSingleArticle/${all.articleId}'/>" > --%>
						<c:if test="${ all.status == 0}" ><a href='' ></a></c:if>${all.articleId}
<!-- 						</a>  -->
						</td>
					<td>${all.memberId}</td>
					<td width="10px" height="20px">${all.updateDate}</td>
					<c:if test="${ all.status == 1}"><td><label class="badge badge-success">可瀏覽</label></td></c:if>
					<c:if test="${ all.status == 0}"><td><label class=" badge badge-danger">已下架</label></td></c:if>
					<td>${all.category}</td>
					<td class="td1">${all.title}</td>
					<td class="td1"><div id="Demo" class="demo"><img style="width:160px;height:90px" src="<c:url value='/getMtCreate/${all.articleId}' />" /></div>${all.imgName}</td>
					<td class="td1">${all.article}</td>
					<td>
						<div align="center">
<%--  							<a href="${pageContext.request.contextPath}/getAllMtAdd/Del/${all.pkey}">從DB刪除</a> --%>
							<a class='delSingle' href="${pageContext.request.contextPath}/delSingleArticle/${all.articleId}">
							<c:if test="${ all.status == 0}" ><a href='' ></a></c:if>刪除</a>
<%-- 							<a href="${pageContext.request.contextPath}/modifyArticle/${all.pkey}"> 	//Admin不可編輯--%>
<%-- 							<c:if test="${ all.status == 0}" ><a href='' ></a></c:if>編輯資料</a> --%>
						</div>
					</td>
				</tr>
			</c:forEach>
		</table>
		<hr>
		<a href="<c:url value="" />">-----TOP-----</a><br><br>
<%-- 		<a href="<c:url value='/' />">回首頁</a><br><br> --%>
	</div>
<!-- 	</div> -->
	<jsp:include page="/fragment/BMfoot.jsp"></jsp:include>
</body>
</html>