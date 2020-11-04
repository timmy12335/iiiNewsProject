<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>register</title>
<script src="js/jquery-1.10.2.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript">
	$().ready(function() {
		// 在鍵盤按下並釋放及提交後驗證提交表單
		$("#vForm").validate({

			rules : {
				phone : {
					required : true,
					isMobile : true
				},
				email : {
					required : true,
					email : true
				},

				password : {
					required : true,
					minlength : 5,
					maxlength : 12
				},
				repassword : {
					required : true,
					minlength : 5,
					maxlength : 12,
					equalTo : "#password"
				},
				name : {
					required : true,
					maxlength : 32
				},
			},

			messages : {
				phone : {
					required : "請輸入手機號<br/>",
					minlength : "請輸入11位的有效手機號碼<br/>"
				},
				email : {
					required : "請輸入郵箱<br/>",
					minlength : "請輸入正確的郵箱<br/>"
				},
				password : {
					required : "請輸入密碼<br/>",
					minlength : "密碼長度不能小於 5 個字母<br/>",
					maxlength : "密碼長度不能大於 12 個字母<br/>"
				},
				repassword : {
					required : "請再次輸入密碼<br/>",
					minlength : "密碼長度不能小於 5 個字母<br/>",
					maxlength : "密碼長度不能大於 12 個字母<br/>",
					equalTo : "兩次密碼輸入不一致<br/>"
				},
				name : {
					required : "請輸入用戶名<br/>",
					minlength : "用戶名長度不得大於32個字符<br/>"
				},
			}
		});
	});
</script>

<style>
.error {
	color: red;
}
</style>

</head>
<body>
	<nav> <jsp:include page="/fragment/navbar.jsp"></jsp:include> </nav>
	<section style="margin-top:100px;" align="center">
		<div class="container">     <!-- style="margin-top: 150px" -->
			<div class="well" >     <!-- style="margin-left: 30%; margin-right: 100%" -->
				<div class="row">   <!--  style="margin-top: 35px" -->
				<form class="form-horizontal" role="form" id="vForm" method="POST"
						action="addUser">
					
						<div class="form-group">
							<label for="memberId" class="col-sm-4 control-label">帳&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;號</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="memberId"
									name="memberId" placeholder="請輸入帳號">
							</div>
						</div>

						<div class="form-group">
							<label for="passowrd" class="col-sm-4 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;碼</label>
							<div class="col-sm-4">
								<input type="password" class="form-control" id="password"
									name="password" placeholder="請輸入密碼">
							</div>
						</div>
						
						<div class="form-group">
							<label for="okpassowrd" class="col-sm-4 control-label">確認密碼</label>
							<div class="col-sm-4">
								<input type="password" class="form-control" id="okpassowrd"
									name="okpassowrd" placeholder="請再次輸入密碼">
							</div>
						</div>
						
						<div class="form-group ">
							<label for="name" class="col-sm-4 control-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="name" name="name"
									placeholder="請輸入姓名">
							</div>
						</div>
						
						<div class="form-group">
							<label for="phone" class="col-sm-4 control-label">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;機</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="phone" name="phone"
									placeholder="請輸入手機號">
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="col-sm-4 control-label">信&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="email" name="email"
									placeholder="請輸入信箱">
							</div>
						</div>
	
						<div class="form-group">
							<label for="identityId" class="col-sm-4 control-label">身分證字號</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="identityId"
									name="identityId" placeholder="請輸入身分證字號">
							</div>
						</div>
						
						<div class="form-group">
							<label for="birthday" class="col-sm-4 control-label">生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</label>
							<div class="col-sm-4">
								<input type="date" class="form-control" id="birthday"
									name="birthday" placeholder="請輸入生日">
							</div>
						</div>

						<div class="form-group">
							<label for="sex" class="col-sm-4 control-label">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;別</label>
							<div>
								<label class="radio-inline"> &nbsp;&nbsp;&nbsp;<input
									type="radio" name="sex" id="boy" value="男" checked> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="sex" id="girl" value="女"> 女
								</label>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-4 col-sm-offset-3 control-label ">
								<button type="submit" class="btn btn-info">提交</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="Login.jsp"
									class="btn btn-info">登錄</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		</form>
	</section>
</body>
</html>