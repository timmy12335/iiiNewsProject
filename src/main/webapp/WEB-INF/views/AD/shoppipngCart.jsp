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
	if (confirm("確定刪除此項商品 ? ") ) {
		document.forms[0].action="<c:url value='UpdateCartItem?cmd=DEL&bookId=" + n +"' />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
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
		<a href="<c:url value='/' />">回首頁</a>
	</div>
	<hr>
	<div align="center">
		<table border="1">
			<tr><td>產品編號</td><td>分類</td><td>日期</td><td>單價</td><td>金額</td><td>設定</td></tr>
			<c:forEach var="product" items="${XXXXXXXXXXX}">
				<tr>
				<td>${ad.adNo}</td><td>${ad.uploadDate}</td><td>${ad.categoryNo}</td>
				<td>${ad.width}</td><td>${ad.height}</td><td>${ad.adDate}</td><td>${ad.price}</td><td>${ad.stock}</td>
				<td>
					<a href="<c:url value="/deleteAdProduct/${ad.adPk}" />">刪除</a>
					<input type="button" name="update" value="修改" onclick="modify(${anEntry.key}, ${anEntry.value.quantity}, ${vs.index})">
               		<input type="button" name="delete" value="刪除" onclick="confirmDelete(${anEntry.key})">
				</td>
				</tr>
			</c:forEach>
			<tr height='16'>
	          	<td colspan='4' align='right'>合計金額：</td>
	          	<td align='right'><fmt:formatNumber value="${subtotal}" pattern="#,###,###" />元</td>
	          	<td align='right'>&nbsp;</td>          
	        </tr>
		</table>
	</div>
	
	
	
	
	
</body>
</html>