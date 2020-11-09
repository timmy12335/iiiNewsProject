<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test</title>
  <!-- plugins:css -->
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
<jsp:include page="/fragment/BMnav.jsp"></jsp:include>
<section>
<table class="table">
<thead>
					<tr>
<!-- 						<th width='60' align='center'>單號</th> -->
<!-- 						<th width='120' align='center'>姓名</th> -->
<!-- 						<th width='120' align='center'>類別</th> -->
<!-- 						<th width='120' align='center'>標題</th> -->
<!-- 						<th width='120' align='center'>內容</th> -->
<!-- 						<th width='100' align='center'>申請日期</th> -->
<!-- 						<th width='100' align='center' colspan='2'>功能</th> -->
						<th >單號</th>
						<th >姓名</th>
						<th >類別</th>
						<th >標題</th>
						<th >內容</th>
						<th align='center'>申請日期</th>
						<th colspan='2'>功能</th>
					</tr></table>
					</thead>
</section>
<jsp:include page="/fragment/BMfoot.jsp"></jsp:include>

</body>
</html>