<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有客服表單</title>

</head>
<body>

 
<h2 class="title">顯示所有客服表單</h2>
<hr>
<div align='center'>
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
					<td><a href="/MidProject/ShowoneReport?pk=${ser.pk}"><input type="button" value="修改" /></a></td>
					<td> <a href="/MidProject/DeleteReport?pk=${ser.pk}"><input type="button" value="刪除"  onclick=""/></a></td>
				</tr> 
			</c:forEach>
		</c:otherwise>
	</c:choose>
</table>
</div>
</div>
</div>
</body>
</html>