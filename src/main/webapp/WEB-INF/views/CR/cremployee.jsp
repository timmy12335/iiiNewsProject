<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>客服人員管理</title>
</head>
<script>
	function deleteCrReport(emppk){
		var xhr2 = new XMLHttpRequest();
		
		var result=confirm("確定刪除此筆客服表單(單號:"+emppk+")?");
		if(result){
			xhr2.open("DELETE","<c:url value='/allemployee/'/>"+emppk,true);
			xhr2.setRequestHeader("Content-Type","application/json;charset=UTF-8");
			xhr2.send();
			xhr2.onreadystatechange=function(){
			if (xhr2.readyState == 4 && (xhr2.status == 200 || xhr2.status == 204) ) {
		      result = JSON.parse(xhr2.responseText);
		      if (result.fail) {		    	  
				 		divResult.innerHTML = "<font color='red' >"
							+ result.fail + "</font>";
			  		} else if (result.success) {
							window.location.href="<c:url value='/allemployee'/>";						
			}
		}	
	}
	}
	}
	
	function send(emppk){
		var xhr2 = new XMLHttpRequest();
		var empnameValue = document.getElementById("empName").value;
		var empIValue = document.getElementById("empId").value;
		var titleValue = document.getElementById("crTitle").value;
		var result=confirm("確定修改此筆客服表單(單號:"+emppk+")?");
		if(result){
			xhr2.open("PUT","<c:url value='/allemployee/'/>"+emppk,true);
			xhr2.setRequestHeader("Content-Type","application/json;charset=UTF-8");
			var jsonReport = {
					"emppk": pk, 					
					"empId": nameValue, 	
					"empName": classValue,
					"empemail":emailValue
		   		}
			xhr2.send();
			xhr2.onreadystatechange=function(){
			if (xhr2.readyState == 4 && (xhr2.status == 200 || xhr2.status == 204) ) {
		      result = JSON.parse(xhr2.responseText);
		      if (result.fail) {		    	  
				 		divResult.innerHTML = "<font color='red' >"
							+ result.fail + "</font>";
			  		} else if (result.success) {
							window.location.href="<c:url value='/allemployee'/>";						
			}
		}	
	}
	}
	}
	
	function show(index){
		if(document.getElementById("up"+index).style.display =='none') {
			document.getElementById("up"+index).style.display='';
			}else{
				document.getElementById("up"+index).style.display='none';
			} 
		
	}
	</script>
<body>

	<jsp:include page="/fragment/BMnav.jsp"></jsp:include>


	<h4 class="font-weight-bold mb-0">客服人員管理表單</h4>
	<div style="width:400px;" align="left"><a href="<c:url value='/addemployee'/>"><button id="add">新增客服人員</button></a></div>
	<div id="resultmsg"></div>
	<table class="table table-hover" style="width: 1000px;">
		<thead>
			<tr>
				<th width='60'>員工流水號</th>
				<th>姓名</th>
				<th>客服人員帳號</th>
				<th>客服人員信箱</th>
				<th align='center'>入職日期</th>
				<th>處理中客服表單</th>
				<th>處理完客服表單</th>
				<th>功能</th>
			</tr>
		</thead>
		<c:choose>
			<c:when test="${empty cremployee}">
				<tr>
					<td colspan='8' align='center'><font color='red'>無客服資料</font></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var='ser' items='${cremployee}' varStatus="emp">
					<tr>
						<td align='left'>${ser.empPk}</td>
						<td align='left'>&nbsp;${ser.empName}</td>
						<td align='center'>${ser.empId}</td>
						<td align='left'>&nbsp;${ser.empemail}</td>
						<td align='center'><fmt:formatDate value="${ser.applyDate}"
								pattern="yyyy-MM-dd" /></td>
								<td>
								${ser.replyamt}
								</td>
								<td>
								${ser.untreatamt}
								</td>
						<td><button id="btn_update"
								class="btn btn-outline-secondary btn-icon-text"
								onclick="show(${report.index})">
								修改<i class="ti-pencil-alt btn-icon-append"></i>
							</button>
							<button id="btn_delete"
								class="btn btn-outline-danger btn-icon-text"
								onclick="deleteCrReport(${ser.empPk})">
								刪除<i class="ti-trash btn-icon-append"></i>
							</button></td>
					</tr>
					<tr id="up" style="display:none">
					<td align='left'>${ser.empPk}</td>
						<td align='left'><input type="text" id="empName${emp.index}" name="empName">${ser.empName}</td>
						<td align='center'><input type="text" id="empId${emp.index}" name="empId">${ser.empId}</td>
						<td align='left'><input type="text" id="empemail${emp.index}" name="empemail">${ser.empemail}</td>
						<td align='center'><fmt:formatDate value="${ser.applyDate}"
								pattern="yyyy-MM-dd" /></td>
								<td>
								${ser.replyamt}
								</td>
								<td>
								${ser.untreatamt}
								</td>
								<td><input type="button" id="confirmup" onclick="send(${emp.index})"></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
<jsp:include page="/fragment/BMfoot.jsp"></jsp:include> 
</body>
</html>