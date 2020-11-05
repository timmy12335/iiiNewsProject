<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>分頁廣告列表</title>
<style>
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
	<nav>
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<div align='center' style="margin-top: 150px;">
		<h3>分頁顯示(JSON)</h3>
		<input type="text" class="search" />
		<select id="cateChoose" onchange="myFunction()">
			<option value="none">分類項目</option>
			<option value="100">頭版頭</option>
			<option value="200">頭版側標</option>
			<option value="300">內頁版頭</option>
			<option value="400">內頁側標</option>
			<option value="500">小廣告</option>
         </select>
		<hr>
		<div id='somedivS'></div>
<!-- 		 style='height: 260px;' style='height: 60px; margin: 250px;' -->
		<div id='navigation'></div>
		<hr>
		<a href='..'>回前頁</a>
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
	

	function displayPageAds(responseData){
		  var content = "<table border='1'><tr height='42' bgcolor='#fbdb98'><th width='20' align='center'>序號</th>";
		      content +=  "<th width='50' align='center'>廣告PK值</th><th width='100' align='center'>廣告編號</th><th width='100' align='center'>上傳時間</th>";
		      content +=  "<th width='100' align='center'>類型</th><th width='100' align='center'>販賣日期</th><th width='100' align='center'>單價</th>";	    
			  content +=  "<th width='100' align='center'>texting</th></tr>";
			var ad = JSON.parse(responseData);		// 傳回一個陣列
			var bgColor = "";   // 每一項商品的背影 
			for(var i=0; i < ad.length; i++){		
				bgColor = (i % 2 == 0 ? "#d4f5b2" : "#b2f5e5");
				content += "<tr height='80' bgcolor='" + bgColor + "'>" + 
							"<td  align='center' >" + (i+1) + "&nbsp;</td>" + 
				           	"<td  align='center' >" + ad[i].adPk + "&nbsp;</td>" + 
			               	"<td>" + ad[i].adNo + "</td>" +
			               	"<td align='center'>" + ad[i].uploadDate + "</td>" +
			               	"<td align='right'>" + cateNameTrans(ad[i].categoryNo) + "&nbsp;</td>" +
			               	"<td align='center'>" + ad[i].adDate + "</td>" +
			               	"<td align='right'>" + "NT$ " + ad[i].price + "</td>" + 
			               	"<td align='center'>" +
			               	"<form action='"+"<c:url value='/addProductToCart' />"+"'method="+"'POST'>" +
							"<input type='hidden' name='quantity' value='1'>" + 
							"<input type='hidden' name='adPk' value='"+ad[i].adPk+"'>" + 
							"<input type='submit' class='cartBtn' value='加入購物車' />" + 
							"</form></td>" +
	//		               "<td><img  width='200' height='150' " +   
	//		               " src='../../ch00/util/GetImage?no=" + news[i].newsId + "'></td>" + 
				           "</tr>";  			           
			}
			content += "</table>";
			document.getElementById("somedivS").innerHTML = content;
	}
	
	function myFunction(){
		let no = document.getElementById("cateChoose").value;
		console.log(no);
	
		var queryString = "?cateNo=" + no;
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
	
	</script>
</body>
</html>