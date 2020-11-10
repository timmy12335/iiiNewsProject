<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html class='no-js' lang='en'>
<head>
<meta charset='utf-8'>
<meta content='IE=edge,chrome=1' http-equiv='X-UA-Compatible'>
<title>Sign in</title>
<meta content='lab2023' name='author'>
<meta content='' name='description'>
<meta content='' name='keywords'>
<link
	href="${pageContext.request.contextPath}/assets/stylesheets/application-a07755f5.css"
	rel="stylesheet" type="text/css" />
<link
	href="//netdna.bootstrapcdn.com/font-awesome/3.2.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/assets/images/favicon.ico"
	rel="icon" type="image/ico" />
<script>
window.onload=function(){
	document.getElementById("signin").onclick=function() {
		var account = document.getElementById("account").value;
		var password = document.getElementById("password").value;

		if (account == "Admin" && password == "Admin!23") {
			window.location.href = "<c:url value='/dashboard'/>";
		} else if (account == "" || password == "") {
			document.getElementById("errormsg").innerHTML = "<font color='red'>帳號密碼不可為空白</font>";
		} else {
			document.getElementById("errormsg").innerHTML = "<font color='red'>帳號或密碼輸入錯誤!<br>請重新輸入</font>";
		}

	};
	
	document.getElementById("onein").onclick=function(){
		var account = document.getElementById("account");
		var password = document.getElementById("password");
		account.value = "Admin";
		password.value ="Admin!23";
		
		
	}
}

</script>


</head>
<body class='login'>

	<div class='wrapper'>
		<div class='row'>
			<div class='col-lg-12'>
				<div class='brand text-center'>
					<h1>
						<div class='logo-icon'>
							<i class='icon-beer'></i>
						</div>
						iiiNews後台
					</h1>
				</div>
			</div>
		</div>
		<div class='row'>
			<div class='col-lg-12'>

					<fieldset class='text-center'>
						<legend>iiiNew後台系統登入</legend>
						<div class='form-group'>
							<input class='form-control' name="account" id="account"
								placeholder='請輸入管理員帳號...' type='text'>
						</div>
						<div class='form-group'>
							<input class='form-control' id="password" name="password" placeholder='請輸入密碼...'
								type='password'> 
						</div>
						<span id="errormsg"></span>
						<div class='text-center'>
<!-- 							                <div class='checkbox'> -->
<!-- 							                  <label> -->
<!-- 							                    <input type='checkbox' id="isUseCookie"> -->
<!-- 							                    	記住我 -->
<!-- 							                  </label> -->
						<button  id="signin" class="btn btn-default">Sign in</button>
						<button  id="onein" class="btn btn-default">Auto Input</button>
						<br> <a href="<c:url value='/'/>">回iiiNews首頁</a>
			</div>
			</fieldset>
			</div>
		</div>
	</div>
	
	<!-- Footer -->
	<!-- Javascripts -->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"
		type="text/javascript"></script>
	<script
		src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"
		type="text/javascript"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/modernizr/2.6.2/modernizr.min.js"
		type="text/javascript"></script>
	<script src="assets/javascripts/application-985b892b.js"
		type="text/javascript"></script>
	<!-- Google Analytics -->
	<script>
		var _gaq = [ [ '_setAccount', 'UA-XXXXX-X' ], [ '_trackPageview' ] ];
		(function(d, t) {
			var g = d.createElement(t), s = d.getElementsByTagName(t)[0];
			g.src = ('https:' == location.protocol ? '//ssl' : '//www')
					+ '.google-analytics.com/ga.js';
			s.parentNode.insertBefore(g, s)
		}(document, 'script'));
	</script>
</body>
</html>
