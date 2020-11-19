<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後臺管理 廣告商品列表</title>
<script>
window.onload=function(){
	var origincontent = "<table class='table table-striped'><thead><tr><th>序號</th>";
	origincontent +=  "<th>廣告PK值</th><th>廣告編號</th>";
    origincontent +=  "<th>刊登者</th>";
    origincontent +=  "<th>類型</th><th align='center'>販賣日期</th><th>單價</th>";
    origincontent +=  "<th>上架狀態</th><th>備註</th>";
    origincontent +=  "<th>編輯</th></tr></thead>";
	origincontent +=  "<tr><td colspan='9'><b>請選擇欲搜尋的類別</b></td></tr></table>";
	document.getElementById("somedivS").innerHTML = origincontent;
	
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/getAdByCateNoAjax.json' />" + "?set=ALL", true);
// 	xhr.open("GET", "<c:url value='/getAdByAjax.json' />", true);
	xhr.send();
	
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var responseData = xhr.responseText;
			displayPageAds(responseData);
		}
	}
}
</script>
<style>
/* 	html{ */
/* 		margin-left:calc(100vw - 100%); */
/* 		overflow-y: scroll; */
/* 	} */
</style>
</head>
<body>
<jsp:include page="/fragment/BMnav.jsp"></jsp:include>

	
	<div class='card-body'>
		<h3>後臺管理 廣告商品列表(AJAX JSON)</h3>
		<br>
		<div class="row align-items-center">
			
	        <div class="col-md-4">
				<div class="form-group row">
					<label class="col-sm-4 col-form-label ">關鍵字搜尋：</label>
					<div class="col-sm-8">
						<input type="text" class="form-control form-control-sm" id="wordChoose" onkeyup="searchByWord()"/>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group row">
					<label class="col-sm-4 col-form-label">分類搜尋：</label>
					<div class="col-sm-8">
						<select id="cateChoose" onchange="searchBycateNo()" class="form-control form-control-sm">
							<option value="-1">全部</option>
							<option value="100">頭版頭</option>
							<option value="200">頭版側標</option>
							<option value="300">內頁版頭</option>
							<option value="400">內頁側標</option>
							<option value="500">小廣告</option>
				         </select>
			         </div>
			    </div>
         	</div>
         	<div class="col-md-4">
         		<div class="form-group row">
					<label class="col-sm-4 col-form-label">日期搜尋：</label>
					<div class="col-sm-8">
						<input type="date" id="dateChoose" onchange="searchByDate()" class="form-control form-control-sm"/>
					</div>
				</div>
         	</div>
        </div>
		<div id='somedivS'></div>
		<div id='navigation'></div>
		<hr>
		<a href='..'>回前頁</a>
	</div>
	<jsp:include page="/fragment/BMfoot.jsp"></jsp:include>
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
			status = "<label class='badge badge-warning'>下架</label>";
		}else if(status == 1){
			status = "<label class='badge badge-success'>上架中</label";
		}else{
			status = "<label class='badge badge-danger'>其他</label>";
		}
		return status;
	}
	

	function displayPageAds(responseData){
		  var content = "<table class='table table-striped'><thead><tr><th>序號</th>";
		      content +=  "<th class='text-center'>廣告PK值</th><th class='text-center'>廣告編號</th>";
		      content +=  "<th class='text-center'>刊登者</th>";
		      content +=  "<th class='text-center'>類型</th><th class='text-center'>販賣日期</th><th class='text-center'>單價</th>";
		      content +=  "<th class='text-center'>上架狀態</th><th class='text-center'>備註</th>";
			  content +=  "<th class='text-center'>編輯</th></tr></thead>";
			var ad = JSON.parse(responseData);		// 傳回一個陣列
			var bgColor = "";   // 每一項商品的背影 
			for(var i=0; i < ad.length; i++){		
				bgColor = (i % 2 == 0 ? "#d4f5b2" : "#b2f5e5");
				content += "<tr height='80' bgcolor='" + bgColor + "'>" + 
							"<td class='text-center'>" + (i+1) + "&nbsp;</td>" + 
				           	"<td class='text-center'>" + ad[i].adPk + "&nbsp;</td>" + 
			               	"<td class='text-center'>" + ad[i].adNo + "</td>" +
			               	"<td class='text-center'>" + ad[i].memberName + "</td>" +
			               	"<td class='text-center'>" + cateNameTrans(ad[i].categoryNo) + "&nbsp;</td>" +
			               	"<td class='text-center'>" + ad[i].adDate + "</td>" +
			               	"<td class='text-right'>" + "NT$ " + ad[i].price + "</td>" +
			               	"<td class='text-center'>" + statusTrans(ad[i].status) + "</td>" + 
			               	"<td class='text-center'>" + ad[i].statement + "</td>" + 
			               	"<td class='text-center'>" +
			               	"<button onclick='delfunction("+ad[i].adPk+")' type='button' class='btn btn-danger btn-rounded btn-icon'><i class='ti-trash'></i></button>&nbsp;"+
			               	"<button onclick='offshelf("+ad[i].adPk+")' type='button' class='btn btn-warning btn-rounded btn-icon'><i class='ti-hummer'></i></button>"+
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
	
	function searchBycateNo(){
		let no = document.getElementById("cateChoose").value;
	
		var queryString = "?cateNo=" + no+"&set=ALL";
		console.log(queryString);
		var xhr0 = new XMLHttpRequest();
		xhr0.open("GET", "<c:url value='/getAdByCateNoAjax.json' />" + queryString , true);
		xhr0.send();
		
		xhr0.onreadystatechange = function() {
			if (xhr0.readyState == 4 && xhr0.status == 200) {
				var responseData = xhr0.responseText;
				displayPageAds(responseData);
			}
		}
	}
	
	function searchByDate(){
		let no = document.getElementById("dateChoose").value;
		
		var queryStringDate = "?date=" + no+"&set=ALL";
		console.log(queryStringDate);
		var xhr0 = new XMLHttpRequest();
		xhr0.open("GET", "<c:url value='/getAdByDateAjax.json' />" + queryStringDate , true);
		xhr0.send();
		
		xhr0.onreadystatechange = function() {
			if (xhr0.readyState == 4 && xhr0.status == 200) {
				var responseData = xhr0.responseText;
				displayPageAds(responseData);
			}
		}
	}
	
	function searchByWord(){
		let word = document.getElementById("wordChoose").value;
		console.log(word);
		
		var queryStringWord = "?word=" + word+"&set=ALL";
		console.log(queryStringWord);
		var xhr0 = new XMLHttpRequest();
		xhr0.open("GET", "<c:url value='/getAdByWordAjax.json' />" + queryStringWord , true);
		xhr0.send();
		
		xhr0.onreadystatechange = function() {
			if (xhr0.readyState == 4 && xhr0.status == 200) {
				var responseData = xhr0.responseText;
				displayPageAds(responseData);
			}
		}
	}
	
	function delfunction(pk){
		if (confirm("確定刪除此項商品 ? ") ) {
			location.href="deleteAdProduct/"+pk
		} else {
			;
		}
	}
	
	function offshelf(pk){
		if (confirm("確定下架此項商品 ? ") ) {
			location.href="offShelfAdProduct/"+pk
		} else {
			;
		}
	}
	
	</script>
</body>
</html>