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
<form:form method="patch" modelAttribute="report" 
        id="forms" enctype="multipart/form-data">
<table border='1'>

	<tr>
		<td width='60' align='center' colspan="2">單號:No.${report.pk}
		</td>
		</tr>
		<tr>
		<td width='120' align='center' colspan="2">
		申請人姓名:${report.memberBean.name}
		</td>
		</tr>
		<tr>
		<td width='120' align='center'>類別</td>
		<td><form:select path='crClass' style='width:180px' value='${report.crClass}'>
		<form:option value="帳號相關"></form:option>
		<form:option value="交易相關"></form:option>
		<form:option value="商品相關"></form:option>
		<form:option value="申請合作"></form:option>
		<form:option value="提議"></form:option>
		<form:option value="其他"></form:option>
		</form:select></td>
		</tr>
		<tr>
		<td width='120' align='center'>標題</td>
		<td>
		<form:input type='text' path='crTitle' style='width:180px' value='${report.crTitle}'></form:input></td>
		</tr>
		<tr>
		<td width='120' align='center'>內容</td>
		<td align='center'>
		<form:textarea style='resize:none;width:180px;height:80px;' value='${report.crContent}' path='crContent'></form:textarea>
		</td>
		</tr>
		<tr>
		<td align='center' colspan='2'>
		<input type="submit" value="確認修改"/>
		<input type="button" id="btn_delete" value="取消修改" onclick="deleteCrReport()" />
		</td>
		</tr>
</table>
</form:form>
					
					
</div>
</section>
</body>
</html>