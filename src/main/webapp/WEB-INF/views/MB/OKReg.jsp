<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>註冊成功</title>
</head>
<body bgcolor="#FFFFCE">
	<table width="600" border="0" align="center">
		<h3 align="center">恭喜您註冊完成</h3>
<!-- 		<nav> -->
<%-- 			<jsp:include page="/fragment/navbar.jsp"></jsp:include> --%>
<!-- 		</nav> -->
</body>
<script type='text/javascript'>
	setTimeout('countdown()', 1000);

	function countdown() {
		var s = document.getElementById('timer');
		s.innerHTML = s.innerHTML - 1;
		if (s.innerHTML == 0)
			window.location = 'http://localhost:8080/iiiNews/navbar.jsp'
		else
			setTimeout('countdown()', 1000);
	}
</script>
<div align="center">
	<span>系統將於<span style="text-align: center;" id='timer'>5</span>秒後，將為您自動跳轉。
	</span>
</div>
</html>