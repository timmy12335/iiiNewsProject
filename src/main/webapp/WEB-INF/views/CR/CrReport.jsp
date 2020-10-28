<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有客服表單</title>
<script type="text/javascript">

	function deleteCrReport(pk){
		var xhr2 = new XMLHttpRequest();
		var divResult = document.getElementById('resultMsg');
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
							window.location.href="<c:url value='/customerReports'/>"
		      		
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
<nav>
<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
</nav>
<section style="margin-top:100px">
<h2 class="title">顯示所有客服表單</h2>
<hr>
<div align='center'>
<div id='resultMsg'></div>
<table border='1'>
<thead>
	<tr>
		<th width='60' align='center'>單號</th>
		<th width='120' align='center'>姓名</th>
		<th width='120' align='center'>類別</th>
		<th width='120' align='center'>標題</th>
		<th width='120' align='center'>內容</th>
		<th width='100' align='center'>申請日期</th>
	</tr>
	</thead>
	<c:choose>
		<c:when test="${empty CrReport}">
			<tr height='36'><td colspan='8' align='center'><font color='red' >無客服資料</font></td></tr>
		</c:when>
		<c:otherwise>
			<c:forEach var='ser' items='${CrReport}'>
					<tr>
					<td align='right' >${ser.pk}&nbsp</td>
					<td align='left'>&nbsp;${ser.memberBean.name}</td>
					<td align='center'>${ser.crClass}</td>
					<td align='left'>&nbsp;${ser.crTitle}</td>
					<td align='center'>${ser.crContent}</td>
					<td align='center'>${ser.crApplyDate}</td>
					
					<td><input type="button" id="btn_update" value="修改"  onclick="updateCrReport(${ser.pk})"/></td>
					<td><input type="button" id="btn_delete" value="刪除" onclick="deleteCrReport(${ser.pk})" /></td>
				</tr> 
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
</div>
</section>
</body>
</html>