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
		console.log(n);
		location.href="DeleteFromCart/"+n
	} else {
	
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
 			background-color:#0072E3;
			padding:10px 20px;
			text-decoration:none;
			font-weight:500;
			box-shadow: 1px 1px 1px 1px rgba(0, 0, 0, 0.2);
			border-radius: 5px;
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
            background-color: rgba(255, 255, 255, 0.3) ;
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

	<div align="center" style="margin-top:100px;">
		<h2>購物車</h2>
		<div>本次使用者session: ${pageContext.session.id }</div>
		<a href="<c:url value='/' />">回首頁</a>
	</div>
	
	
	<hr>
	<div align="center">
		<table class="tablebyme">
		<thead>
			<tr>
               <td>產品編號</td>
               <td>分類</td>
               <td>上架日期</td>
               <td>單價</td>
               <td>金額 /賣的人</td>
               <td>設定</td>
            </tr>
        </thead>
        <tbody>
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
	                    <td>
	                    	<c:if test="${ad.value.categoryNo == 100}">頭版頭</c:if>
							<c:if test="${ad.value.categoryNo == 200}">頭版側標</c:if>
							<c:if test="${ad.value.categoryNo == 300}">內頁版頭</c:if>
							<c:if test="${ad.value.categoryNo == 400}">內頁側標</c:if>
							<c:if test="${ad.value.categoryNo == 500}">小廣告</c:if>
	                    </td>
	                    <td>${ad.value.adDate}</td>
	                    <td>${ad.value.unitPrice}</td>
	                    <td>${ad.value.sellerMemberId}</td>
					<td>
	               		<input type="button" name="delete" value="移除商品" onclick="confirmDelete(${ad.value.adPk})">
					</td>
					</tr>
				</c:forEach>
			</c:otherwise>
			</c:choose>
		
			<tr height='16'>
	          	<td colspan='5' align='right'>合計金額：</td>
	          	<td align='right'>${shoppingCart.total} 元</td>
	          	         
	        </tr>
	        </tbody>
	        <tfoot>
	        	<tr height='30'>
		        	<td colspan='6' align='center'>
		          		<a href="<c:url value='/getAllAds' />">返回購物</a>
		          		<a href="<c:url value='/checkoutOK.insert' />">結帳</a>
		          	</td> 
	        	</tr>
	        </tfoot>
		</table>
		 ${shoppingCart.content}
	</div>
	
	
	
	
	
</body>
</html>