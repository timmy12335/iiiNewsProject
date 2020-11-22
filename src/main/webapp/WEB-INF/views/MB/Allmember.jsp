<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有會員表單</title>
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


	<h4 class="font-weight-bold mb-0">顯示所有會員表單</h4>
	<div id="resultmsg"></div>
	<table class="table">
		<thead>
			<tr>
				<th width='60'>會員編號</th>
				<th>會員姓名</th>
				<th>會員帳號</th>
				<th>會員密碼</th>
				<th width='60px;'>會員電話</th>
				<th align='center'>會員信箱</th>
				<th width='60px;'>會員性別</th>
				<th>會員身分證</th>
				<th>會員生日</th>
			</tr>
		</thead>
		<c:choose>
			<c:when test="${empty Allmember}">
				<tr>
					<td colspan='8' align='center'><font color='red'>無會員資料</font></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var='mb' items='${Allmember}' varStatus='report'>
					<tr>
						<td align='left'>${mb.pkey}</td>
						<td align='left'>&nbsp;${mb.name}${mb.cpname}</td>
						<td align='center'>${mb.memberId}</td>
						<td align='left'>&nbsp;${mb.password}</td>
						<td align='left'>&nbsp;${mb.phone}</td>
						<td align='left'>&nbsp;${mb.email}</td>
						<td align='left'>&nbsp;${mb.sex}</td>
						<td align='left'>&nbsp;${mb.identityId}</td>
						<td align='left'>&nbsp;${mb.birthday}</td>
					</tr>
	
<%-- 						<td align='center' onclick="MBfolded(${report.index})" class="box" --%>
<!-- 							style="cursor: pointer"> -->
<%-- 							<p class="ellipsis">${ser.crContent}</p> --%>
<!-- 						</td> -->
<%-- 						<td align='center'><fmt:formatDate value="${ser.crApplyDate}" --%>
<%-- 								pattern="yyyy-MM-dd HH:mm" /></td> --%>
<%-- 						<td align='center' onclick="folded(${report.index})" class="box" --%>
<!-- 							style="cursor: pointer"> -->
<%-- 							<p class="ellipsis">${ser.crReContent}</p> --%>
<!-- 						</td> -->
<%-- 						<td align='center'>${ser.cremployee.empName}</td> --%>
<%-- 						<td align='center'><fmt:formatDate value="${ser.crReDate}" --%>
<%-- 								pattern="yyyy-MM-dd" /></td> --%>
<!-- 						<td><button id="btn_update" -->
<!-- 								class="btn btn-outline-secondary btn-icon-text" -->
<%-- 								onclick="updateCrReport(${ser.pk})"> --%>
<!-- 								回覆<i class="ti-pencil-alt btn-icon-append"></i> -->
<!-- 							</button> -->
<!-- 							<button id="btn_delete" -->
<!-- 								class="btn btn-outline-danger btn-icon-text" -->
<%-- 								onclick="deleteCrReport(${ser.pk})"> --%>
<!-- 								刪除<i class="ti-trash btn-icon-append"></i> -->
<!-- 							</button></td> -->
							
<!-- 					</tr> -->
<!-- 					<tr> -->
<%-- 						<td id="MBcontent${report.index}" colspan="10" --%>
<!-- 							style="display: none; word-wrap: break-word;"><textarea -->
<!-- 								style="width: 800px; height: 200px;" class="form-control" -->
<%-- 								disabled>${ser.crContent}</textarea> --%>
<!-- 					<tr> -->
<%-- 						<td id="recontent${report.index}" colspan="10" --%>
<!-- 							style="display: none; word-wrap: break-word;"><textarea -->
<!-- 								style="width: 800px; height: 200px;" class="form-control" -->
<%-- 								disabled>${ser.crReContent}</textarea></td> --%>
<!-- 					</tr> -->
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