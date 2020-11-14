<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有廣告列表</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" 
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style>
/*在此設定margin 以防止被navbar壓到*/
.iiinewsContainer {
	margin-top: 100px;
	margin-bottom: 100px;
	position: relative;
}
	html{
		margin-left:calc(100vw - 100%);
		overflow-y: scroll;
	}
</style>
<script>
window.onload=function(){
	
}
</script>
</head>
<body>
<nav class="navbar fixed-top">
<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
</nav>
<div class="iiinewsContainer">
	<div class="container-fluid">
		
		
		<div class="row">
			<div class="col-3">
				<div class="col-12 bg-white rounded shadow-sm p-3 mb-5">
					<h2>商業會員${CpAdLists[0].memberId}您好</h2>
					<h4>廣告列表專區</h4>
				</div>
			</div>
		  	<div class="col-9">
		  		<nav>
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Home</a>
				    	<a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Profile</a>
				    	<a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Contact</a>
				  	</div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
				<div class="container">
					<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
					<div class="card">
						<h3>總覽</h3>
						<div class="row">
							<div class="col-4">123</div>
							<div class="col-4">456</div>
							<div class="col-4">789</div>
						</div>
					</div>
					</div>
					<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
						<h3>您所有上傳的廣告列表</h3>
						<div class="table-responsive">
							<table class="table table-bordered">
							<thead>
								<tr>
									<td>產品編號</td>
									<td>上傳日期</td>
									<td>分類</td>
									<td>寬</td>
									<td>高</td>
									<td>欲販售日期</td>
									<td>單價</td>
									<td>上架狀態</td>
									<td>庫存</td>
									<td>設定</td>
								</tr>
							</thead>
							<tbody>
								<c:choose>
						            <c:when test="${empty CpAdLists}">
						            	<tr>
						            		<td colspan='10' align="center">您無上傳清單</td>
						            	</tr>
						            	<tr>
						            		<td colspan='10' align="center"><a href="<c:url value='/uploadAds' />">立即前往刊登吧</a></td>
						            	</tr>
						            </c:when>
						            <c:otherwise>
										<c:forEach var="ad" items="${CpAdLists}" varStatus="loop">
											<tr>
												<td>${ad.adNo}</td>
												<td>${fn:substring(ad.uploadDate,0,19)}</td>
												<td>
												<c:choose>
							                    	<c:when test="${ad.categoryNo == 100}">頭版頭</c:when>
													<c:when test="${ad.categoryNo == 200}">頭版側標</c:when>
													<c:when test="${ad.categoryNo == 300}">內頁版頭</c:when>
													<c:when test="${ad.categoryNo == 400}">內頁側標</c:when>
													<c:when test="${ad.categoryNo == 500}">小廣告</c:when>
													<c:otherwise>其他</c:otherwise>
												</c:choose>
												</td>
												<td>${ad.width}</td>
												<td>${ad.height}</td>
												<td>${ad.adDate}</td>
												<td>${ad.price}</td>
												<td>
													<c:if test="${ad.status == 0}">已下架</c:if>
													<c:if test="${ad.status == 1}">上架中</c:if>
												</td>
												<td>${ad.stock}</td>
											<td>
												<a href="<c:url value="#" />">修改</a>
						<%-- 						<a href="<c:url value="/deleteAdProduct/${ad.adPk}" />" onclick="return confirm('Are you sure?')">刪除</a> --%>
												<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#setAd${loop.index}" aria-expanded="false" aria-controls="collapseExample">
    											<i class="fas fa-angle-double-down"></i></button>
											</td>
											</tr>
											<tr class="collapse" id="setAd${loop.index}">
												<td colspan='10'>
												<form action='<c:url value="/updateAdProduct/"/>${ad.adPk}' method="POST" >
												<div class="row">
												<div class="col-6">
													寬：<input type="text" value="${ad.width}" class="form-control" id="widthchange${loop.index}" name="width" disabled><br>
													高：<input type="text" value="${ad.height}" class="form-control" id="heightchange${loop.index}" name="height" disabled><br>
												</div>
												<div class="col-6">
													價格：<input type="text" value="${ad.price}" class="form-control" id="pricechange${loop.index}" name="price" disabled><br>
													庫存：<input type="text" value="${ad.stock}" class="form-control" id="stockchange${loop.index}" name="stock" disabled><br>
												</div>
												<div class="col-12 text-center">
													<button type="button" class="btn btn-info" id="changeAdid" onclick="changeAd(${loop.index})">修改</button>
													<input type="submit" class="btn btn-primary" value="送出">
												</div>
												</div>
												</form>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								</tbody>
							</table>
						</div>
					</div>
					<div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
						<h3>已賣出列表</h3>
						
					</div>
					</div>
				</div>
		  	</div>
		</div>
	
	
	
	
	
	<div align="center" style="margin-top:100px;">
		<h2>商業會員${CpAdLists[0].memberId}您好<br>您所有上傳的廣告列表</h2>
		<a href="<c:url value='/' />">回首頁</a>
	</div>
	<span>${msgMap.addStatus}</span>
	<hr>
	<div align="center">
		<a>所有的上傳列表</a>&nbsp&nbsp&nbsp<a>賣出的商品列表</a>
	</div>
	<div align="center">
		<table border="1">
			<tr>
				<td>產品編號</td>
				<td>上傳日期</td>
				<td>分類</td>
				<td>寬</td>
				<td>高</td>
				<td>欲販售日期</td>
				<td>單價</td>
				<td>上架狀態</td>
				<td>庫存</td>
				<td>設定</td>
			</tr>
		<c:choose>
            <c:when test="${empty CpAdLists}">
            	<tr>
            		<td colspan='10' align="center">您無上傳清單</td>
            	</tr>
            	<tr>
            		<td colspan='10' align="center"><a href="<c:url value='/uploadAds' />">立即前往刊登吧</a></td>
            	</tr>
            </c:when>
            <c:otherwise>
				<c:forEach var="ad" items="${CpAdLists}">
					<tr>
						<td>${ad.adNo}</td>
						<td>${fn:substring(ad.uploadDate,0,19)}</td>
						<td>
						<c:choose>
	                    	<c:when test="${ad.categoryNo == 100}">頭版頭</c:when>
							<c:when test="${ad.categoryNo == 200}">頭版側標</c:when>
							<c:when test="${ad.categoryNo == 300}">內頁版頭</c:when>
							<c:when test="${ad.categoryNo == 400}">內頁側標</c:when>
							<c:when test="${ad.categoryNo == 500}">小廣告</c:when>
							<c:otherwise>其他</c:otherwise>
						</c:choose>
						</td>
						<td>${ad.width}</td>
						<td>${ad.height}</td>
						<td>${ad.adDate}</td>
						<td>${ad.price}</td>
						<td>
							<c:if test="${ad.status == 0}">已下架</c:if>
							<c:if test="${ad.status == 1}">上架中</c:if>
						</td>
						<td>${ad.stock}</td>
						<td>
							<a href="<c:url value="#" />">修改</a>
	<%-- 						<a href="<c:url value="/deleteAdProduct/${ad.adPk}" />" onclick="return confirm('Are you sure?')">刪除</a> --%>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
	</div>
	
	
	<!-- container -->>
	</div>
</div>
<script type="text/javascript">
function changeAd(index){
	$('#widthchange'+index).removeAttr("disabled");
	$('#heightchange'+index).removeAttr("disabled");
	$('#pricechange'+index).removeAttr("disabled");
	$('#stockchange'+index).removeAttr("disabled");
}
</script>


</body>
</html>