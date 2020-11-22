<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>分頁廣告列表</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script>
// window.onload=function(){
// 	var origincontent = "<table border='1'><tr bgcolor='#fbdb98'><th>序號</th>";
// 	origincontent +=  "<th>廣告PK值</th><th>廣告編號</th>";
// 	origincontent +=  "<th>刊登者</th>";
// 	origincontent +=  "<th>類型</th><th>販賣日期</th><th>單價</th>";
// 	origincontent +=  "<th>備註</th>";
// 	origincontent +=  "<th>texting</th></tr>";
// 	origincontent +=  "<tr><td colspan='9' align='center'><b>請選擇欲搜尋的類別</b></td></tr></table>";
// 	document.getElementById("somedivS").innerHTML = origincontent;
	
// 	var xhr = new XMLHttpRequest();
// 	xhr.open("GET", "<c:url value='/getAdByAjax.json' />", true);
// 	xhr.send();
	
// 	xhr.onreadystatechange = function() {
// 		if (xhr.readyState == 4 && xhr.status == 200) {
// 			var responseData = xhr.responseText;
// 			displayPageAds(responseData);
// 		}
// 	}
// }
</script>
<style>
/*在此設定margin 以防止被navbar壓到*/
.iiinewsContainer {
	margin-top: 100px;
	margin-bottom: 100px;
	position: relative;
}
	.cartBtn {
	  background-color: #0066CC; /* Green */
	  border: none;
	  color: white;
	  padding: 5px 10px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 16px;
	}
	Html{
		margin-left:calc(100vw - 100%);
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
		<div class="col-3">
		<!-- Card -->
			<div class="card mb-3">
				<div class="card-header">
					<h4>條件搜尋</h4>
				</div>
				<div class="card-body">
					<label class="col-form-label">關鍵字查詢：</label>
					<input type="text" class="form-control" id="wordChoose" onkeyup="searchByWord()"/>
					<label class="col-form-label">按分類搜尋：</label>
					<select class="form-control" id="cateChoose" onchange="searchBycateNo()">
						<option value="-1">請選擇</option>
						<option value="100">頭版頭</option>
						<option value="200">頭版側標</option>
						<option value="300">內頁版頭</option>
						<option value="400">內頁側標</option>
						<option value="500">小廣告</option>
			         </select>
			         <label class="col-form-label">按日期搜尋：</label>
			         <input type="date" class="form-control" id="dateChoose" onchange="searchByDate()"/>
				</div>
			</div>
		<!-- Card -->
<!-- 			<div class="card mb-3"> -->
<!-- 			<h3>進階搜尋2</h3> -->
<!-- 			</div> -->
		</div>
		<div class="col-9">
			<div class="card">
				<div class="card-header">
					<h2>廣告欄位商品搜尋(JSON)</h2>
				</div>
			
			
<!-- 			<label>關鍵字查詢：</label> -->
<!-- 			<input type="text" class="search" id="wordChoose" onkeyup="searchByWord()"/> -->
<!-- 			<label>按分類搜尋：</label> -->
<!-- 			<select id="cateChoose" onchange="searchBycateNo()"> -->
<!-- 				<option value="-1">請選擇</option> -->
<!-- 				<option value="100">頭版頭</option> -->
<!-- 				<option value="200">頭版側標</option> -->
<!-- 				<option value="300">內頁版頭</option> -->
<!-- 				<option value="400">內頁側標</option> -->
<!-- 				<option value="500">小廣告</option> -->
<!-- 	         </select> -->
<!-- 	         <label>按日期搜尋：</label> -->
<!-- 	         <input type="date" id="dateChoose" onchange="searchByDate()"/> -->
<!-- 			<hr> -->

<!-- 			<h3>demo</h3> -->
			<table id="demo"></table>
			<hr>
			<h3>somedivS</h3>
			<div id='somedivS'></div>
			<hr>
	<!-- 		 style='height: 260px;' style='height: 60px; margin: 250px;' -->
			<h3>navigation</h3>
			<div id='navigation'></div>
			<hr>
			<a href='..'>回前頁</a>
			
			</div>
		</div>
		
		
		
		
	</div>
	
	
	<!--container  -->
	</div>
</div>	
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://unpkg.com/bootstrap-table@1.18.0/dist/bootstrap-table.min.js"></script>
<script>


var $table;
// 初始化bootstrap-table的內容

// $('#demo').bootstrapTable('destroy');
	
$table = $('#demo').bootstrapTable({
	  url: "<c:url value='/getAdByAjax.json' />",
	  method: 'GET',
	  striped: true,                      //是否顯示行間隔色
      cache: false,                       //是否使用緩存，預設為true，所以一般情況下需要設置一下這個屬性（*）
//       pagination: true,                   //是否顯示分頁（*）
      sortable: true,                     //是否啟用排序
      sortOrder: "asc",                   //排序方式
//       sidePagination: "server",           //分頁方式：client客戶端分頁，server服務端分頁（*）
//       pageNumber: 1,                      //初始化載入第一頁，預設第一頁,並記錄
//       pageList: [10, 25, 50, 100],        //可供選擇的每頁的行數（*）
      search: false,                      //是否顯示表格搜索
      strictSearch: true,
//       showColumns: true,                  //是否顯示所有的列（選擇顯C示的列）
      showRefresh: true,                  //是否顯示刷新按鈕
      minimumCountColumns: 2,             //最少允許的列數
//       clickToSelect: true,                //是否啟用點擊選中行
	formatLoadingMessage: function() {
        return '<b>廣告查詢</b>';
    },
      locale: "zh-TW",
	  columns: [{
	    field: 'adPk',
	    title: 'adPk'
	  }, {
	    field: 'adNo',
	    title: 'adNo'
	  }, {
	    field: 'memberName',
	    title: 'memberName'
	  }]
	});
$table.bootstrapTable('hideLoading');
	
	

</script>

	<script>
// 	function cateNameTrans(categoryNo) {
// 		if(categoryNo == 100){
// 			cateName = "頭版頭";
// 		}else if(categoryNo == 200){
// 			cateName = "頭版側標";
// 		}else if(categoryNo == 300){
// 			cateName = "內頁版頭";
// 		}else if(categoryNo == 400){
// 			cateName = "內頁側標";
// 		}else if(categoryNo == 500){
// 			cateName = "小廣告";
// 		}else{
// 			cateName = "其他";
// 		}
// 		return cateName;
// 	}
	

// 	function displayPageAds(responseData){
// 		  var content = "<table class='table'><tr bgcolor='#fbdb98'><th>序號</th>";
// 		      content +=  "<th>廣告PK值</th><th>廣告編號</th>";
// 		      content +=  "<th>刊登者</th>";
// 		      content +=  "<th>類型</th><th>販賣日期</th><th>單價</th>";
// 		      content +=  "<th>備註</th>";
// 			  content +=  "<th>texting</th></tr>";
// 			var ad = JSON.parse(responseData);		// 傳回一個陣列
// 			var bgColor = "";   // 每一項商品的背影 
// 			for(var i=0; i < ad.length; i++){		
// 				bgColor = (i % 2 == 0 ? "#d4f5b2" : "#b2f5e5");
// 				content += "<tr bgcolor='" + bgColor + "'>" + 
// 							"<td>" + (i+1) + "&nbsp;</td>" + 
// 				           	"<td>" + ad[i].adPk + "&nbsp;</td>" + 
// 			               	"<td>" + ad[i].adNo + "</td>" +
// 			               	"<td>" + ad[i].memberName + "</td>" +
// 			               	"<td>" + cateNameTrans(ad[i].categoryNo) + "&nbsp;</td>" +
// 			               	"<td>" + ad[i].adDate + "</td>" +
// 			               	"<td>" + "NT$ " + ad[i].price + "</td>" +
// 			               	"<td>" + ad[i].statement + "</td>" + 
// 			               	"<td>" +
// 			               	"<form action='"+"<c:url value='/addProductToCart' />"+"'method="+"'POST'>" +
// 							"<input type='hidden' name='quantity' value='1'>" + 
// 							"<input type='hidden' name='adPk' value='"+ad[i].adPk+"'>" + 
// 							"<input type='submit' class='cartBtn' value='加入購物車' />" + 
// 							"</form></td>" +
// 	//		               "<td><img  width='200' height='150' " +   
// 	//		               " src='../../ch00/util/GetImage?no=" + news[i].newsId + "'></td>" + 
// 				           "</tr>";  			           
// 			}
// 			content += "</table>";
//  			document.getElementById("somedivS").innerHTML = content;
// 	}
	
// 	function searchBycateNo(){
// 		let no = document.getElementById("cateChoose").value;
	
// 		var queryString = "?cateNo=" + no;
// 		console.log(queryString);
// 		var xhr0 = new XMLHttpRequest();
// 		xhr0.open("GET", "<c:url value='/getAdByCateNoAjax.json' />" + queryString , true);
// 		xhr0.send();
		
// 		xhr0.onreadystatechange = function() {
// 			if (xhr0.readyState == 4 && xhr0.status == 200) {
// 				var responseData = xhr0.responseText;
// 				displayPageAds(responseData);
// 			}
// 		}
// 	}
	
// 	function searchByDate(){
// 		let no = document.getElementById("dateChoose").value;
		
// 		var queryStringDate = "?date=" + no;
// 		console.log(queryStringDate);
// 		var xhr0 = new XMLHttpRequest();
// 		xhr0.open("GET", "<c:url value='/getAdByDateAjax.json' />" + queryStringDate , true);
// 		xhr0.send();
		
// 		xhr0.onreadystatechange = function() {
// 			if (xhr0.readyState == 4 && xhr0.status == 200) {
// 				var responseData = xhr0.responseText;
// 				displayPageAds(responseData);
// 			}
// 		}
// 	}
	
// 	function searchByWord(){
// 		let word = document.getElementById("wordChoose").value;
// 		console.log(word);
		
// 		var queryStringWord = "?word=" + word;
// 		console.log(queryStringWord);
// 		var xhr0 = new XMLHttpRequest();
// 		xhr0.open("GET", "<c:url value='/getAdByWordAjax.json' />" + queryStringWord , true);
// 		xhr0.send();
		
// 		xhr0.onreadystatechange = function() {
// 			if (xhr0.readyState == 4 && xhr0.status == 200) {
// 				var responseData = xhr0.responseText;
// 				displayPageAds(responseData);
// 			}
// 		}
// 	}
	
	</script>
</body>
</html>