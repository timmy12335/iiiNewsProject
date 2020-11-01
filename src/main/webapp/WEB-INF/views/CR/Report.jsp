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


function updateCrReport(){
	var pk = document.getElementById("pk").value;
	var nameValue = document.getElementById("name").value;
	var classValue = document.getElementById("crClass").value;
	var titleValue = document.getElementById("crTitle").value;
	var contentValue = document.getElementById("crContent").value;
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
				"crContent": contentValue
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
						window.location.href="<c:url value='/customerReports'/>"
		}
	}
	
}

}

}


</script>


</head>
<body>

<nav>
<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
</nav>

<section style="margin-top:100px">
<h2 class="title" align='center'>編號:${report.pk}&nbsp表單</h2>
<hr>
<div align='center'>
<div id='resultMsg'></div>
<table border='1'>
	<tr>
		<td width='60' align='center' colspan="2">單號:No.${report.pk}
		<input type='text' name='pk' id='pk' value="${report.pk}" hidden='true'/>
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
		<select id='crClass' name='crClass' value='${report.crClass}'>
		<option value="帳號相關">帳號相關</option>
		<option value="交易相關">交易相關</option>
		<option value="商品相關">商品相關</option>
		<option value="申請合作">申請合作</option>
		<option value="提議">提議</option>
		<option value="其他">其他</option>
		</select></td>
		</tr>
		<tr>
		<td width='120' align='center'>標題</td>
		<td>
		<input type='text' name='crTitle' id='crTitle' style='width:180px' value='${report.crTitle}'/></td>
		</tr>
		<tr>
		<td width='120' align='center'>內容</td>
		<td align='center'>
		<textarea style='resize:none;width:180px;height:80px;' name='crContent' id='crContent'>${report.crContent}</textarea>
		</td>
		</tr>
		<tr>
		<td align='center' colspan='2'>
		<input type="button" id="btn_update" value="確認修改" onclick="updateCrReport()"/>
		<input type="button" id="btn_delete" value="取消修改" onclick="deleteCrReport()" />
		</td>
		</tr>
</table>
					
					
</div>
</section>
</body>
</html>