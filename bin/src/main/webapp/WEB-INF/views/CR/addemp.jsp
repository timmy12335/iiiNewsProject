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



</head>
<body>

<jsp:include page="/fragment/BMnav.jsp"></jsp:include>

	<h4 class="card-title">客服人員新增</h4>
		<form:form method="POST" modelAttribute="cremployee" id="forms"
				enctype="multipart/form-data">
			<tr><td>客服人員名稱:</td>
			<td>
				<form:input type="text" path="empName" id="empName" ></form:input>
			</td></tr>
			<tr><td>
				客服人員帳號:</td>
				<td>
				<form:input type="text" path="empId" id="empId" ></form:input>
			</td></tr>		
			<tr><td>
				客服人員電子信箱:</td><td>
				<form:input type="text" path="empemail" id="empemail" ></form:input>
				</td>
			</tr>
			<tr><td>
			<div>
			<input type="reset" class="btn btn-inverse-dark btn-fw">
			<input type="submit" class="btn btn-inverse-dark btn-fw">
			<input type="button" id="cancel" onclick="history.back();" value="回前頁">
			
			</div>
			</td></tr>
		</form:form>
	
<jsp:include page="/fragment/BMfoot.jsp"></jsp:include> 

</body>
</html>