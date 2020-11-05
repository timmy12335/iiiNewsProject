<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品內容</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
window.onload=function(){

	$("#productImage").change(function(){
		console.log("hello");
		readURL(this);// this代表<input id="imgInput">
		let context = "<br>預覽中，送出後才儲存";
		$("#imgspan")[0].innerHTML = context;
 	});
	
	function readURL(input){
		if(input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function (e) {
		 	  $("#preview_img").attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	var yourImg = document.getElementById('preview_img');
	if(yourImg && yourImg.style) {
	    yourImg.style.height = ${oneItem.height}+'px';
	    yourImg.style.width = ${oneItem.width}+'px';
	}
	
}
</script>
</head>
<body>
<nav>
<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
</nav>
	<div align="center" style="margin-top:100px;">
		<h2>商品內容 </h2>
		<h2>編號：${oneItem.adNo} </h2>
		<a href="<c:url value='/' />">回首頁</a>
	</div>
	<span>${msgMap.addStatus}</span>
	<hr>
	<div align="center">
	<form:form method="POST" modelAttribute="oneItem" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td>廣告編號</td>
				<td>賣家</td>
				<td>廣告日期</td>
				<td>欄位分類</td>
			</tr>
			<tr>
				<td>${oneItem.adNo}</td>
				<td>${oneItem.sellerMemberId}</td>
				<td>${oneItem.adDate}</td>
				<td id="cate">
					<c:if test="${oneItem.categoryNo == 100}">頭版頭</c:if>
					<c:if test="${oneItem.categoryNo == 200}">頭版側標</c:if>
					<c:if test="${oneItem.categoryNo == 300}">內頁版頭</c:if>
					<c:if test="${oneItem.categoryNo == 400}">內頁側標</c:if>
					<c:if test="${oneItem.categoryNo == 500}">小廣告</c:if>
				</td>
			</tr>
			<tr>
				<td>寬</td>
				<td>高</td>
				<td>單價</td>
				<td>設定</td>
			</tr>
			<tr>
				<td>${oneItem.width}</td>
				<td>${oneItem.height}</td>
				<td>${oneItem.unitPrice}</td>
				<td>
                    <label>上傳照片:</label>
                    <input type="file" id="productImage" name="productImage">
				</td>
			</tr>
			<tr>
				<td colspan="1">
					PK :${oneItem.itemPk}
<%-- 					<img style="width:300px;height:200px;" id="preview_img" src="<c:url value='/getPicture/${oneItem.itemPk}' />" /> --%>
				</td>
				<td colspan="3">
					<img style="width:300px;height:200px;" id="preview_img" src="<c:url value='/getPicture/${oneItem.itemPk}' />" />
					<span id="imgspan"></span>
				</td>
			</tr>
			<tr>
				<td  colspan="4">
					<input type="submit" name="submit" id="submit" value="送出">
					<c:if test="${!empty oneItem.adImageName}">
						<a href="<c:url value='/downloadPicture/${oneItem.itemPk}' />">下載圖片</a>
					</c:if>
				</td>
			</tr>
		</table>
	</form:form>
	</div>
	<script>
// 	var yourImg = document.getElementById('preview_img');
// 	if(yourImg && yourImg.style) {
// 	    yourImg.style.height = ${oneItem.height}+'px';
// 	    yourImg.style.width = ${oneItem.width}+'px';
// 	}
	</script>
</body>
</html>