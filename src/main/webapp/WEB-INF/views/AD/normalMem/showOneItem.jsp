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
<body>
<nav class="navbar fixed-top">
<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
</nav>


<div class="iiinewsContainer">
	<div class="container-fluid">
	<!--container  -->
		<div class="row">
		
			<div class="col-12">
				<h2>上傳廣告圖片 </h2>
				<h2>編號：${oneItem.adNo} </h2>
				<a href="<c:url value='/' />">回首頁</a>
			</div>
		
		<hr>
			<div class="col-12">
				<div class="table">
					<form:form method="POST" modelAttribute="oneItem" enctype="multipart/form-data">
						<table class="table table-striped">
							<tr>
								<td>廣告編號</td>
								<td>廣告日期</td>
								<td>欄位分類</td>
								<td>寬</td>
								<td>高</td>
								<td>設定</td>
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
				                    <span id="imgspan"></span>
				                    <div class="file-field">
					                    <a class="btn btn-floating purple-gradient mt-0 float-left">
	      									<i class="fas fa-cloud-upload-alt" aria-hidden="true"></i>
	      									<input type="file">
	    								</a>
	    								<div class="file-path-wrapper">
									    	<input class="file-path validate" type="text" placeholder="Upload your file">
									    </div>
								    </div>
								    <input id="input-b1" name="input-b1" type="file" class="file" data-browse-on-zone-click="true">
								</td>
							</tr>
							<tr>
								<td  colspan="6">
									<input type="submit" name="submit" id="submit" value="送出">
									<c:if test="${!empty oneItem.adImageName}">
										<a href="<c:url value='/downloadPicture/${oneItem.itemPk}' />">下載圖片</a>
									</c:if>
								</td>
							</tr>
						</table>
					</form:form>
				</div>
			</div>
			<div class="col-9">
				<div class="card">
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