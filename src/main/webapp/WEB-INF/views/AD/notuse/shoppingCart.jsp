<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購物車清單</title>
<script>
function confirmDelete(n) {
	if (confirm("確定移除此項商品 ? ") ) {
// 		document.forms[0].action="<c:url value='/DeleteFromCart?adPk=" + n +"' />" ;
// 		document.forms[0].method="POST";
// 		document.forms[0].submit();
		console.log(n);
		location.href="DeleteFromCart/"+n
	} else {
	
	}
}

</script>
</head>
<body>
<nav>
<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
</nav>

	<div align="center" style="margin-top:100px;">
		<h2>購物車</h2>
		<div>本次使用者session: ${pageContext.session.id }</div>
		<a href="<c:url value='/' />">回首頁</a>
	</div>
	<hr>
	<div align="center">
		<table border="1">
			<tr>
                <td>產品編號</td>
                <td>分類</td>
                <td>日期</td>
                <td>單價</td>
                <td>金額 / 賣的人</td>
                <td>設定</td>
            </tr>
		<c:choose>
            <c:when test="${empty shoppingCart.content}">
            	<tr>
            		<td colspan='6' align="center">您的廣告購物車內無商品</td>
            	</tr>
            </c:when>
            <c:otherwise>
				<c:forEach var="ad" items="${shoppingCart.content}">
					<tr>
	                    <td>${ad.value.adNo}</td>
	                    <td>${ad.value.categoryNo}</td>
	                    <td>${ad.value.adDate}</td>
	                    <td>${ad.value.unitPrice}</td>
	                    <td>${ad.value.sellerMemberId}</td>
					<td>
	<%-- 					<input type="button" name="update" value="查看詳細內容" onclick="modify(${anEntry.key}, ${anEntry.value.quantity}, ${vs.index})"> --%>
	               		<input type="button" name="delete" value="移除商品" onclick="confirmDelete(${ad.value.adPk})">
	<%--                		<a href="<c:url value="/deleteAdProduct/${ad.adPk}" />" onclick="return confirm('Are you sure?')">刪除</a> --%>
					</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
			<tr height='16'>
	          	<td colspan='4' align='right'>合計金額：</td>
	          	<td align='right'>${shoppingCart.total} 元</td>
	          	<td align='right'>
	          		<a href="<c:url value='/getAllAds' />">返回購物</a>
	          		<a href="<c:url value='/checkoutOK.insert' />">結帳</a>
	          	</td>          
	        </tr>
		</table>
		 ${shoppingCart.content}
	</div>
	
	
	
	
	
</body>
</html>