<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有會員訂單列表</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script type="text/javascript">
	function deleteCheck() {
		if (confirm("確定更新此項資料")) {
		} else {
			window.location.href = "#"
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
html{
	margin-left:calc(100vw - 100%);
	overflow-y: scroll;
}
.alert {
  padding: 20px;
  background-color: #f44336;
  color: white;
  width:100%;
  display:none;
}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
}
</style>
</head>
<body>
	<nav class="navbar fixed-top">
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<div class="iiinewsContainer">
		<div class="container">
		<div class="row bg-white shadow-sm rounded">
		
		<div class="alert" id="nopayalert">
		  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
		  <strong><i class="far fa-bell fa-lg"></i>&nbsp;&nbsp;Notice！提醒！&nbsp;&nbsp;</strong> 您尚有未付款的訂單，立即前往結帳！CHECKOUT NOW！
		</div>
		
			<div class="col-12 bg-info text-white p-4">
				<h2>會員${showmemberId}的訂單列表</h2>
			</div>
			<div class="table-responsive">
				<table class="table table-hover">
					<thead class='text-center' style="background-color:	#F0F0F0;">
						<tr>
							<td>訂單編號</td>
							<td>訂購日期</td>
							<td class='text-right'>訂單價格</td>
							<td class='text-center'>付款狀態</td>
							<td>設定</td>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty memberOrderList}">
								<tr>
									<td colspan='5' align="center">您無購物紀錄</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="ad" items="${memberOrderList}">
									<tr>
										<td class='text-center'>${ad.adOrderNo}</td>
										<c:set var="date" value="${fn:substring(ad.orderDate, 0, 16)}" />
										<td class='text-center'>${date}</td>
										<td class='text-right'>NT$ ${ad.totalAmount}</td>
										<td class='text-center'>
											<c:if test="${ad.paymentStatus == 0}">
												<span class="text-danger">未付款&nbsp;<i class="fas fa-exclamation-circle"></i></span>
												&nbsp;&nbsp;<a class="btn btn-danger" href="<c:url value="/checkoutOK.Pay/${ad.adOrderPk}" />">前往付款</a>
												<script>
												function nopayalert(){;
													console.log("alert")
													document.getElementById("nopayalert").style.display='block';
												}
												nopayalert();
												</script>
											</c:if>
											<c:if test="${ad.paymentStatus == 1}">
												<span class='text-success'>已付款&nbsp;<i class='fas fa-check-circle'></i></span>
											</c:if>
											<c:if test="${ad.paymentStatus == 2}">
												<span class="text-secondary">已取消&nbsp;<i class="fas fa-exclamation-triangle"></i></span>
											</c:if>
										</td>
										<td class='text-center'><a class="btn btn-info" href="<c:url value="/getItemByOrderPk/${ad.adOrderPk}" />">檢視訂單 / 上傳圖片</a>
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
		<!-- container -->
		</div>
	<!-- iiinewsContainer -->
	</div>

</body>
</html>