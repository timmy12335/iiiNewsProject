<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有客服表單</title>

<script type="text/javascript">



	function deleteCrReport(pk){
		var xhr2 = new XMLHttpRequest();
		var divResult = document.getElementById('resultmsg');
		var result=confirm("確定刪除此筆客服表單(單號:"+pk+")?");
		if(result){
			xhr2.open("DELETE","<c:url value='/customerReports/'/>"+pk,true);
			xhr2.setRequestHeader("Content-Type","application/json;charset=UTF-8");
			xhr2.send();
			xhr2.onreadystatechange=function(){
			if (xhr2.readyState == 4 && (xhr2.status == 200 || xhr2.status == 204) ) {
		      result = JSON.parse(xhr2.responseText);
		      if (result.fail) {		    	  
				 		divResult.innerHTML = "<font color='red' >"
							+ result.fail + "</font>";
			  		} else if (result.success) {
				 		divResult.innerHTML = "<font color='green' >"
							+ result.success + "</font>";
							window.location.href="<c:url value='/customerReports'/>";
							
			}
		}
		
	}
	
	}
	}
	
	function updateCrReport(pk){
		
		var result=confirm("回覆/修改此筆客服表單(單號:"+pk+")?");
		if(result){
					window.location.href="<c:url value='/crReport/'/>"+pk;
					}
	}
	
	


</script>
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
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

<%-- 		<jsp:include page="/fragment/navbar.jsp"></jsp:include> --%>
<jsp:include page="/fragment/BMnav.jsp"></jsp:include> 

<!-- 	<section style="margin-top: 100px"> -->	

                  <h4 class="font-weight-bold mb-0">顯示所有客服表單</h4>
                  <div id="resultmsg"></div>
			<table class="table table-hover">
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
					</tr>
				</thead>
				<c:choose>
					<c:when test="${empty CrReport}">
						<tr >
							<td colspan='8' align='center'><font color='red'>無客服資料</font></td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var='ser' items='${CrReport}'>
							<tr>
								<td align='right'>${ser.pk}</td>
								<td align='left'>&nbsp;${ser.mbBean.name}</td>
								<td align='center'>${ser.crClass}</td>
								<td align='left'>&nbsp;${ser.crTitle}</td>
								<td align='center'>${ser.crContent}</td>
								<td align='center'>${ser.crApplyDate}</td>
								<td><button id="btn_update" class="btn btn-outline-secondary btn-icon-text" 
								onclick="updateCrReport(${ser.pk})" >修改<i class="ti-pencil-alt btn-icon-append"></i>
								</button>
								<button id="btn_delete" class="btn btn-outline-danger btn-icon-text"
									onclick="deleteCrReport(${ser.pk})" >刪除<i class="ti-trash btn-icon-append"></i></button></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>

	<jsp:include page="/fragment/BMfoot.jsp"></jsp:include> 
</body>
</html>