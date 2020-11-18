<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>公佈欄管理</title>



</head>
<body>
<jsp:include page="/fragment/BMnav.jsp"></jsp:include>


	<h4 class="font-weight-bold mb-0">公佈欄發布管理</h4>
	<div align="right"><a href="<c:url value='/addboard'/>"><button id="add">新增公告內容</button></a></div>
	<div id="resultmsg"></div>
	<table class="table table-hover" style=" table-layout:fixed; width:1100px;">
		<thead>
			<tr>
				<th>公告編號</th>
				<th>主題</th>
				<th>發表者</th>
				<th>觀看人數</th>
				<th>發表日期</th>
				<th>最後觀看日期</th>
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
								${ser.untreatamt}
								</td>
								<td>
								${ser.replyamt}
								</td>
						<td><button id="btn_update"
								class="btn btn-outline-secondary btn-icon-text"
								onclick="show(${emp.index})">
								修改<i class="ti-pencil-alt btn-icon-append"></i>
							</button>
							<br>
							<button id="btn_delete"
								class="btn btn-outline-danger btn-icon-text"
								onclick="deleteCrReport(${ser.empPk})">
								刪除<i class="ti-trash btn-icon-append"></i>
							</button></td>
					</tr>
					<tr id="up${emp.index}" style="display:none;">
					<td align='left'><input type="text" value="${ser.empPk}" id="emppk${emp.index}" disabled></td>
						<td align='left'>
						<input type="text" id="empName${emp.index}" name="empName" value="${ser.empName}" width="100px;"></td>
						<td align='center'>
						<input type="text" id="empId${emp.index}" name="empId" value="${ser.empId}" width="200px"></td>
						<td align='left'>
						<input type="text" id="empemail${emp.index}" name="empemail" value="${ser.empemail}" width="100px"></td>
						<td align='center'>
						<fmt:formatDate value="${ser.applyDate}"
								pattern="yyyy-MM-dd" /></td>
								<td>
								${ser.untreatamt}
								</td>
								<td>
								
								${ser.replyamt}
								</td>
								<td><input type="button" id="confirmup" onclick="send(${emp.index})" value="確認修改"></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
<jsp:include page="/fragment/BMfoot.jsp"></jsp:include> 




</body>
</html>