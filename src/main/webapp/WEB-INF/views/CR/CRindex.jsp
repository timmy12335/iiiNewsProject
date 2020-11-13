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
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
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
	<img src="<c:url value='/image/CR1.jpg'/>"></div>
	<div class="content">
	<div>
	<h2>申請客服表單</h2>
	
	謝謝您iiiNews網站，請填寫您的需求或問題，我們會儘快提供相關訊息及回應。
		另若對網站有相關建議及意見，也歡迎填寫表單告知我們需改進的目標及方向。
		
	</div>
	</div>
	</div>
	</a>
	<div class="card">
	<span></span>
	<div class='imgBx'><img src="<c:url value='/image/CR2.jpg'/>"></div>
	<div class="content">
	<div>
	<h2>關於我們</h2>
	<p>想要了解我們或是想要寄信請至此頁面。<p>	
	</div>
	</div>
	</div>
	<a href="<c:url value='/chat' />">
	<div class="card">
	<span></span>
	<div class='imgBx'><img src="<c:url value='/image/CR3.jpg'/>"></div>
	<div class="content">
	<div>
	<h2>聊天室Test</h2>
	<p>沒做出來就當混分的<p>	
	</div>
	</div>
	</div>
</a>
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