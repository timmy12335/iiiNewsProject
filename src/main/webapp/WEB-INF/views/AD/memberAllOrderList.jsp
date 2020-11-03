<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有會員訂單列表</title>
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
		<h2>會員XXX的所有訂單列表</h2>
		<a href="<c:url value='/' />">回首頁</a>
	</div>
	<span>${msgMap.addStatus}</span>
	<hr>
	<div align="center">
		<table border="1">
			<tr><td>訂單編號</td><td>訂購日期</td><td>訂單價格</td><td>設定</td></tr>
			<c:forEach var="ad" items="${memberOrderList}">
				<tr>
				<td>${ad.adOrderNo}</td><td>${ad.orderDate}</td><td>${ad.totalAmount}</td>
				<td>
					<a href="<c:url value="/getItemByOrderPk/${ad.adOrderPk}" />">檢視訂單內容</a>
<%-- 					<a href="<c:url value="/deleteAdProduct/${ad.adPk}" />" onclick="return confirm('Are you sure?')">刪除</a> --%>
				</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>