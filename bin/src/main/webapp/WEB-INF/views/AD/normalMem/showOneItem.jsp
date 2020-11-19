<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品內容</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
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
<script>
	function status(num){
		console.log(num);
		let status = document.getElementById("imgstatus");
		if(num == ""){
			var nopay = "<span class='text-danger'>尚未上傳&nbsp;<i class='fas fa-exclamation-circle'></i></span>"
			status.innerHTML = nopay;
		}else if(num != null){
			status.innerHTML = "<span class='text-success'>已上傳&nbsp;<i class='fas fa-check-circle'></i></span>";
		}else{
			status.innerHTML = "其他狀態";
		}
	}
</script>
<style>
/*在此設定margin 以防止被navbar壓到*/
.iiinewsContainer {
	margin-top: 100px;
	margin-bottom: 100px;
	position: relative;
}

Html {
	margin-left: calc(100vw - 100%);
}
</style>
</head>
<body onload="status('${oneItem.adImageName}')">
<nav class="navbar fixed-top">
<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
</nav>


<div class="iiinewsContainer">
	<div class="container-fluid">
	<!--container  -->
		<div class="row">
		
			<div class="col-3">
				<div class="card p-4">
					<h2>上傳廣告圖片 </h2>
					<p>編號：${oneItem.adNo} </p>
					<p>圖片上傳狀態：<span id="imgstatus"></span> </p>
					<p>
						<c:if test="${!empty oneItem.adImageName}">
							<a class="btn btn-primary" href="<c:url value='/downloadPicture/${oneItem.itemPk}' />">下載圖片</a>
						</c:if>
					</p>
					<a href="<c:url value='/' />">回首頁</a>
				</div>
			</div>
			<div class="col-9">
				<div class="card">
					<div class="card-header"><h3>詳細資料</h3></div>
					<div class="table">
						<form:form method="POST" modelAttribute="oneItem" enctype="multipart/form-data">
							<table class="table table-striped">
								<tr>
									<td>廣告編號</td>
									<td>廣告日期</td>
									<td>欄位分類</td>
									<td>寬</td>
									<td>高</td>
									<td>上傳照片</td>
								</tr>
								<tr>
									<td>${oneItem.adNo}</td>
									<td>${oneItem.adDate}</td>
									<td id="cate">
	<%-- 									<c:if test="${oneItem.categoryNo == 100}">頭版頭</c:if> --%>
	<%-- 									<c:if test="${oneItem.categoryNo == 200}">頭版側標</c:if> --%>
	<%-- 									<c:if test="${oneItem.categoryNo == 300}">內頁版頭</c:if> --%>
	<%-- 									<c:if test="${oneItem.categoryNo == 400}">內頁側標</c:if> --%>
	<%-- 									<c:if test="${oneItem.categoryNo == 500}">小廣告</c:if> --%>
										<c:choose>
											<c:when test="${oneItem.categoryNo == 100}">A&nbsp;頭版頁首</c:when>
											<c:when test="${oneItem.categoryNo == 200}">B&nbsp;頭版側標</c:when>
											<c:when test="${oneItem.categoryNo == 300}">C&nbsp;內頁頁首</c:when>
											<c:when test="${oneItem.categoryNo == 400}">D&nbsp;內頁側標</c:when>
											<c:when test="${oneItem.categoryNo == 500}">E&nbsp;內文小廣告</c:when>
											<c:otherwise>其他</c:otherwise>
										</c:choose>
									</td>
									<td>${oneItem.width}</td>
									<td>${oneItem.height}</td>
									<td>
					                    <label>上傳照片:</label>
					                    <input type="file" id="productImage" name="productImage">
					                    
<!-- 					                    <div class="input-group"> -->
<!-- 											<div class="custom-file"> -->
<!-- 											    <input type="file" class="custom-file-input" id="productImage" name="productImage"> -->
<!-- 											    <label class="custom-file-label" for="inputGroupFile04"><i class="fas fa-cloud-upload-alt" aria-hidden="true"></i>&nbsp;請選擇檔案</label> -->
<!-- 											</div> -->
<!-- 											<div class="input-group-append"> -->
<!-- 											    <button class="btn btn-primary" type="submit" name="submit" id="submit">送出</button> -->
<!-- 											</div> -->
<!-- 									  	</div> -->
					                    <span id="imgspan"></span>
					                    
									</td>
								</tr>
								<tr>
									<td  colspan="6">
										<c:if test="${!empty oneItem.adImageName}">
											<a href="<c:url value='/downloadPicture/${oneItem.itemPk}' />">下載圖片</a>
										</c:if>
									</td>
								</tr>
							</table>
						</form:form>
					</div>
				</div>
			</div>
			
			
			<div class="col-12" style="padding-top: 15px;">
				<div class="card">
					<div class="card-header"><h3>上傳畫面預覽</h3></div>
					<img style="width:300px;height:200px;" id="preview_img" src="<c:url value='/getPicture/${oneItem.itemPk}' />" />
				</div>
			</div>
			
		</div>
	
		
		
		
		
		
		
	<!-- container -->
	</div>
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