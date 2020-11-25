<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/base/vendor.bundle.base.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<!-- <link rel="stylesheet" -->
<!-- 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" -->
<!-- 	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" -->
<!-- 	crossorigin="anonymous"> -->
<!-- <script> -->

<!-- </script> -->
<title>會員登入</title>
<script>
	window.onload = function() {
		var btn = document.getElementById("clickme1");
		btn.onclick = function() {
			AA = document.getElementById("userId")
			AA.value = "code101"
			AAA = document.getElementById("password")
			AAA.value = "12345"
// 			AAAA = document.getElementById("okpassword")
// 			AAAA.value = "mimi0127"
// 			AAAAA = document.getElementById("name")
// 			AAAAA.value = "小蝸"
// 			AAAAAA = document.getElementById("email")
// 			AAAAAA.value = "miche831224@icloud.com"
// 			AAAAAAA = document.getElementById("identityId")
// 			AAAAAAA.value = "U121799920"
// 			AAAAAAAA = document.getElementById("phone")
// 			AAAAAAAA.value = "0976262860"

			// 		submitUserForm = document.getElementById("grecaptcha")
			// 		submitUserForm.value = true;
		}
	}
</script>
<style>
::-webkit-input-placeholder {
	color: #FFA042;
}

:-moz-placeholder {
	color: #FFA042;
}

::-moz-placeholder {
	color: #FFA042;
}

:-ms-input-placeholder {
	color: #FFA042;
}

.test {
	border: 0;
	background-color: #BC214C;
	color: #fff;
	border-radius: 10px;
	cursor: pointer;
}

input:hover {
	color: #003C9D;
	background-color: #C7C7E2;
	border: 2px #003C9D solid;
}

table {
	margin-left: auto;
	margin-right: auto;
}

g-recaptcha {
	
}
</style>
</head>
<body>
	<nav class="nav fixed-top">
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<section style="margin-top: 100px;" align="center">
		<!-- 		<div id="page" class="container"></div> -->
		<form:form id="regform" modelAttribute="LoginBean"
			class="forms-sample" onsubmit="return submitUserForm();">
			<div class="row justify-content-md-center">
				<div class="col-md-3 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<h2 align="center">一般登入</h2>
							<p class="card-description">Login</p>
							<div class="form-group" align="left">
								<label for="userId">登入帳號：</label>
								<form:input type="text" path="userId" class="form-control"
									id='userId' placeholder="輸入帳號" />
								<form:errors style="color:red;font-size:12px"
									path="invalidCredentials"></form:errors>
							</div>
							<div class="form-group" align="left">
								<label for="password">登入密碼：</label>
								<form:input type="password" path="password" class="form-control"
									id='password' placeholder="輸入密碼" />
							</div>
							<div class="form-group" align="left">
								<label align="center" colspan='2'></label>
								<form:checkbox path="rememberMe" />
								<span>記住密碼</span>
							</div>
							<div class="form-group" align="left">
								<label colspan='5' id="grecaptcha" class="g-recaptcha"
									data-sitekey="6LcXZ7IZAAAAAAkcEb54s18XQh2cq-DzVhCd-LxB"></label>
							</div>
							<div class="form-group" align="left">
								<label colspan='2' id="g-recaptcha-error"></label>
							</div>
							<div class="form-group" align="center">
								<label colspan="2" style="text-align: center;"></label><input
									type="submit" name="submit" value="登入"
									class="btn btn-primary btn-icon-text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="<c:url value='/UserMB' />" class="btn btn-info">註冊</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
									href="<c:url value='/forgetpwd' />">忘記密碼?</a>
							</div>
							<div class="form-group">
								<input type='button' class='form-control' id='clickme1' value='Demo'>
								<span>&nbsp;&nbsp;</span>
							</div>
							<button type="button"
								class="btn btn-social-icon btn-facebook btn-rounded">
								<i class="ti-facebook"></i>
							</button>
							<button type="button"
								class="btn btn-social-icon btn-google btn-rounded">
								<i class="ti-google"></i>
							</button>
							<button type="button"
								class="btn btn-social-icon btn-twitter btn-rounded">
								<i class="ti-twitter-alt"></i>
							</button>
<!-- 							<button type="button" -->
<!-- 								class="btn btn-social-icon btn-youtube btn-rounded"> -->
<!-- 								<i class="ti-youtube"></i> -->
<!-- 							</button> -->
						</div>
					</div>
				</div>
			</div>
		</form:form>
	</section>
	<script src="https://www.google.com/recaptcha/api.js"></script>
	<script>
		function submitUserForm() {
			var response = grecaptcha.getResponse();
			if (response.length == 0) {
				document.getElementById('g-recaptcha-error').innerHTML = '<span style="color:red;">*請點選我不是機器人</span>';
				return false;
			}
			return true;
		}
		function verifyCaptcha() {
			document.getElementById('g-recaptcha-error').innerHTML = '';
		}
	</script>
</body>
</html>


