<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/base/vendor.bundle.base.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<title>修改密碼</title>
</head>
<body>
	<nav class="nav fixed-top">
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<section style="margin-top: 100px;" align="center">
		<form:form id="regform" modelAttribute="changepwd"
			class="forms-sample">
			<div class="row justify-content-md-center">
				<div class="col-md-3 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<h2 align="center">修改密碼</h2>
							<p class="card-description">modify</p>
							<div class="form-group" align="left">
								<label for="password">輸入舊密碼：</label>
								<form:input type="password" path="password" id='password'
									class="form-control" />
							</div>
							<div class="form-group" align="left">
								<label for="memberNewPassword">輸入新密碼：</label>
								<form:input type="password" path="memberNewPassword"
									id='memberNewPassword' class="form-control" />
							</div>
							<div class="form-group" align="left">
								<label for="memberNewPassword1">新密碼確認：</label> <input
									type="password" name="memberNewPassword1"
									id='memberNewPassword1' class="form-control" />
							</div>
							<div class="form-group" align="center">
								<label colspan="3" style="text-align: center;"></label><input
									type="hidden" name="action" value="reg" class="form-control" />
								<input type="submit" value="確認修改"
									class="btn btn-primary btn-icon-text" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</form:form>
	</section>
</body>
</html>