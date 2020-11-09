<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用戶列表</title>
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
		<!-- 		<div class="container" style="margin-top: 30px"> -->
		<div class="well" align="center"
			style="margin-left: 10%; margin-right: 10%">
			<!-- 				<div class="row" style="margin-top: 35px"> -->
			<table class="table table-striped">
				<caption>用戶列表</caption>
				<thead>
					<tr>
						<th>帳號</th>
						<th>名字</th>
						<th>密碼</th>
						<th>身分證</th>
						<th>郵箱</th>
						<th>電話</th>
						<th>生日</th>
						<th>性別</th>
					</tr>
				</thead>
				<tbody>

					<tr>
						<td>${memberId}</td>
						<td>${name}</td>
						<td>${password}</td>
						<td>${identityId}</td>
						<td>${email}</td>
						<td>${phone}</td>
						<td>${birthday}</td>
						<td>${sex}</td>
					</tr>
					<h3>${requestScope.user.name}恭喜您完成註冊</h3>
				</tbody>
			</table>
		</div>
		</div>
		</div>
	</section>
</body>
</html>