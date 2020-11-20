<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/fragment/BMnav.jsp"></jsp:include>

	<h4 class="card-title">公告內容新增</h4>
		<form:form method="POST" modelAttribute="board" id="forms"
				enctype="multipart/form-data">
			<tr><td>公告主題:</td>
			<td>
				<form:input type="text" path="bdTitle" id="bdTitle" ></form:input>
			</td></tr>
			<tr><td>
				公告類別:</td>
				<td align="center">
						<form:select path="bdCatagory" id="bdCatagory"
								class="was-validated" style="width: 400px">
								<option>帳號相關</option>
								<option>交易相關</option>
								<option>商品相關</option>
								<option>申請合作</option>
								<option>提議</option>
								<option>其他</option>
						</form:select></td>		
			<tr><td>
				公告內容:</td><td>
<%-- 				<form:textarea type="text" path="empemail" id="empemail" ></form:input> --%>
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