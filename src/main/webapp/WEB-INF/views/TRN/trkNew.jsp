<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Product</title>
</head>
<body> 
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h2>產品資料</h2>
			</div>
		</div>
	</section>
	<section class="container">
		<div class="row">
		<img width='100' height='200'
							src="<c:url value='/getPictureTK/${trkNew.trackId}' />" /> 
			<div class="col-md-5">
				<h3>${trkNew.title}</h3>
				<p>建立人: ${trkNew.founder}</p>
				<p>建立時間: ${trkNew.fondtime}</p>
				<p>追蹤人數: ${trkNew.trcnum}</p>
				<p>內容: ${trkNew.descript}</p>
				<p>發生地點: ${trkNew.ocplace}</p>
				<p>發生時間: ${trkNew.octime}</p>
				<p>點閱人數: ${trkNew.clicnum}</p>
				
			<%-- 	<c:choose>
					<c:when test='${product.discount != 1.0 }'>
						<p>
							折扣: ${product.discountStr} &nbsp;&nbsp; 
							實售: <font color='red'>${product.price*product.discount}元</font>
						</p>
					</c:when>
					<c:otherwise>
						<p>&nbsp;</p>
					</c:otherwise>
				</c:choose> --%>
			<%-- 	<p>書商: ${product.companyBean.name}</p> --%>
				<p>新聞分類: ${trkNew.type}</p>
				<p>
					<strong>追蹤編號: </strong> <span class='label label-warning'>
						${trkNew.trackId} </span>
				</p>
				<p>
					<a href="<spring:url value='/trkNews' />" class="btn btn-default">
						<span class="glyphicon-hand-left glyphicon"></span>返回
					</a> 
					<a href="<spring:url value='/editNews/${trkNew.trackId}'/>"class='btn btn-warning btn-large'> 
					   <!-- 跳轉網頁連結 -->
					    <span class='glyphicon-shopping-cart glyphicon'></span>修改追蹤新聞
					</a>
				</p>
			</div>
		</div>
	</section>
</body>
</html>
