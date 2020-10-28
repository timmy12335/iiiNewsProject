<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<h2 class="title">${report.pk}客服表單</h2>
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
					<tr>
					<td align='right' >${report.pk}&nbsp</td>
					<td align='left'>&nbsp;${report.memberBean.name}</td>
					<td align='center'>${report.crClass}</td>
					<td align='left'>&nbsp;${report.crTitle}</td>
					<td align='center'>${report.crContent}</td>
					<td align='center'>${report.crApplyDate}</td>
					
					<td><input type="button" value="修改"  onclick="updateCrReport(${ser.pk})"/></td>
					<td><input type="button" id="btn_delete" value="刪除" onclick="deleteCrReport(${ser.pk})" /></td>
				</tr> 
		

</table>
</div>
</section>
</body>
</html>