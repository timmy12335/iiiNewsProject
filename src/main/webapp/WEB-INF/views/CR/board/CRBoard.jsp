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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" />

</head>
<body>
	<nav>
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<section style="margin-top:100px;">
	<div class="card-body">
	<div class="table-responsive pt-3">
	<table class="table table-bordered">
		<thead class="table table-primary">
			<tr>
				<th width="60px">公告編號</th>
				<th>主題</th>
				<th width="80px">發表者</th>
				<th width="80px">觀看人數</th>
				<th width="80px">發表日期</th>
			</tr>
		</thead>
		<tbody>
			<tr class="table-info">
				<td>[pk]</td>
				<td>[分類][主題]</td>
				<td>[作者名]</td>
				<td>[人數紀錄]</td>
				<td>[發表日期]</td>
			</tr>
			<tr class="table-info">
				<td>2</td>
				<td>Messsy Adam</td>
				<td>Flash</td>
				<td>$245.30</td>
				<td>July 1, 2015</td>
			</tr>
			<tr class="table-info">
				<td>3</td>
				<td>John Richards</td>
				<td>Premeire</td>
				<td>$138.00</td>
				<td>Apr 12, 2015</td>
			</tr>
			<tr class="table-info">
				<td>4</td>
				<td>Peter Meggik</td>
				<td>After effects</td>
				<td>$ 77.99</td>
				<td>May 15, 2015</td>
			</tr>
			<tr class="table-info">
				<td>5</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
	</div>
	</div>
</section>

</body>
</html>