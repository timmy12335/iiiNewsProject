<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>分頁新聞列表</title>
<style >
body {
  font-family: '微軟正黑體', sans-serif;
}
.container {
   max-width: 1300px; 
/*   margin-left: auto; */
/*   margin-right: auto; */
  padding-left: 10px;
  padding-right: 10px;
}

h2 {
  font-size: 26px;
  margin: 20px 0;
  text-align: center;
 
}
 li {
    border-radius: 3px;
    padding: 25px 30px;
    display: flex;
    justify-content: space-between;
    margin-bottom: 25px;
  }
 .table-header {
    background-color: lightpink;
    font-size: 20px;
    font-weight:bold;
    text-transform: uppercase;
    letter-spacing: 0.03em;
     box-shadow: 0px 0px 9px 0px rgba(0,0,0,0.5);
     text-align:center;
  }
.table-row {
    background-color: #ffffff;
    box-shadow: 0px 0px 9px 0px rgba(0,0,0,0.3);
    text-align:center;
  }
.table-row:hover{
    background-color: #F3F3F3;
  }
 .col-1 {
    flex-basis: 15%;
    
  }
 .col1-1-1{
 	color:red;
 	font-weight:bold;
 
 }
.col-2 {
    flex-basis: 35%;
    
  }
  .col-2-1 {
    font-weight:bold;
    
  }
 .col-3 {
    flex-basis: 15%;
  }
 .col-4 {
    flex-basis: 13%;
  }

 .col-5{
    flex-basis: 12%;
  }  
  .incss{
			width:150px;
 			height:45px; 
			
			font-size:20px;
			background-color:#BC214C;
			border:none;
			border-radius:10px;
			outline: none;
			box-shadow: 1px 1px 1px #9D9D9D;
			
			
		}
	.incss:hover{
			background-color:#e884a0;
			}
			
.astyle{
	color:white;
	text-decoration:none;
	position:relative;
	top:9px;
	
	}
</style>
<script>
window.onload=function(){

	//本網頁一開始時先向後端發出非同步請求：/ch04/_07/pagingBookData.json，要求第一頁 
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/getOrderMemNewsListByAjax.json' />", true);
	xhr.send();
	//***本網頁一開始時先向後端發出非同步請求：/ch04/_07/pagingBookData.json，要求第一頁 
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 ) {
			if (xhr.status == 200){
				var responseData = xhr.responseText;

				console.log(responseData);
				displayNewsOrderList(responseData);   // 顯示讀取到的非文字性資料
			} else {
				alert(xhr.status);
			}
		}
	}		   


	function displayNewsOrderList(responseData){
		  var content = "<ul> <li class='table-header'>";
		      content +=  " <div class='col col-1'>訂單編號</div><div class='col col-2'>新聞標題</div><div class='col col-3'>購買時間</div>";
		      content +=  " <div class='col col-4'>新聞編號</div><div class='col col-5'>&nbsp;&nbsp;&nbsp;&nbsp;金額</div></li>";	    
			  
			
			var newsOrderList = JSON.parse(responseData);		// 傳回一個陣列
				
			 
			for(var i=0; i < newsOrderList.length; i++){
				content += "<li class='table-row'>" + 
				           "<div class='col col-1 col1-1-1'>" + newsOrderList[i].orderId + "&nbsp;&nbsp;</div>" + 
			               "<div class='col col-2 col-2-1'>" + newsOrderList[i].newsBean.title + "</div>" +
			               "<div class='col col-3'>" + newsOrderList[i].soldTime + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>" +
			               "<div class='col col-4'>" + newsOrderList[i].newsId + "</div>" +
			               "<div class='col col-5'>" + newsOrderList[i].orderPrice + "</div>" +	 
			               
				           "</li>";  			           
			}
			content += " </ul><hr><div class='incss' ><a class='astyle' href='/iiiNews'>回前頁</a></div>";
			document.getElementById("somedivS").innerHTML = content;
			
		}
}
</script>
</head>
<body>
	<nav class="navbar fixed-top">
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<div align='center' style="margin-top: 150px;">
		<h2>會員${MBBean.memberId}訂單列表(JSON)</h2>
		<hr>
		<div class="container" id='somedivS'></div>
<!-- 		<div id='navigation' style='height: 60px; margin: 250px;'></div> -->
		
		
	</div>

</body>
</html>