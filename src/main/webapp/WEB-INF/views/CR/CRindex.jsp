<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>客服社群功能列表</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link href="${pageContext.request.contextPath}/css/CRindex.css" rel="stylesheet" type="text/css" />
</head>
<body>
<nav><jsp:include page="/fragment/navbar.jsp"></jsp:include> </nav>
<section style="margin-top: 100px;">
<div class="container">
	<a href="<c:url value='/addReport' />">
	<div class="card">
	<span></span>
	<div class='imgBx'>
	<img src="<c:url value='/image/CR4.png'/>"></div>
	<div class="content">
	<div>
	<h2>申請客服表單</h2>
	
	謝謝您iiiNews網站，請填寫您的需求或問題，我們會儘快提供相關訊息及回應。
		另若對網站有相關建議及意見，也歡迎填寫表單告知我們需改進的目標及方向。
		
	</div>
	</div>
	</div>
	</a>
	<a href="<c:url value='/success' />">
	<div class="card">
	<span></span>
	<div class='imgBx'><img src="<c:url value='/image/CR1.jpg'/>"></div>
	<div class="content">
	<div>
	<h2>客服表單查詢</h2>
	<p>查詢個人已申請的表單。<p>	
	</div>
	</div>
	</div>
	</a>
<%-- 	<a href="<c:url value='/msg' />"> --%>
<!-- 	<div class="card"> -->
<!-- 	<span></span> -->
<%-- 	<div class='imgBx'><img src="<c:url value='/image/CR5.jpg'/>"></div> --%>
<!-- 	<div class="content"> -->
<!-- 	<div> -->
<!-- 	<h2></h2> -->
<!-- 	<p><p>	 -->
<!-- 	</div> -->
<!-- 	</div> -->
<!-- 	</div> -->
<!-- </a> -->
</div>
</section>


<script>
$(document).ready(function(){
	$('.card').on('mouseenter', function(e){
		x = e.pageX -$(this).offset().left,
		y=e.pageY -$(this).offset().top,
		$(this).find('span').css({top:y, left:x})
	})
	$('.card').on('mouseout', function(e){
		x = e.pageX -$(this).offset().left,
		y=e.pageY -$(this).offset().top,
		$(this).find('span').css({top:y, left:x})
	})	
})
</script>
</body>
</html>