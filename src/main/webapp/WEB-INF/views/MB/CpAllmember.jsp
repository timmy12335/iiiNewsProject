<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有企業會員表單</title>
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/base/vendor.bundle.base.css">
<!-- endinject -->
<!-- plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<!-- endinject -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/images/favicon.png" />
<style>
.box {
	width: 60px;
	padding: 10px;
}

.ellipsis {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	white-space: normal;
}
</style>
<script type="text/javascript">

		</script>

</head>
<body>

	<%-- 		<jsp:include page="/fragment/navbar.jsp"></jsp:include> --%>
	<jsp:include page="/fragment/BMnav.jsp"></jsp:include>


	<h4 class="font-weight-bold mb-0">顯示所有企業會員表單</h4>
	<div id="resultmsg"></div>
	<table class="table">
		<thead>
			<tr>
				<th width='60'>會員編號</th>
				<th>會員帳號</th>
				<th>會員密碼</th>
				<th width='60px;'>公司電話</th>
				<th width='60px;'>創立日期</th>
				<th>統一編號</th>
				<th width='70px;'>公司行號</th>
				<th>公司地址</th>
				<th width='60px;'>公司信箱</th>
			</tr>
		</thead>
		<c:choose>
			<c:when test="${empty cpmembers}">
				<tr>
					<td colspan='8' align='center'><font color='red'>無會員資料</font></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var='cpmb' items='${cpmembers}' varStatus='report'>
					<tr>
						<td align='center'>${cpmb.pkey}</td>
						<td align='left'>${cpmb.cpmemberId}</td>
						<td align='left'>&nbsp;${cpmb.password2}</td>
						<td align='left'>&nbsp;${cpmb.cptel}</td>
						<td align='left'>&nbsp;${cpmb.founddate}</td>
						<td align='left'>&nbsp;${cpmb.uniformnumbers}</td>
						<td align='left'>&nbsp;${cpmb.cpname}</td>
						<td align='left'>&nbsp;${cpmb.cpaddress}</td>
						<td align='left'>&nbsp;${cpmb.cpemail}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>

	<hr>
	<button onclick='history.back()' class="btn btn-primary">回前頁</button>
	<script>

	</script>
	<jsp:include page="/fragment/BMfoot.jsp"></jsp:include>
</body>
</html>