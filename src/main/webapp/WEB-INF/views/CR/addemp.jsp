<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台-客服人員新增</title>
<style>
span.error {
	color: red;
	display: inline-block;
	font-size: 5pt;
}
</style>
<script>



</script>
</head>
<body>

	<jsp:include page="/fragment/BMnav.jsp"></jsp:include>
<div>
	<h3 >客服人員新增</h3>
	</div>
	<form:form method="post" modelAttribute="cremployee" id="forms" class="form-sample" 
		enctype="multipart/form-data">
		<div class="form-group">
			<label>客服人員名稱:</label>
			<form:input type="text" path="empName" id="empName"  placeholder="請輸入員工名稱" class="form-control"></form:input>
			<form:errors path="empName" cssClass="error" />
		</div>
		<div class="form-group">
			<label>客服人員帳號:</label>
			<form:input type="text" path="empId" id="empId" placeholder="請輸入員工編號"  class="form-control"></form:input>
			<form:errors path="empId" cssClass="error" />
		</div>
		<div class="form-group">
			<label>客服人員電子信箱:</label>
			<form:input type="text" path="empemail" id="empemail" placeholder="請輸入員工信箱" class="form-control"></form:input>
			<form:errors path="empemail" cssClass="error" />
		</div>
		<div>
			<div>
				<input type="submit" class="btn btn-inverse-dark btn-fw">
				 <input
					type="reset" class="btn btn-inverse-dark btn-fw"> 
					<input
					type="button" id="cancel" onclick="history.back();"
					class="btn btn-inverse-dark btn-fw" value="回前頁">

			</div>
		</div>
	</form:form>

	<jsp:include page="/fragment/BMfoot.jsp"></jsp:include>

</body>
</html>