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
		<!-- 		<div class="container" style="margin-top: 30px"> -->
		<div class="well" align="center"
			style="margin-left: 10%; margin-right: 10%">
			<!-- 				<div class="row" style="margin-top: 35px"> -->
			<table class="table table-striped">
				<caption>用戶列表</caption>
				<tr id="container">
					<th>帳號:</th>
					<td>${cpmb.cpmemberId}</td>
				</tr>
				<tr id="container">
					<th>密碼:</th>
					<td>${cpmb.password2}</td>
				</tr>
				<tr id="container">
					<th>公司行號:</th>
					<td>${cpmb.cpname}</td>
				</tr>
				<tr id="container">
					<th>統一編號:</th>
					<td>${cpmb.uniformnumbers}</td>
				</tr>
				<tr id="container">
					<th>公司信箱:</th>
					<td>${cpmb.cpemail}</td>
				</tr>
				<tr id="container">
					<th>公司電話:</th>
					<td>${cpmb.cptel}</td>
				</tr>
				<tr id="container">
					<th>公司地址:</th>
					<td>${cpmb.cpaddress}</td>
				</tr>
				<tr id="container">
					<th>創立日期:</th>
					<td>${cpmb.founddate}</td>
				</tr>
				<tr>
					<td colspan='4'><span style="color: red;">系統將於<span
							style="text-align: center;" style="color: red;" id='timer'>10</span>秒後，將為您跳轉至首頁。
					</span></td>
				</tr>

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
				<h1 style="color: red;">${cpmb.cpname}</h1>
				<h3>恭喜您完成註冊</h3>
				</tbody>
			</table>
		</div>
	</section>
</body>
</html>