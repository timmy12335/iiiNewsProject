<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有廣告列表</title>
<script type="text/javascript">
	function deleteCheck(){
		if(confirm("確定更新此項資料")){
		}else{
			window.location.href="#"
		}
	}
</script>
</head>
<body>
<nav>
<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
</nav>

	<div align="center" style="margin-top:100px;">
		<h2>會員XXX的所有廣告列表</h2>
		<a href="<c:url value='/' />">回首頁</a>
	</div>
	<span>${msgMap.addStatus}</span>
	<hr>
	<div align="center">
		<table border="1">
			<tr>
				<td>產品編號</td>
				<td>上傳日期</td>
				<td>分類</td>
				<td>寬</td>
				<td>高</td>
				<td>日期</td>
				<td>單價</td>
				<td>庫存</td>
				<td>設定</td>
			</tr>
		<c:choose>
            <c:when test="${empty adLists}">
            	<tr>
            		<td colspan='8' align="center">您無上傳清單</td>
            	</tr>
            </c:when>
            <c:otherwise>
				<c:forEach var="ad" items="${adLists}">
					<tr>
						<td>${ad.adNo}</td>
						<td>${ad.uploadDate}</td>
						<td>${ad.categoryNo}</td>
						<td>${ad.width}</td>
						<td>${ad.height}</td>
						<td>${ad.adDate}</td>
						<td>${ad.price}</td>
						<td>${ad.stock}</td>
					<td>
						<a href="<c:url value="#" />">修改</a>
						<a href="<c:url value="/deleteAdProduct/${ad.adPk}" />" onclick="return confirm('Are you sure?')">刪除</a>
					</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
	</div>
</body>
</html>