<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8">
<title>發文紀錄</title>
<script src="https://www.google.com/recaptcha/api.js"></script>

</head>
<body>
	<nav>
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<div id="page" class="container" align="center">

		<div>
			<form method="GET" >
				<fieldset>
					<div align="center" style="margin-top: 50px;">
						<strong><h2>會員發文紀錄</h2></strong>

						<hr>
						<div>
							<label class="t1" for="memberId">會員帳號:</label> 
							<input type="text" id="memberId" name="memberId" size="30">
						</div>
						<br>
						<div align="center">
							<input type="button" onclick="memId()" value="SUBMIT" />
							<input class="sub" type="submit" name="submit" id="submit" value="送出" /> &nbsp;&nbsp;
							<input class="sub" type="reset" name="cancel" id="cancel" value="清除" />&nbsp;&nbsp;
							<input type="button" onclick="history.back()" value="回前頁" />
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
<script>
function memId() { 
	var memIdObj = document.getElementById("memberId");		//抓submit鍵的ID值 (memberId)後跳轉至/getMemArticleList/{memberId}
	memIdVal = memIdObj.value;
	console.log(memIdVal);
	window.location.href="<c:url value='/getMemArticleList/" + memIdVal + "' />";	
};


</script>
</body>
</html>