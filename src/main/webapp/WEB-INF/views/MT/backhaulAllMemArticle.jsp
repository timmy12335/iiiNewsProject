<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
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
<title>發文紀錄</title>

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


#customers tr:hover {background-color: #ECF5FF;}

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
}

.td1 {
	width: 150px;
	word-break: break-all;
	margin: 5px;
	font-weight: "bold";
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
</style>
</head>
<body>
	<jsp:include page="/fragment/BMnav.jsp"></jsp:include> 
	
	<div align="center" style="margin-top: 30px;">
		<h2>會員${memberId}的發文紀錄</h2>
<%-- 		<a href="<c:url value='/' />">回首頁</a> --%>
	</div>
	<hr>
	<c:choose>
			<c:when test="${empty AllMemArticle}">
			<tr>
				<td colspan="10"><div style="font-size:20px;color:red;text-align:center;">&nbsp;暫無發文紀錄&nbsp;</div></td>
			</tr>
			</c:when>
			<c:otherwise>
	<div align="center" class="table-responsive pt-3">
		<table id="customers">
			<tr>
				<th>PK</th>
				<th>文章編號</th>
				<th>發文者</th>
				<th>上傳日期</th>
				<th>文章狀態</th>
				<th>類型</th>
				<th>標題</th>
				<th>圖片</th>
				<th>內文</th>
				<th>維護</th>
			</tr>
<%-- 			<c:if test="${MBBean != null}"> --%>
			<c:forEach var="memList" items="${AllMemArticle}">
				<tr>
					<td>&nbsp;${memList.pkey} &nbsp;</td>
					<td>${memList.articleId}</td>
					<td>${memList.memberId}</td>
<%-- 					<td width="10px" height="20px">${memList.updateDate}</td> --%>
					<c:set var="date" value="${fn:substring(memList.updateDate, 0, 10)}" />
					<td>${date}</td>
					<c:if test="${ memList.status == 1}"><td><label class="badge badge-success">可瀏覽</label></td></c:if>
					<c:if test="${ memList.status == 0}"><td><label class="badge badge-danger">已下架</label></td></c:if>
					<td>${memList.category}</td>
					<td class="td1">${memList.title}</td>
					<td class="td1"><img style="width:160px;height:90px" src="<c:url value='/getMtCreate/${memList.articleId}' />" /></td>
					<td class="td1"><div class="ellipsis">${memList.article}</div></td>
					<td class="td1">
						<div align="center">
<%--  							<a href="${pageContext.request.contextPath}/getAllMtAdd/Del/${all.pkey}">從DB刪除</a> --%>
							<a class='delSingle' href="${pageContext.request.contextPath}/delAllMemArticle/${memList.articleId}">
							<c:if test="${ memList.status == 0}" ><a href='' ></a></c:if>刪除</a>
<%-- 							<a href="${pageContext.request.contextPath}/modifyArticle/${memList.pkey}">編輯資料</a> --%>
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
		<a class="btn btn-primary" href="<c:url value="" />">TOP</a><br><br>
<!-- 		<input type="button" onclick="history.back()" value="重新查詢" /> -->
<%-- 		<a href="<c:url value='/' />">回首頁</a><br><br> --%>
	</div>
	</c:otherwise>
		</c:choose>
		<jsp:include page="/fragment/BMfoot.jsp"></jsp:include>
</body>
</html>