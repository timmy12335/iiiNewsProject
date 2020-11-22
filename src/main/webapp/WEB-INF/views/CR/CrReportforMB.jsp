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
<!-- <link rel="stylesheet" -->
<%-- 	href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css"> --%>
<!-- <link rel="stylesheet" -->
<%-- 	href="${pageContext.request.contextPath}/vendors/base/vendor.bundle.base.css"> --%>
<!-- <!-- endinject -->
-->
<!-- <!-- plugin css for this page -->
-->
<!-- <!-- End plugin css for this page -->
-->
<!-- <!-- inject:css -->
-->
<!-- <link rel="stylesheet" -->
<%-- 	href="${pageContext.request.contextPath}/css/style.css"> --%>
<!-- <!-- endinject -->
-->
<!-- <link rel="shortcut icon" -->
<%-- 	href="${pageContext.request.contextPath}/images/favicon.png" /> --%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.box {
	width: 300px;
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

#div1 {
	width: 700px;
	margin: 50px auto;
}

#score {
	width: 150px;
	margin: 10px auto;
	font-size: large;
	font-family: "標楷體";
	color: darkblue;
}
</style>
<script>
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
						window.location.href="<c:url value='/success'/>";						
		}
	}	
}
}
}



</script>

</head>
<body>

	<%-- 		<jsp:include page="/fragment/navbar.jsp"></jsp:include> --%>
	<nav>
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<section style="margin-top: 100px;">


		<h2 class="font-weight-bold mb-0" align="center">${MBBean.name}${CpMemberBean.cpname}
			:表單列表</h2>
		<br>
		<div id="resultmsg"></div>
		<table class="table table-hover "
			style="border: 1px solid black; width: 1400px;" align="center">
			<thead class="table-primary" style="background-color: #6FB7B7;"
				text-align="center">
				<tr>
					<th align="right" width='60px;'>單號</th>
					<th width='120px;'>申請人</th>
					<th width='120px;'>類別</th>
					<th width='120px;'>標題</th>
					<th align="right" width='120px;'>內容</th>
					<th width='60px;'>附圖</th>
					<th width='120px;'>申請日期</th>
					<th width='120px;'>回覆內容</th>
					<th width='120px;'>回覆人員</th>
					<th width='120px;'>回覆時間</th>
					<th>功能</th>
				</tr>
			</thead>
			<tbody style="background-color: #FCFCFC;">
				<c:choose>
					<c:when test="${empty CrReport}">
						<tr>
							<td colspan='12'><font color='red'>無客服資料</font></td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var='ser' items='${CrReport}' varStatus="report">
							<tr style="height: 100px;">
								<td style='vertical-align: middle;'>${ser.pk}</td>
								<td style='vertical-align: middle;'>&nbsp;${ser.mbBean.name}${ser.cpBean.cpname }</td>
								<td style='vertical-align: middle;'>${ser.crClass}</td>
								<td style='vertical-align: middle;'>&nbsp;${ser.crTitle}</td>
								<td style='vertical-align: middle; cursor: pointer;'
									onclick="MBfolded(${report.index})" class="box"
									><p class="ellipsis" title='點擊顯示詳細內容'>${ser.crContent}</p></td>
								<td style='vertical-align: middle;'><img
									style="width: 160px; height: 100px"
									src="<c:url value='/getCRimg/${ser.pk}' />" /></td>
								<td style='vertical-align: middle;'><fmt:formatDate
										value="${ser.crApplyDate}" pattern="yyyy-MM-dd HH:mm" /></td>
								<c:choose>
									<c:when
										test="${not empty ser.crReContent && empty ser.crReScore}">
										<td onclick="folded(${report.index})"
											style='vertical-align: middle; cursor: pointer' class="box"
											><p class="ellipsis" >
												<c:out value="${ser.crReContent}"></c:out>
											</p></td>
										<td style='vertical-align: middle;'><c:out
												value="${ser.cremployee.empName}" /></td>
										<td style='vertical-align: middle;'><fmt:formatDate
												value="${ser.crReDate}" pattern="yyyy-MM-dd" /></td>
										<td style='vertical-align: middle;'><button
												id="btn_update" class="btn btn-success"
												onclick="confirmReply(${report.index})">
												確認/評分<i class="ti-pencil-alt btn-icon-append"></i>
											</button></td>
									</c:when>
									<c:when
										test="${not empty ser.crReContent && not empty ser.crReScore}">
										<td style='vertical-align: middle; cursor: pointer;'
											onclick="folded(${report.index})" class="box"><p
												class="ellipsis" title='點擊顯示詳細內容'>
												<c:out value="${ser.crReContent}"></c:out>
											</p></td>
										<td style='vertical-align: middle;'><c:out
												value="${ser.cremployee.empName}" /></td>
										<td style='vertical-align: middle;'><fmt:formatDate
												value="${ser.crReDate}" pattern="yyyy-MM-dd" /></td>
										<td style='vertical-align: middle;'><button
												id="btn_update"
												class="btn btn-outline-secondary btn-icon-text" disabled>
												<b><font color="#FF5809" size="3">感謝評分</font></b>
											</button></td>
									</c:when>
									<c:otherwise>
										<td style='vertical-align: middle; cursor: pointer;'
											onclick="folded(${report.index})" class="box"><p
												class="ellipsis"></p></td>
										<td></td>
										<td style='vertical-align: middle;'><fmt:formatDate
												value="${ser.crReDate}" pattern="yyyy-MM-dd" /></td>
										<td style='vertical-align: middle;'><div>
												<button id="btn_update" class="btn btn btn-success"
													onclick="confirmReply(${ser.pk})" disabled>
													確認/評分<i class="ti-pencil-alt btn-icon-append"></i>
												</button>
											</div>
											<div style='margin-top: 10px;'>
												<button id="btn_delete" class="btn btn-danger"
													style="width: 85px;" onclick="deleteCrReport(${ser.pk})">
													取消申請<i class="ti-trash btn-icon-append"></i>
												</button>
											</div></td>
									</c:otherwise>
								</c:choose>
							</tr>
							<tr style="display: none" id="score${report.index}">

								<td colspan="11"><select name="scoreNum"
									id="scoreNum${report.index}"
									onchange="ScoreNum(${report.index},${ser.pk});">
										<option value='1'>極差</option>
										<option value='2'>差</option>
										<option value='3'>普</option>
										<option value='4'>優</option>
										<option value='5'>極優</option>
								</select></td>
							</tr>
							<tr id="MBcontent${report.index}"
								style="display: none; background-color: #ECF5FF;word-wrap: break-word;">
								<td colspan="2" style='text-align:center;vertical-align: middle;'><b><font size="4">客服內容:</font></b></td>
								<td colspan="12"><div style="height: 80px;display:flex; align-items: center;text-align:center; ">
								 <font size='3'>${ser.crContent}</font></div>
							<tr id="recontent${report.index}"
								style="display: none; word-wrap: break-word; background-color: #ECF5FF">
								<td colspan="2" style='text-align:center;vertical-align: middle;'><b><font size="4">回覆內容:</font></b></td>
								<td colspan="11" style='vertical-align: middle;'><div
										style="height: 80px; display:flex; align-items: center;"><font size='3'>${ser.crReContent}</font></div></td>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
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
	
	function confirmReply(pk){
		document.getElementById("div1").style.display="";
		
	}

	//評分展開
	function confirmReply(index){
		if(document.getElementById("score"+index).style.display =='none') {
			document.getElementById("score"+index).style.display='';
			}else{
				document.getElementById("score"+index).style.display='none';
			} 
	}
	
	function transformScore(num){
		switch (num) {
		  case "1":
		    	num="極差"
		    	return num;
		    	break;
		  case "2":
			    num="差"
			    return num;
			    break;
		  case "3":
			    num="普"
			    return num;
			    break;
		  case "4":
			    num="優"
			    return num;
			    break;
		  case "5":
			    num="極優"
			    return num;
			    break;
		}
	}
	
	
	//進行評分並修改評分檔案
	function ScoreNum(index, pk){
		var xhr0 = new XMLHttpRequest();
		var score = document.getElementById("scoreNum"+index).value;
		var result=confirm("確定進行評分(評分為"+transformScore(score)+")?");
		if(result){
			document.getElementById("score"+index).style.display='none';
			xhr0.open("POST","<c:url value='/scoreNum/'/>"+pk,true);
			xhr0.setRequestHeader("Content-Type","application/json;charset=UTF-8");
			var jsonReport = {
					"pk": pk, 					
					"crReScore":score
		   		}
			xhr0.send(JSON.stringify(jsonReport));				
			xhr0.onreadystatechange=function(){
			if (xhr0.readyState == 4 && (xhr0.status == 200 || xhr0.status == 204) ) {
		      result = JSON.parse(xhr0.responseText);
		      if (result.fail) {
		    	  console.log(result.fail);
		    	  		var divResult = alert("評分暫時有問題!!10秒後再請重試!");		
			  		} else if (result.success) {
			  			console.log(result.fail);
			  			var divResult = alert("感謝您的評分!!希望之後有機會能再次回覆。");
			  			window.location.href="<c:url value='/success'/>";	
			}
		}	
	}
	}
	}
	
	</script>
</body>
</html>