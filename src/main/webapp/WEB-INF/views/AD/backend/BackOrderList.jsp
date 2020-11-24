<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iiiNews 後臺管理 廣告訂單列表</title>
<script type="text/javascript">
	function deleteCheck(){
		if(confirm("確定更新此項資料")){
		}else{
			window.location.href="#"
		}
	}
</script>
<script>
window.onload=function(){
	var origincontent = "<table class='table table-striped'><thead><tr><th>序號</th>";
	origincontent +=  "<th>訂單編號</th>";
    origincontent +=  "<th class='text-center'>購買人</th>";
    origincontent +=  "<th class='text-center'>訂單成立日期</th><th class='text-center'>訂單總價</th>";
    origincontent +=  "<th>付款狀態</th>";
    origincontent +=  "<th>編輯</th></tr></thead>";
	origincontent +=  "<tr><td colspan='7'><b>請選擇欲搜尋的類別</b></td></tr></table>";
	document.getElementById("somedivS").innerHTML = origincontent;
	
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/getOrderListByAjax.json' />", true);
	xhr.send();
	
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var responseData = xhr.responseText;
			displayPageAds(responseData);
		}
	}
}
</script>
</head>
<body>
<jsp:include page="/fragment/BMnav.jsp"></jsp:include> 
<div class='card-body'>


	<h3>後臺管理 訂單管理列表</h3>
		<br>
		<div class="row align-items-center">
			
	        <div class="col-md-6">
				<div class="form-group row">
					<label class="col-sm-4 col-form-label ">會員帳號搜尋：</label>
					<div class="col-sm-8">
						<input type="text" class="form-control form-control-sm" id="wordChoose" onkeyup="searchByMemberId()"/>
					</div>
				</div>
			</div>
<!-- 			<div class="col-md-4"> -->
<!-- 				<div class="form-group row"> -->
<!-- 					<label class="col-sm-4 col-form-label">分類搜尋：</label> -->
<!-- 					<div class="col-sm-8"> -->
<!-- 						<select id="cateChoose" onchange="searchBycateNo()" class="form-control form-control-sm"> -->
<!-- 							<option value="-1">全部</option> -->
<!-- 							<option value="100">頭版頭</option> -->
<!-- 							<option value="200">頭版側標</option> -->
<!-- 							<option value="300">內頁版頭</option> -->
<!-- 							<option value="400">內頁側標</option> -->
<!-- 							<option value="500">小廣告</option> -->
<!-- 				         </select> -->
<!-- 			         </div> -->
<!-- 			    </div> -->
<!--          	</div> -->
         	<div class="col-md-6">
         		<div class="form-group row">
<!-- 					<label class="col-sm-4 col-form-label">日期搜尋：</label> -->
<!-- 					<div class="col-sm-8"> -->
<!-- 						<input type="date" id="dateChoose" onchange="searchByDate()" class="form-control form-control-sm"/> -->
<!-- 					</div> -->
				</div>
         	</div>
        </div>
		<div id='somedivS'></div>
		<div id='navigation'></div>
		<hr>
<!-- 		<a href='..'>回前頁</a> -->












<!-- <div> -->
<!-- 	<div align="center"> -->
<!-- 		<h2>後台訂單列表</h2> -->
<%-- 		<a href="<c:url value='/' />">回首頁</a> --%>
<!-- 	</div> -->
<%-- 	<span>${msgMap.addStatus}</span> --%>
<!-- 	<hr> -->
<!-- 	<div align="center"> -->
<!-- 		<table class="tablebyme"> -->
<!-- 			<thead> -->
<!-- 				<tr> -->
<!-- 					<td>訂單編號</td> -->
<!-- 					<td>訂購日期</td> -->
<!-- 					<td>訂單價格</td> -->
<!-- 					<td>付款狀態</td> -->
<!-- 					<td>設定</td> -->
<!-- 				</tr> -->
<!-- 			</thead> -->
<!-- 			<tbody> -->
<%-- 				<c:choose> --%>
<%-- 	            	<c:when test="${empty memberOrderList}"> --%>
<!-- 	            		<tr> -->
<!-- 	            			<td colspan='8' align="center">您無購物紀錄</td> -->
<!-- 	            		</tr> -->
<%-- 	            	</c:when> --%>
<%-- 	            	<c:otherwise> --%>
<%-- 						<c:forEach var="ad" items="${memberOrderList}"> --%>
<!-- 							<tr> -->
<%-- 								<td>${ad.adOrderNo}</td> --%>
<%-- 								<c:set var="date" value="${fn:substring(ad.orderDate, 0, 16)}" /> --%>
<%-- 								<td>${date}</td> --%>
<%-- 								<td>${ad.totalAmount}</td> --%>
<%-- 								<td>還沒寫${ad.paymentStatus} --%>
<%-- 									<c:if test="${ad.paymentStatus == 0}">未付款</c:if> --%>
<%-- 									<c:if test="${ad.paymentStatus == 1}">已付款</c:if> --%>
<%-- 									<c:if test="${ad.paymentStatus == 2}">其他</c:if> --%>
<!-- 								</td> -->
<!-- 								<td> -->
<%-- 									<a href="<c:url value="/getItemByOrderPk/${ad.adOrderPk}" />">檢視訂單內容</a> --%>
<%-- 									<c:if test="${ad.paymentStatus == 0}"><a href="<c:url value="/checkoutOK.Pay/${ad.adOrderPk}" />">前往付款</a></c:if> --%>
									
