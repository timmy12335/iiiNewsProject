<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8">
<title>紀錄查詢</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="/fragment/BMnav.jsp"></jsp:include>
	
	<div id="page" class="container" align="center">

		<div>
			<form method="GET" >
				<fieldset>
					<div align="center" style="margin-top: 30px;">
						<strong><h2>會員紀錄查詢</h2></strong>
</div>
						<hr>
						<div class="row w-50">
							<label class="col-sm-20 col-form-label" style="font-size:22px;" for="memberId">請輸入會員帳號:</label> 
							<div class="col-sm-6 ">
							<input class="form-control" type="text" id="memberId" name="memberId" size="30">
						</div></div>
						<br>
						<div align="center">
							<input class="btn btn-primary btn-sm" type="button" onclick="memId()" value="Submit" />
<!-- 							<input class="sub" type="submit" name="submit" id="submit" value="送出" /> &nbsp;&nbsp; -->
							<input class="btn btn-secondary btn-sm" type="reset" name="cancel" id="cancel" value="Clear" />&nbsp;&nbsp;
<!-- 							<input type="button" onclick="history.back()" value="取消查詢" /> -->
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
	window.location.href="<c:url value='/getAllMemArticle/" + memIdVal + "' />";	
};


</script>
<jsp:include page="/fragment/BMfoot.jsp"></jsp:include>
</body>
</html>