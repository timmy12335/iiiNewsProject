<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>客服表單</title>
<script>


	updateCrReport= function (){
	var pk = document.getElementById("pk").value;
	var nameValue = document.getElementById("name").value;
	var classValue = document.getElementById("crClass").value;
	var titleValue = document.getElementById("crTitle").value;
	var contentValue = document.getElementById("crContent").value;
	var crrecontentValue = document.getElementById("crReContent").value;
	var crreplierValue = document.getElementById("crReplier").value;
	var xhr2 = new XMLHttpRequest();
	var divResult = document.getElementById('resultMsg');
	var result=confirm("確定修改此筆客服表單?");
	if(result){
		xhr2.open("PATCH","<c:url value='/crReport/'/>"+pk,true);
		var jsonReport = {
				"pk": pk, 					
				"name": nameValue, 	
				"crClass": classValue,
				"crTitle": titleValue,
				"crContent": contentValue,
				"crReContent":crrecontentValue,
				"crReplier":crreplierValue
	   		}
		xhr2.setRequestHeader("Content-Type","application/json;charset=UTF-8");
		xhr2.send(JSON.stringify(jsonReport));
		xhr2.onreadystatechange=function(){
		if (xhr2.readyState == 4 && (xhr2.status == 200 || xhr2.status == 204) ) {
	      result = JSON.parse(xhr2.responseText);
	      if (result.fail) {		    	  
			 		divResult.innerHTML = "<font color='red' >"
						+ result.fail + "</font>";
		  		} else if (result.success) {
						window.location.href="<c:url value='/customerReports'/>";
		}
	}
	
}

}

}

	cancelCrReport=function (){
	var result=confirm("取消回覆客服表單?");
	if(result){
		window.location.href="<c:url value='/customerReports'/>";
}
}

	

</script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>

window.onload=function(){
	var cc = $("#cc").val();
$("#crClass option[value = '"+cc+"']").attr("selected",true);

}
</script>
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

<!-- <section style="margin-top:100px"> -->
<h2 class="title" align='center'>編號:${report.pk}&nbsp客服表單</h2>
<hr>
<div align='center'>
<div id='resultMsg'></div>
<table border='1' class="table table-bordered">
	<tr>
		<td width='60' align='center' colspan="2">單號:No.${report.pk}
		<input type='text' name='pk' id='pk' value="${report.pk}" hidden='true' disabled/>
		</td>
		</tr>
		<tr>
		<td width='120' align='center' colspan="2">
		<input type='text' name='name' id='name' value="${report.mbBean.name}" hidden='true'/>
		申請人姓名:${report.mbBean.name}
		</td>
		</tr>
		<tr>
		<td width='120' align='center'>類別</td>
		<td>
		<input type='text' name='cc' id='cc' hidden='true' value='${report.crClass}'/>
		<select id='crClass' name='crClass' class="form-coontrol form-control" disabled>
		<option value="帳號相關">帳號相關</option>
		<option value="交易相關">交易相關</option>
		<option value="商品相關">商品相關</option>
		<option value="申請合作">申請合作</option>
		<option value="提議">提議</option>
		<option value="其他">其他</option>
		</select></td>
		</tr>
		<tr>
		<td align='center'>標題</td>
		<td>
		<input type='text'class="form-control" name='crTitle' id='crTitle' value='${report.crTitle}' disabled/></td>
		</tr>
		<tr>
		<td width='120' align='center'>內容</td>
		<td align='center'>
		<textarea class="form-control" rows="10" name='crContent' id='crContent' disabled>${report.crContent}</textarea>
		</td>
		</tr>
		<tr><td align='center'>回覆內容</td><td>
		<textarea class="form-control" rows="10" name='crReContent' id='crReContent'>${report.crReContent}</textarea>
		</td></tr>
		<tr>
		<td align='center'>客服人員</td><td>
		<input type="text" class="form-control" name='crReplier' id='crReplier' value='${report.cremployee.empName}' disabled>
		</td></tr>
		<tr>
		<td align='center' colspan='2'>
		<input type="button" id="btn_update" value="確認回覆" onclick="updateCrReport();"/>
		<input type="button" id="btn_cancel" value="取消回覆" onclick="cancelCrReport();"/>
		</td>
		</tr>
</table>
					
					
</div>
	<jsp:include page="/fragment/BMfoot.jsp"></jsp:include> 
</body>
</html>