<!-- 								</td> -->
<!-- 							</tr> -->
<%-- 						</c:forEach> --%>
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
<!-- 			</tbody> -->
<!-- 		</table> -->
<!-- 	</div> -->
<!-- </div> -->




</div>
<script>
	function cateNameTrans(categoryNo) {
		if(categoryNo == 100){
			cateName = "頭版頭";
		}else if(categoryNo == 200){
			cateName = "頭版側標";
		}else if(categoryNo == 300){
			cateName = "內頁版頭";
		}else if(categoryNo == 400){
			cateName = "內頁側標";
		}else if(categoryNo == 500){
			cateName = "小廣告";
		}else{
			cateName = "其他";
		}
		return cateName;
	}
	
	function statusTrans(status){
		if(status == 0){
			status = "<span class='bg-danger text-white p-1'>尚未付款</span>";
		}else if(status == 1){
			status = "<span class='bg-success text-white p-1'>已付款</span>";
		}else{
			status = "其他";
		}
		return status;
	}
	

	function displayPageAds(responseData){
		  var content = "<table class='table table-striped'><thead><tr><th>序號</th>";
		      content +=  "<th class='text-center'>訂單編號</th>";
		      content +=  "<th class='text-center'>購買人</th>";
		      content +=  "<th class='text-center'>訂單成立日期</th><th class='text-center'>訂單總價</th>";
		      content +=  "<th class='text-center'>付款狀態</th>";
			  content +=  "<th class='text-center'>編輯</th></tr></thead>";
			var ad = JSON.parse(responseData);		// 傳回一個陣列
			var bgColor = "";   // 每一項商品的背影 
			for(var i=0; i < ad.length; i++){		
				bgColor = (i % 2 == 0 ? "#d4f5b2" : "#b2f5e5");
				content += "<tr height='80' bgcolor='" + bgColor + "'>" + 
							"<td class='text-center'>" + (i+1) + "&nbsp;</td>" + 
// 				           	"<td class='text-center'>" + ad[i].adOrderPk + "&nbsp;</td>" + 
			               	"<td class='text-center'>" + ad[i].adOrderNo + "</td>" +
			               	"<td class='text-center'>" + ad[i].buyerMemberId + "</td>" +
			               	"<td class='text-center'>" + ad[i].orderDate + "</td>" +
			               	"<td class='text-right'>" + "NT$ " + ad[i].totalAmount + "</td>" +
			               	"<td class='text-center'>" + statusTrans(ad[i].paymentStatus) + "</td>" + 
			               	"<td class='text-center'>" +
			               	"<button onclick='delfunction("+ad[i].adPk+")' type='button' class='btn btn-danger btn-icon-text'>Delete<i class='ti-trash btn-icon-append'></i></button>"+
// 			               	"<form action='"+"<c:url value='/addProductToCart' />"+"'method="+"'POST'>" +
// 							"<input type='hidden' name='quantity' value='1'>" + 
// 							"<input type='hidden' name='adPk' value='"+ad[i].adPk+"'>" + 
// 							"<input type='submit' class='cartBtn' value='加入購物車' /></form>" + 
							"</td>" +
				           "</tr>";  			           
			}
			content += "</table>";
			document.getElementById("somedivS").innerHTML = content;
	}
	
	
	function searchByMemberId(){
		let word = document.getElementById("wordChoose").value;
		console.log(word);
		
		var queryStringWord = "?buyerMemberId=" + word;
		console.log(queryStringWord);
		var xhr0 = new XMLHttpRequest();
		xhr0.open("GET", "<c:url value='/getOrderListByAjax.json' />" + queryStringWord , true);
		xhr0.send();
		
		xhr0.onreadystatechange = function() {
			if (xhr0.readyState == 4 && xhr0.status == 200) {
				var responseData = xhr0.responseText;
				displayPageAds(responseData);
			}
		}
	}
	
	
</script>
<jsp:include page="/fragment/BMfoot.jsp"></jsp:include>
</body>
</html>