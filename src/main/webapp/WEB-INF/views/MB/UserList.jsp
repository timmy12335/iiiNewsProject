<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<div class="container" style="margin-top: 30px">
		<div class="well" style="margin-left: 10%; margin-right: 10%">
			<div class="row" style="margin-top: 35px">
				<table class="table table-striped">
					<caption>用戶列表</caption>
					<thead>
						<tr>
							<th>生日</th>
							<th>身分證</th>
							<th>帳號</th>
							<th>電話</th>
							<th>郵箱</th>
							<th>密碼</th>
							<th>重復密碼</th>
							<th>名字</th>
							<th>性別</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td>${phone}</td>
							<td>${email}</td>
							<td>${password}</td>
							<td>${okpassword}</td>
							<td>${name}</td>
							<td>${sex}</td>
							<td>${memberId}</td>
							<td>${birthday}</td>
							<td>${identityId}</td>

						</tr>

					</tbody>
				</table>
</body>
</html>