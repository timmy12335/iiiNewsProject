<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用戶列表</title>
<style>
#container {
	margin: 20px;
	background-color: lightblue;
	width: 100%;
	max-width: 240px;
	font-family: Microsoft JhengHei;
	text-align: center;
	font-size: 20px;
}
</style>
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jqPaginator.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<nav>
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<section style="margin-top: 100px;" align="center">
		<div class="well" align="center"
			style="margin-left: 10%; margin-right: 10%">
			<table class="table table-striped">
				<caption>用戶列表</caption>
				<%-- 								<c:forEach var='mb' items='${user}' varStatus='loop'></c:forEach> --%>
				<tr id="container">
					<th>帳號:</th>
					<td>${mb.memberId}</td>
				</tr>
				<tr id="container">
					<th>名字:</th>
					<td>${mb.name}</td>
				</tr>
				<tr id="container">
					<th>密碼:</th>
					<td>${mb.password}</td>
				</tr>
				<tr id="container">
					<th>身分證:</th>
					<td>${mb.identityId}</td>
				</tr>
				<tr id="container">
					<th>郵箱:</th>
					<td>${mb.email}</td>
				</tr>
				<tr id="container">
					<th>電話:</th>
					<td>${mb.phone}</td>
				</tr>
				<tr id="container">
					<th>生日:</th>
					<td>${mb.birthday}</td>
				</tr>
				<tr>
					<td colspan='3'><span style="color: red;">系統將於<span
							style="text-align: center;" style="color: red;" id='timer'>10</span>秒後，將為您跳轉至首頁。
					</span></td>
				</tr>
				<%-- 				<td><a href="<c:url value='/getSingleMmeber/${mb.memberId}'/>"></a></td> --%>

				<script type='text/javascript'>
					setTimeout('countdown()', 1000);

					function countdown() {
						var s = document.getElementById('timer');
						s.innerHTML = s.innerHTML - 1;
						if (s.innerHTML == 0)
							window.location = 'http://localhost:8080/iiiNews/'
						else
							setTimeout('countdown()', 1000);
					}
				</script>
				<h1 style="color: red;">${mb.name}</h1>
				<h3>恭喜您完成註冊</h3>
				</tbody>
			</table>
		</div>
	</section>
</body>
</html>