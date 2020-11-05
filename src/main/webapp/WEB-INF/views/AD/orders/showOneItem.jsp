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
// 	$("#productImage").on('change', function(e){
// 		console.log("OMG");
// 		  const file = this.files[0];//將上傳檔案轉換為base64字串
		      
// 		  const fr = new FileReader();//建立FileReader物件
// 		  fr.onload = function (e) {
// 		    $("#preview_progressbarTW_img").attr('src', e.target.result);//读取的结果放入圖片
// 		  };
		      
// 		  // 使用 readAsDataURL 將圖片轉成 Base64
// 		  fr.readAsDataURL(file);
// 		});
	

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
		 	  $("#preview_progressbarTW_img").attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
}
</script>
</head>
<body>
<nav>
<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
</nav>

	<div align="center" style="margin-top:100px;">
		<h2>商品內容</h2>
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
				<td>${oneItem.categoryNo}</td>
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
				<td colspan="2">
					PK :${oneItem.itemPk}
					<img style="width:300px;height:200px;" id="preview_progressbarTW_img2" src="#" />
				</td>
				<td colspan="2">
					<img style="width:300px;height:200px;" id="preview_progressbarTW_img" src="<c:url value='/getPicture/${oneItem.itemPk}' />" />
					<span id="imgspan"></span>
				</td>
			</tr>
			<tr>
				<td  colspan="4">
					<input type="submit" name="submit" id="submit" value="送出">
					<a href="<c:url value='/downloadPicture/${oneItem.itemPk}' />">下載圖片</a>
				</td>
			</tr>
		</table>
	</form:form>
	</div>
</body>
</html>