<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有會員訂單列表</title>
<script type="text/javascript">
	function deleteCheck(){
		if(confirm("確定更新此項資料")){
		}else{
			window.location.href="#"
		}
	}
</script>
<style>
		.tablebyme {
  			width: 70%;
  			border-collapse: collapse;
		}
		.tablebyme td {
   			padding:10px;
		}
		.tablebyme tbody tr:nth-of-type(even){
			background-color:rgba(194, 223, 255, 0.5)
		}
		.tablebyme tbody tr:hover{
			color:#212529;
			background-color:rgba(0,0,0,.075)
		}
		.tablebyme th{
			color:#fff;
			background-color:#005AB5;
			border-color:#FFFFFF;
		}
		.tablebyme a{
			text-decoration:none;
			font-weight:500;
		}
		
		.tablebyme a:hover{
			text-decoration:none;
			background:	#005AB5;
			color:white;
			font-weight:500;
        }

        .tablebyme thead{
            text-align: center;
            background-color: #001f63;
            color: white;
            border: 1px solid white;
        }
        
        .tablebyme tbody tr:hover{
            background-color: rgba(255,255,255,0.3);
        }
        
		#mainDiv{
			margin-top:100px;
			margin-bottom:100px;
		}
		
	</style>
</head>
<body>
<nav>
<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
</nav>
<div id="mainDiv">
	<div align="center">
		<h2>會員XXX的所有訂單列表</h2>
		<a href="<c:url value='/' />">回首頁</a>
	</div>
	<span>${msgMap.addStatus}</span>
	<hr>
	<div align="center">
		<table class="tablebyme">
			<thead>
				<tr>
					<td>訂單編號</td>
					<td>訂購日期</td>
					<td>訂單價格</td>
					<td>付款狀態</td>
					<td>設定</td>
				</tr>
			</thead>
			<tbody>
				<c:choose>
	            	<c:when test="${empty memberOrderList}">
	            		<tr>
	            			<td colspan='8' align="center">您無上傳清單</td>
	            		</tr>
	            	</c:when>
	            	<c:otherwise>
						<c:forEach var="ad" items="${memberOrderList}">
							<tr>
								<td>${ad.adOrderNo}</td>
								<c:set var="date" value="${fn:substring(ad.orderDate, 0, 16)}" />
								<td>${date}</td>
								<td>${ad.totalAmount}</td>
								<td>還沒寫${ad.paymentStatus}
									<c:if test="${ad.paymentStatus == 0}">未付款</c:if>
									<c:if test="${ad.paymentStatus == 1}">已付款</c:if>
									<c:if test="${ad.paymentStatus == 2}">其他</c:if>
								</td>
								<td>
									<a href="<c:url value="/getItemByOrderPk/${ad.adOrderPk}" />">檢視訂單內容</a>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>