<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購物車清單</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
	crossorigin="anonymous"></script>
<script>
function confirmDelete(n) {
	if (confirm("確定移除此項商品 ? ") ) {
		console.log(n);
		location.href="DeleteFromCart/"+n
	} else {
	
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
</style>
</head>
<body>
	<nav class="navbar fixed-top">
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<div class="iiinewsContainer">
		<div class="container-fluid">
			<!--Grid row-->
			<div class="row">
				<!--Grid column-->
				<div class="col-lg-8">
					<!-- Card -->
					<div class="card wish-list mb-4">
						<div class="card-body">
							<h5 class="mb-4">
								<i class="fa fa-shopping-cart" aria-hidden="true"></i> 廣告欄位購物車
								<c:if test="${shoppingCart.content.size()> 0}">
									(<span> ${shoppingCart.content.size()}</span> 項商品)
								</c:if>
							</h5>
<%-- 							<h5 class="mb-4">本次使用者session: ${pageContext.session.id }</h5> --%>
							<hr>
							<c:choose>
								<c:when test="${empty shoppingCart.content}">
									<div>
										<div class="text-center">您的廣告購物車內無商品</div>
										<br>
										<button type="button"
											class="btn btn-outline-danger btn-block waves-effect waves-light"
											onclick='location.href="<c:url value='/getAjaxListSearch' />"'>前往購物</button>
									</div>
								</c:when>
								<c:otherwise>
									<c:forEach var="ad" items="${shoppingCart.content}">

										<div class="row mb-4">
											<div class="col-md-5 col-lg-3 col-xl-3 text-center">
												<div
													class="view zoom overlay z-depth-1 rounded mb-3 mb-md-0">
													<c:choose>
													<c:when test='${ad.value.categoryNo == 100 || ad.value.categoryNo == 200}' >
														<img class="img-fluid w-50" src="/iiiNews/img/ad_header.jpeg" alt="Sample">
													</c:when>
													<c:when test='${ad.value.categoryNo == 300 || ad.value.categoryNo == 400 || ad.value.categoryNo == 500}' >
														<img class="img-fluid w-50" src="/iiiNews/img/ad_article.jpeg" alt="Sample">
													</c:when>
													<c:otherwise>
														<img class="img-fluid w-50" src="/iiiNews/img/NoImage.jpg" alt="Sample">
													</c:otherwise>
													</c:choose>
												</div>
											</div>
											<div class="col-md-7 col-lg-9 col-xl-9">
												<div>
													<div class="d-flex justify-content-between">
														<div>
															<h5>商品代號： ${ad.value.adNo}</h5>
															<p class="mb-3 text-muted text-uppercase small">販售欄位：
																<c:choose>
																	<c:when test="${ad.value.categoryNo == 100}">A&nbsp;頭版頁首</c:when>
																	<c:when test="${ad.value.categoryNo == 200}">B&nbsp;頭版側標</c:when>
																	<c:when test="${ad.value.categoryNo == 300}">C&nbsp;內頁頁首</c:when>
																	<c:when test="${ad.value.categoryNo == 400}">D&nbsp;內頁側標</c:when>
																	<c:when test="${ad.value.categoryNo == 500}">E&nbsp;內文小廣告</c:when>
																	<c:otherwise>其他</c:otherwise>
																</c:choose>
															</p>
															<p class="mb-2 text-muted text-uppercase small">販售之上架日期：${ad.value.adDate}</p>
<%-- 															<p class="mb-3 text-muted text-uppercase small">賣家名稱 / 帳號：${ad.value.sellerMemberId}</p> --%>
															<p class="mb-3 text-muted text-uppercase small">賣家名稱 / 帳號：${ad.value.sellerMemberName}</p>
														</div>
														<div>
															<div
																class="def-number-input number-input safari_only mb-0 w-100">
																<!-- 													<button -->
																<!-- 														onclick="this.parentNode.querySelector('input[type=number]').stepDown()" -->
																<!-- 														class="minus"></button> -->
																<input class="quantity" min="0" name="quantity"
																	value="1" type="hidden">
																<!-- 													<button -->
																<!-- 														onclick="this.parentNode.querySelector('input[type=number]').stepUp()" -->
																<!-- 														class="plus"></button> -->
															</div>
														</div>
													</div>
													<div
														class="d-flex justify-content-between align-items-center">
														<div>
<!-- 															<a href="#!" type="button" -->
<!-- 																class="card-link-secondary small text-uppercase mr-3"> -->
<!-- 																<i class="fas fa-trash-alt mr-1"></i> Remove item  </a>-->
															<a href="#" type="button"
																onclick="confirmDelete(${ad.value.adPk})"
																class="card-link-secondary small text-uppercase mr-3">
																<i class="fas fa-trash-alt mr-1"></i> 移除商品
															</a> <a href="#!" type="button"
																class="card-link-secondary small text-uppercase"><i
																class="fas fa-heart mr-1"></i> 加入最愛 </a>
														</div>
														<p class="mb-0 text-right">
															<c:if test="${!empty discount}">
																 <span class="text-danger"><del>原價&nbsp;NT$&nbsp;&nbsp;<fmt:formatNumber type="number" maxFractionDigits="0" value="${ad.value.unitPrice/discount}" /></del></span><br>
															</c:if>
															<span><strong>NT$&nbsp;&nbsp;<fmt:formatNumber type="number" maxFractionDigits="0" value="${ad.value.unitPrice}" /></strong></span>
														</p>
													</div>
												</div>
											</div>
										</div>
										<!--  -->
									</c:forEach>
								</c:otherwise>
							</c:choose>

							<hr>

						</div>
						<div class="col-4">
<%-- 							<div>${shoppingCart.content}</div> --%>
						</div>



					</div>
				</div>

				<!--Grid column-->
				<div class="col-lg-4">

					<!-- Card -->
					<div class="card mb-4">
						<div class="card-body">
						<div class="row">
							<div class="col-lg-8">
								<h5 class="mb-3">購買金額明細</h5>
							</div>
							
							<div class="col-lg-4 text-right">
								<i class="fas fa-cash-register fa-lg"></i>
							</div>
						</div>
							<ul class="list-group list-group-flush">
								<c:forEach var="ad" items="${shoppingCart.content}">
									<li
										class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
										${ad.value.adNo}
										<br>(&nbsp;
										<c:choose>
											<c:when test="${ad.value.categoryNo == 100}">頭版頭</c:when>
											<c:when test="${ad.value.categoryNo == 200}">頭版側標</c:when>
											<c:when test="${ad.value.categoryNo == 300}">內頁版頭</c:when>
											<c:when test="${ad.value.categoryNo == 400}">內頁側標</c:when>
											<c:when test="${ad.value.categoryNo == 500}">小廣告</c:when>
											<c:otherwise>其他</c:otherwise>
										</c:choose>
										/&nbsp;${ad.value.adDate} &nbsp;)
										 <span>$ ${ad.value.unitPrice}</span>
									</li>
								</c:forEach>
								<li
									class="list-group-item d-flex justify-content-between align-items-center px-0">
									合計數量 <span>${fn:length(shoppingCart.content)}</span>
								</li>
								<c:if test="${!empty discount}">
									<li
										class="list-group-item d-flex justify-content-between align-items-center px-0">
										原價 <span class="text-danger"><del><fmt:formatNumber type="number" maxFractionDigits="0" value="${shoppingCart.total/discount}" /></del></span>
										折扣 <span class="text-danger"><fmt:formatNumber type="percent" maxIntegerDigits="3" value="${discount}" /></span>
									</li>
								</c:if>
								<li
									class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
									<div>
										<strong>總額</strong> <strong>
											<p class="mb-0">(NT$)</p>
										</strong>
									</div> <span><strong><fmt:formatNumber type="number" maxFractionDigits="0" value="${shoppingCart.total}" />&nbsp;元</strong></span>
								</li>
							</ul>
							
							<button type="button"
								class="btn btn-outline-danger btn-block waves-effect waves-light"
								onclick='location.href="<c:url value='/removeShoppingCart.returnCartPage' />"'>
								清空購物車&nbsp;&nbsp;&nbsp;<i class="fa fa-frown-o" aria-hidden="true"></i></button>

							<button type="button"
								class="btn btn-outline-info btn-block waves-effect waves-light"
								onclick='location.href="<c:url value='/getAjaxListSearch' />"'>
								繼續購物&nbsp;&nbsp;&nbsp;<i class="fa fa-cart-plus" aria-hidden="true"></i></button>

							<button type="button"
								class="btn btn-primary btn-block waves-effect waves-light"
								onclick="checkoutfunction(${fn:length(shoppingCart.content)},'${showmemberId}')">
								送出訂單&nbsp;&nbsp;&nbsp;<i class="fa fa-paper-plane" aria-hidden="true"></i></button>


						</div>
					</div>
					<!-- Card -->

					<!-- Card -->
					<div class="card mb-4">
						<div class="card-body">
							<a class="dark-grey-text d-flex justify-content-between"
								data-toggle="collapse" href="#collapseExample"
								aria-expanded="false" aria-controls="collapseExample"> 加入折扣代碼 (optional)<span class="text-danger">${FlashMSG_discountFail}</span>
								<span><i class="fas fa-chevron-down pt-1"></i></span>
							</a>

							<div class="collapse" id="collapseExample">
								<div class="mt-3">
									<div class="md-form md-outline mb-0">
										<input type="text" id="discountStr" name="discountStr"
											class="form-control font-weight-light"
											placeholder="Enter discount code">
									</div>
									<div class="mt-2">
										<button onclick="godiscount()" class="btn btn-primary btn-block waves-effect waves-light">享受折扣&nbsp;&nbsp;&nbsp;<i class="fas fa-tags"></i></button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Card -->




				</div>
			</div>
		</div>
	</div>
	<script>
		function checkoutfunction(count,loginmember){
			if (confirm("確定前往結帳 ") ) {
				if(count == 0){
					alert("您的購物車中無商品");
					return;
				}else{
					if(loginmember==""){
						alert("您尚未登入");
						location.href="<c:url value='/Login' />"
					}else{
						location.href="<c:url value='/checkoutOK.insert' />"
					}
				}
			} else {
			
			}
		}
		
		function godiscount(){
			var text = document.getElementById("discountStr").value;
			location.href="/iiiNews/getDiscount/?discountStr="+text;
		}
</script>



</body>
</html>