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
		<form:form id="regform" modelAttribute="forgot"
			class="forms-sample">
			<div class="row justify-content-md-center">
				<div class="col-md-3 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<h2 align="center">忘記密碼</h2>
							<p class="card-description">forget</p>
							
							<div class="form-group" align="left">
								<label for="memberId">輸入帳號：</label>
								<input type="text" name="memberId" class="form-control"
									id='memberId' placeholder="輸入帳號" />
<%-- 								<form:errors style="color:red;font-size:12px" path="memberId"></form:errors> --%>
							</div>
							<div class="form-group" align="left">
								<label for="memberEmail">輸入信箱：</label>
								<form:input type="text" path="memberEmail" id='memberEmail'
									class="form-control" placeholder="輸入信箱" />
							</div>
<!-- 							<div class="form-group" align="left"> -->
<!-- 								<label for="phone">行動電話：</label> -->
<%-- 								<form:input type="text" id="phone" path="phone" --%>
<%-- <%-- 									placeholder="請務必填寫正確" class="form-control"></form:input> --%>
<%-- 								<input class="test" type="button" id="btnCheckphone" --%>
<%-- <!-- 									onclick="checkphone(this.id)" value="發送驗證碼"> --> --%>
<%-- <!-- 							</div> --> --%>
<!-- 							<div class="form-group" align="left"> -->
<!-- 								<label for="code">簡訊驗證碼：</label> <input -->
<!-- 									type="text" name="code" -->
<!-- 									id='code' class="form-control" /> -->
<!-- 							</div> -->
							<div class="form-group" align="center">
									<label colspan="3" style="text-align: center;"></label><input
										type="hidden" name="action" value="reg" class="form-control" />
									<input type="submit" value="送出" class="btn btn-primary btn-icon-text" />
								</div>
						</div>
					</div>
				</div>
			</div>
		</form:form>
	</section>
</body>
</html>