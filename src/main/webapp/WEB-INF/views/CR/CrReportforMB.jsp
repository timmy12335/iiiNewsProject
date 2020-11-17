<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有客服表單</title>
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
  <style>
.box {
width: 300px;
padding: 10px;
}
.ellipsis {
overflow:hidden;
white-space: nowrap;
text-overflow: ellipsis;
display: -webkit-box;
-webkit-line-clamp: 2;
-webkit-box-orient: vertical;
white-space: normal;
}
  </style>


</head>
<body>

<%-- 		<jsp:include page="/fragment/navbar.jsp"></jsp:include> --%>
	<nav>
	<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<section style="margin-top: 100px">


                  <h4 class="font-weight-bold mb-0" align="center">客服表單申請成功</h4>
                  <div id="resultmsg"></div>
			<table class="table table-hover">
				<thead>
					<tr>
<!-- 						<th width='60' align='center'>單號</th> -->
<!-- 						<th width='120' align='center'>姓名</th> -->
<!-- 						<th width='120' align='center'>類別</th> -->
<!-- 						<th width='120' align='center'>標題</th> -->
<!-- 						<th width='120' align='center'>內容</th> -->
<!-- 						<th width='100' align='center'>申請時間</th> -->
<!-- 						<th width='100' align='center' colspan='2'>功能</th> -->
						<th width='60'>單號</th>
						<th >姓名</th>
						<th >類別</th>
						<th >標題</th>
						<th >內容</th>
						<th> 附件</th>
						<th align='center'>申請日期</th>
						<th>回覆內容</th>
						<th>回覆人員</th>
						<th>最新回覆時間</th>
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
						<c:forEach var='ser' items='${CrReport}' varStatus="report">
							<tr>
								<td align='left'>${ser.pk}</td>
								<td align='left'>&nbsp;${ser.mbBean.name}</td>
								<td align='center'>${ser.crClass}</td>
								<td align='left'>&nbsp;${ser.crTitle}</td>
								<td align='center'onclick="MBfolded(${report.index})" class="box"><p class="ellipsis">${ser.crContent}</p></td>
								<td><img style="width:160px;height:100px" src="<c:url value='/getCRimg/${ser.pk}' />" /></td>
								<td align='center'><fmt:formatDate value="${ser.crApplyDate}" pattern="yyyy-MM-dd HH:mm"/></td>
								<c:choose>
								<c:when test="${not empty ser.crReContent}">
								<td align='center'  onclick="folded(${report.index})" class="box"><p class="ellipsis"><c:out value="${ser.crReContent}"></c:out></p></td>
								<td align='center'><c:out value="${ser.cremployee.empName}"/></td>
								</c:when>
								<c:otherwise>
								<td align='center'  onclick="folded(${report.index})" class="box"><p class="ellipsis"></p></td>
								<td align='center'></td>
								</c:otherwise>
								</c:choose>
								<td align='center'><fmt:formatDate value="${ser.crReDate}" pattern="yyyy-MM-dd"/></td>
								<td><button id="btn_update" class="btn btn-outline-secondary btn-icon-text" 
								onclick="updateCrReport(${ser.pk})" >回覆確認<i class="ti-pencil-alt btn-icon-append"></i>
								</button>
								<button id="btn_delete" class="btn btn-outline-danger btn-icon-text"
									onclick="deleteCrReport(${ser.pk})" >取消申請<i class="ti-trash btn-icon-append"></i></button></td>
							</tr>
							<tr id="MBcontent${report.index}" style="display:none ;word-wrap : break-word ;"><td>客服內容</td>
							<td  colspan="10" > 
							<textarea style="width:1000px;height:200px;" disabled>
							${ser.crContent}</textarea>
							<tr id="recontent${report.index}" style="display:none ;word-wrap : break-word ;"><td>回覆內容</td><td  colspan="10" > 
							<textarea style="width:1000px;height:300px;" disabled>
							${ser.crReContent}</textarea>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
</section>
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
</body>
</html>