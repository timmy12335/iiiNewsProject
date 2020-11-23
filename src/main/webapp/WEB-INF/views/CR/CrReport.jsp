<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有客服表單</title>
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
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@300;400&display=swap" rel="stylesheet">
<style>
.box {
	width: 30px;
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

.fontsize {
	font-size: 14pt;
	font-family: 'Noto Sans TC', sans-serif;
}
</style>
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

</head>
<body>

	<%-- 		<jsp:include page="/fragment/navbar.jsp"></jsp:include> --%>
	<jsp:include page="/fragment/BMnav.jsp"></jsp:include>


			<div class="card">
				<div class='card-body' style='background: #F0F0F0'>

	<h3 class="font-weight-bold mb-0">顯示所有客服表單</h3>
	<div style="margin-top:10px;" id="resultmsg">
	</div>
	<table class="table table-striped fontsize" >
		<thead style="background-color:#6FB7B7">
			<tr >
				<th width='60'>單號</th>
				<th>姓名</th>
				<th>類別</th>
				<th>標題</th>
				<th width='60px;'>內容</th>
				<th align='center'>申請日期</th>
				<th width='60px;'>回覆內容</th>
				<th>回覆人員</th>
				<th>最新回覆時間</th>
				<th colspan='2'>功能</th>
			</tr>
		</thead>
		<c:choose>
			<c:when test="${empty CrReport}">
				<tr>
					<td colspan='10' align='center'><font color='red'>無客服資料</font></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var='ser' items='${CrReport}' varStatus='report'>
					<tr bgcolor="#D1E9E9">
						<td align='left'>${ser.pk}</td>
						<td align='left'>&nbsp;${ser.mbBean.name}${ser.cpBean.cpname}</td>
						<td align='center'>${ser.crClass}</td>
						<td align='left'>&nbsp;${ser.crTitle}</td>
						<td align='center' onclick="MBfolded(${report.index})" class="box"
							style="cursor: pointer">
							<p class="ellipsis">${ser.crContent}</p>
						</td>
						<td align='center'><fmt:formatDate value="${ser.crApplyDate}"
								pattern="yyyy-MM-dd HH:mm" /></td>
						<td align='center' onclick="folded(${report.index})" class="box"
							style="cursor: pointer">
							<p class="ellipsis">${ser.crReContent}</p>
						</td>
						<td align='center'>${ser.cremployee.empName}</td>
						<td align='center'><fmt:formatDate value="${ser.crReDate}"
								pattern="yyyy-MM-dd" /></td>
						<td><div><button id="btn_update"
								class="btn btn-outline-primary btn-icon-text btn-sm"
								onclick="updateCrReport(${ser.pk})">
								回覆<i class="ti-pencil-alt btn-icon-append"></i>
							</button></div><div style="margin-top:10px;">
							<button id="btn_delete"
								class="btn btn-outline-danger btn-icon-text btn-sm"
								onclick="deleteCrReport(${ser.pk})" >
								刪除<i class="ti-trash btn-icon-append"></i>
							</button></div></td>
							
					</tr>
					<tr  id="MBcontent${report.index}"  style="display: none; word-wrap: break-word;">
					<td>客服內容</td>
						<td colspan="10"><textarea
								style="width: 800px; height: 200px;" class="form-control"
								disabled>${ser.crContent}</textarea></td>
					<tr  id="recontent${report.index}" style="display: none; word-wrap: break-word;" class="fontsize">
					<td>回覆內容</td>
						<td colspan="10"><textarea
								style="width: 800px; height: 200px;" class="form-control"
								disabled>${ser.crReContent}</textarea></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>

	<hr>
	<button onclick='history.back()' class="btn btn-primary">回前頁</button>
	
	</div>
	</div>

	<script>
	function MBfolded(index){	
		
		if(document.getElementById("MBcontent"+index).style.display =='none') {
			document.getElementById("MBcontent"+index).style.display='';
			}else{
				document.getElementById("MBcontent"+index).style.display='none';
			} 
		}
	
	function folded(index){	
			if(document.getElementById("recontent"+index).style.display =='none') {
				document.getElementById("recontent"+index).style.display='';
				}else{
					document.getElementById("recontent"+index).style.display='none';
				} 
			}
	
	</script>
	<jsp:include page="/fragment/BMfoot.jsp"></jsp:include>
</body>
</html>