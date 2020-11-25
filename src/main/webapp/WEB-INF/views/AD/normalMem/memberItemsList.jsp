<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>iiiNews 會員已購商品列表</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script>
	function status(num){
		console.log(num);
		let status = document.getElementById("statusTd");
		if(num == 0){
			var nopay = "<span class='text-danger'>未付款&nbsp;<i class='fas fa-exclamation-circle'></i></span>"
				nopay += "&nbsp;&nbsp;&nbsp;<a class='btn btn-danger' href='<c:url value='/checkoutOK.Pay/${AdOrderItems[0].adOrderBean.adOrderPk}' />'>前往付款</a>"
			status.innerHTML = nopay;
		}else if(num == 1){
			status.innerHTML = "<span class='text-success'>已付款&nbsp;<i class='fas fa-check-circle'></i></span>";
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

html {
	margin-left: calc(100vw - 100%);
	overflow-y: scroll;
}
</style>
</head>
<body onload="status(${orderInfo.paymentStatus})">
	<nav class="navbar fixed-top">
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>

	<div class="iiinewsContainer">
		<div class="container-fluid">
			<div class="row">
				<div class="col-3">
					<div class="card p-4">
						<h2>訂單詳細內容</h2>
						<p>訂單編號：${AdOrderItems[0].adOrderBean.adOrderNo}</p>
						<p>訂單成立時間：${fn:substring(AdOrderItems[0].adOrderBean.orderDate,0,19)}</p>
						<p>
							訂單狀態：<span id="statusTd"></span>
						</p>
						<a onclick="history.back()" href="#">回個人訂單列表</a>
					</div>
					<div class="card p-4" style="margin-top:30px;">
						<h2>預覽圖片</h2>
						<div align="center"><img style="width:300px;height:200px;" id="preview_img1" src="/iiiNews/img/preview_default.jpg" /></div>
					</div>
				</div>
				<div class="col-9">
					<div class="card p-4">
						<h2>商品列表</h2>
						<c:if test="${not empty FlashMSG_uploadPictureSuccess}">
 	   						<span class="text-danger"><b>${FlashMSG_uploadPictureSuccess}</b></span>
 						</c:if>
						<div>
							<table class="table">
								<thead class='thead-light text-center'>
									<tr>
										<td>廣告編號</td>
										<td>賣家</td>
										<td>廣告日期</td>
										<td>欄位分類</td>
										<td>寬</td>
										<td>高</td>
										<td>單價</td>
										<td>設定</td>
									</tr>
								</thead>
								<c:forEach var="items" items="${AdOrderItems}" varStatus="loop">
									<tr>
										<td>${items.adNo}</td>
										<td>${items.sellerMemberId}</td>
										<td>${items.adDate}</td>
										<td><c:choose>
												<c:when test="${items.categoryNo == 100}">A&nbsp;頭版頁首</c:when>
												<c:when test="${items.categoryNo == 200}">B&nbsp;頭版側標</c:when>
												<c:when test="${items.categoryNo == 300}">C&nbsp;內頁頁首</c:when>
												<c:when test="${items.categoryNo == 400}">D&nbsp;內頁側標</c:when>
												<c:when test="${items.categoryNo == 500}">E&nbsp;內文小廣告</c:when>
												<c:otherwise>其他</c:otherwise>
											</c:choose>
										</td>
										<td>${items.width}</td>
										<td>${items.height}</td>
										<td>${items.unitPrice}</td>
										<td>
<%-- 											<c:if test="${orderInfo.paymentStatus == 1}"> --%>
<%-- 												<a href="<c:url value="/getOneItem/${items.itemPk}" />" --%>
<!-- 													onclick="return confirm('Are you sure?')">前往上傳照片</a> -->
<%-- 											</c:if> --%>

											<button class="btn btn-primary" type="button"
												data-toggle="collapse" data-target=".multi-collapse${loop.index}"
												aria-expanded="false" aria-controls="setAd${loop.index} setPic${loop.index}">
												前往上傳照片&nbsp;<i class="fas fa-angle-double-down"></i>
											</button></td>

									</tr>
									<!-- collapse -->
									<tr class="collapse multi-collapse${loop.index}" id="setAd${loop.index}">
										<td colspan='10'>
											<div class="row justify-content-around">
												<form method="POST" action="<c:url value='/getOneItem/${items.itemPk}' />" enctype="multipart/form-data">
<!-- 												<input type="file" id="productImage"> -->
													<div class="input-group">
														<div class="custom-file">
															<input type="file" class="custom-file-input form-control-lg" id="productImage${loop.index}" name="productImage" onchange=change(${loop.index})  style="text-overflow:hidden;">
															<label class="custom-file-label" for="filename" id="filename${loop.index}">
															<i class="fas fa-cloud-upload-alt" aria-hidden="true"></i>&nbsp;請選擇檔案</label>
														</div>
														<div class="input-group-append">
															<button class="btn btn-primary" type="submit" name="submit" id="submit">送出</button>
														</div>
													</div>
												</form>
											</div>
										</td>
									</tr>
									<tr class="collapse multi-collapse${loop.index}" id="setPic${loop.index}">
										<td colspan='10'>
										<div>
										<div style="display:inline-block;"><span>高：${items.height}&nbsp;px</span></div>
										<div style="display:inline-block;"><img style="width:${items.width}px;height:${items.height}px;border:3px dashed #BC214C" id="preview_img${loop.index}" class="blah" src="<c:url value='/getPicture/${items.itemPk}' />" /></div>
										<div><span style="padding-left:${(items.width/2)+30}px">寬：${items.width}&nbsp;px</span></div>
										</div>
										</td>
									</tr>

									<!-- collapse -->
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>


<!-- 			<div align="center"><img style="width:300px;height:200px;" id="preview_img1" src="#" /></div> -->
			<hr>

			<!-- container -->
		</div>
	</div>
<script type="text/javascript">
	function change(num) {
		console.log($("#productImage"+num).val());
		var name = $("#productImage"+num).val()
		var fileName = name.substring(name.lastIndexOf('\\') + 1);
		console.log("fileName:"+ fileName);
		$("#filename"+num).html(fileName);
		readURL($("#productImage"+num));
		var selectedFile = $("#productImage"+num).get(0).files[0];
		console.log("selectedFile:"+ selectedFile);
	}

	function readURL(input){
		if(input.get(0).files[0]){
			console.log("OMG")
			var reader = new FileReader();
			reader.onload = function (e) {
		 	  $("#preview_img1").attr('src', e.target.result);
			}
			reader.readAsDataURL(input.get(0).files[0]);
		}
	}
	
	
	
</script>
</body>
</html>