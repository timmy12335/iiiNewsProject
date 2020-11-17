<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
			var nopay = "<span class='text-danger'>未付款&nbsp;<i class='fas fa-exclamation-circle'></i></span>"
				nopay += "&nbsp;&nbsp;&nbsp;<a class='btn btn-danger' href='<c:url value='/checkoutOK.Pay/${AdOrderItems[0].adOrderBean.adOrderPk}' />'>前往付款</a>"
			status.innerHTML = nopay;
		}else if(num == 1){
			status.innerHTML = "<span class='text-success'>已付款&nbsp;<i class='fas fa-check-circle'></i></span>";
		}else{
			status.innerHTML = "其他狀態";
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

html {
	margin-left: calc(100vw - 100%);
	overflow-y: scroll;
}
</style>
</head>
<body onload="status(${orderInfo.paymentStatus})">
	<nav class="navbar fixed-top">
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>

	<div class="iiinewsContainer">
		<div class="container-fluid">
			<div class="row">
				<div class="col-3">
					<div class="card p-4">
						<h2>訂單詳細內容</h2>
						<p>訂單編號：${AdOrderItems[0].adOrderBean.adOrderNo}</p>
						<p>訂單成立時間：${fn:substring(AdOrderItems[0].adOrderBean.orderDate,0,19)}</p>
						<p>訂單狀態：<span id="statusTd"></span></p>
						<a onclick="history.back()" href="#">回個人訂單列表</a>
					</div>
				</div>
				<div class="col-9">
					<div class="card p-4">
						<h2>商品列表</h2>
						<div>
							<table class="table">
							<thead class='thead-light text-center'>
								<tr>
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
										<td>${items.adNo}</td>
										<td>${items.sellerMemberId}</td>
										<td>${items.adDate}</td>
										<td>${items.categoryNo}</td>
										<td>${items.width}</td>
										<td>${items.height}</td>
										<td>${items.unitPrice}</td>
										<td>
											<c:if test="${orderInfo.paymentStatus != 2}">
												<a href="<c:url value="/getOneItem/${items.itemPk}" />" onclick="return confirm('Are you sure?')">前往上傳照片</a>
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
			

	<div align="center">
		
	</div>
	<span>${msgMap.addStatus}</span>
	<hr>
	
	<!-- container -->
	</div>
</div>
</body>
</html>