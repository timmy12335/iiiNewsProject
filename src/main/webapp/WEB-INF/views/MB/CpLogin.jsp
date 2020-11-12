<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <script> -->

<!-- </script> -->
<title>會員登入</title>
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
	background-color: #7E3D76;
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
	<nav>
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<section style="margin-top: 100px;" align="center">
		<div id="page" class="container"></div>
		<form:form id="regform" onsubmit="return checkinput()"
			modelAttribute="CpLoginBean">
			<table align="center">
				<h2 align="center">會員登入</h2>
				<tr>
					<td>登入帳號：</td>
					<td><form:input type="text" path="userId" required="true"
							id='cpmemberId' placeholder="輸入帳號" /></td>
				</tr>
				<tr>
					<td>登入密碼：</td>
					<td><form:input type="password" path="password"
							required="true" id='password' placeholder="輸入密碼" /></td>
				</tr>
				<tr>
					<td align="center" colspan='2'><form:checkbox
							path="rememberMe" /><span class="text-muted">記住密碼</span></td>
				</tr>
				<tr>
					<td colspan='5' id="grecaptcha" class="g-recaptcha"
						data-sitekey="6LcXZ7IZAAAAAAkcEb54s18XQh2cq-DzVhCd-LxB"></td>
				</tr>
				<tr>
					<td colspan='2' id="g-recaptcha-error"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><input
						type="submit" name="submit" value="登入" class="test"> <a
						href="/UserMB">註冊</a></td>
				</tr>
			</table>
		</form:form>
	</section>
	<script src="https://www.google.com/recaptcha/api.js"></script>
	<script>
		function submitUserForm() {
			var response = grecaptcha.getResponse();
			if (response.length == 0) {
				document.getElementById('g-recaptcha-error').innerHTML = '<span style="color:red;">請點選我不是機器人</span>';
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


