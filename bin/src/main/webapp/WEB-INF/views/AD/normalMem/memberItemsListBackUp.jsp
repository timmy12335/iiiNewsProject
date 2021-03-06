<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員訂單的商品列表</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
	<script>
	function status(num){
		console.log(num);
		let status = document.getElementById("statusTd");
		if(num == 0){
			status.innerHTML = "未付款";
		}else if(num == 1){
			status.innerHTML = "已付款";
		}else{
			status.innerHTML = "狀態異常";
		}
	}
	</script>
<style>
/*在此設定margin 以防止被navbar壓到*/
.iiinewsContainer {
	margin-top: 100px;
	margin-bottom: 100px;
	position: relative;
}

Html {
	margin-left: calc(100vw - 100%);
}
</style>
</head>
<body onload="status(${orderInfo.paymentStatus})">
	<nav class="navbar fixed-top">
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>

	<div class="iiinewsContainer">
		<div class="container">
			<div class="col-3">
			
			
			</div>
			<div class="col-9">
			
			
			</div>
			
			

	<div align="center">
		<h2>會員訂單的商品列表</h2>
		<a href="<c:url value='/' />">回首頁</a>
	</div>
	<span>${msgMap.addStatus}</span>
	<hr>
	<div>
		<table class="table">
		<thead class='thead-light text-center'>
		<tr align="right"><td colspan="9" align="right" id="statusTd">狀態：${orderInfo.paymentStatus}</td></tr>
			<tr>
				<td>item PK</td>
				<td>廣告編號</td>
				<td>賣家</td>
				<td>廣告日期</td>
				<td>欄位分類</td>
				<td>寬</td>
				<td>高</td>
				<td>單價</td>
				<td>設定</td>
			</tr>
		</thead>
			<c:forEach var="items" items="${AdOrderItems}">
				<tr>
					<td>${items.itemPk}</td>
					<td>${items.adNo}</td>
					<td>${items.sellerMemberId}</td>
					<td>${items.adDate}</td>
					<td>${items.categoryNo}</td>
					<td>${items.width}</td>
					<td>${items.height}</td>
					<td>${items.unitPrice}</td>
					<td>
						<a href="<c:url value="/getOneItem/${items.itemPk}" />" onclick="return confirm('Are you sure?')">檢視詳細內容</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<!-- container -->
	</div>
</div>
</body>
</html>