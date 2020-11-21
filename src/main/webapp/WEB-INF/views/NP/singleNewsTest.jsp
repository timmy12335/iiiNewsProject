<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>已購買新聞</title>
   <style>
.all-browsers {
  margin: 0;
  padding: 5px;
  background-color: white;
   border-radius:15px; 
  
}

.all-browsers > h1, .browser {
  margin: 6px;
  padding: 5px;
}

.browser {
  background: white;
}

.browser > h2, p {
  margin: 4px;
  font-size: 90%;
}
.shadow0{
  box-shadow: 4px 4px 4px #9D9D9D;
}
p{
  margin: 3px;
  font-size: 1em;
}

</style>
<script>
	//列印PDF
	function printdiv(printpage) {
		var newstr = printpage.innerHTML;
		var oldstr = document.body.innerHTML;
		document.body.innerHTML = newstr;
		window.print();
		document.body.innerHTML = oldstr;
		return false;
	}
	window.onload = function() {
		var bt = document.getElementById("bt");
		var div_print = document.getElementById("div_print");
		bt.onclick = function() {
			printdiv(div_print);
		}
	}
	
	//從後端得到JSON檔
	function tableToExcel(json){
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/getOrderedSingleNews.json/' />" + json, true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 ) {
			if (xhr.status == 200){
				var responseData = xhr.responseText;
				console.log(responseData);
				var jsonData = [responseData];
				//列標題，逗號隔開，每一個逗號就是隔開一個單元格
		          let str = "";
		          //增加\t為了不讓表格顯示科學計數法或者其他格式
		          for(let i = 0 ; i < jsonData.length ; i++ ){
		            for(let item in jsonData[i]){
		            	if(jsonData[i][item]==",")
		            		str+= jsonData[i][item]+"\n" ;
		            	else
		            		str+= jsonData[i][item];
		            }
		            str+='\n';
		          }
		          //encodeURIComponent解決中文亂碼
		          let uri = 'data:text/csv;charset=utf-8,\ufeff' + encodeURIComponent(str);
		          //通過建立a標籤實現
		          var link = document.createElement("a");
		          link.href = uri;
		          //對下載的檔案命名
		          link.download =  json+".json";
		          document.body.appendChild(link);
		          link.click();
		          document.body.removeChild(link);
				  
			} else {
				alert(xhr.status);
			}
		}
	}
}
	
	//從後端得到WORD檔
	function tableToWord(word){
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/getOrderedSingleNews.json/' />" + word, true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 ) {
			if (xhr.status == 200){
				var responseData = xhr.responseText;
				console.log(responseData);
				var jsonData = [responseData];
				//列標題，逗號隔開，每一個逗號就是隔開一個單元格
		          let str = "";
		          //增加\t為了不讓表格顯示科學計數法或者其他格式
		           for(let i = 0 ; i < jsonData.length ; i++ ){
		            for(let item in jsonData[i]){
		            	if(jsonData[i][item]==",")
		            		str+= jsonData[i][item]+"\n" ;
		            	else
		            		str+= jsonData[i][item];
		            }
		           str+='\n';
		         }     
		          //encodeURIComponent解決中文亂碼
		          let uri = 'data:text/csv;charset=utf-8,\ufeff' + encodeURIComponent(str);
		          //通過建立a標籤實現
		          var link = document.createElement("a");
		          link.href = uri;
		          //對下載的檔案命名
		          link.download =  word +".doc";
		          document.body.appendChild(link);
		          link.click();
		          document.body.removeChild(link);
				  
			} else {
				alert(xhr.status);
			}
		}
	}
}
	
</script>
</head>
<body>
	<nav class="navbar fixed-top">
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<div class="container-sm"  >

		<div  style="margin-top: 100px;">
		<div align="center">
			<h1>已購買新聞</h1>
			
		</div>
			<div  id="div_print" class="shadow0" style="background-color:lightpink;border-radius:15px;margin-bottom:80px">
				<div class="row">
					<div class="col-sm-6 p-5" >
					<img class="shadow0" style="border:5px white solid ;border-radius:15px;margin-left:70px" width='450' height='280' src="<c:url value='/getOrderedNewsPicture/${ newsSingle.newsId }'/>">
					</div>
					<div class="col-sm-6 p-5 " align="left">
					<div class="p-2 shadow0" style="background-color:white;border-radius:15px;margin-right:15px">
						<p><b>${ newsSingle.newsId }</b></p>
						<p>上傳時間：${fn:substring(newsSingle.uploadTime,0,19)}</p>
						<p>新聞類型: ${ newsSingle.newsType }</p>
						<p>發生時間: ${ newsSingle.happenDate }&ensp;${ newsSingle.happenTime }</p>
						<p>發生地點: ${ newsSingle.location }</p>	
						<br>											
<!-- 						<span class="text-danger" style="font-size:35px;margin:10px"> -->
<!-- 							<b>NT$${newsSingle.price} </b> -->
<!-- 						</span>		 -->
						<button class="btn btn-danger btn-lg" name="print" id="bt" >
						<i class="far fa-file-pdf"></i>&ensp;PDF下載
						</button>	
						<button class="btn btn-info btn-lg" onclick='tableToExcel("${ newsSingle.newsId }")' >
						<i class="far fa-file-alt"></i>&ensp;JSON下載
						</button>	
						<button class="btn btn-primary btn-lg" onclick='tableToWord("${ newsSingle.newsId }")' >
						<i class="far fa-file-word"></i>&ensp;Word下載
						</button>			
											
						</div>
						
						</div>
				</div>
				
				<div class="row " >
					<div class="col-sm-11 " style="margin:0 auto;">
						<article class="all-browsers shadow0">
							
							<article class="browser ">
								<h4 class="text-danger"><b>標題</b></h4>
								<h6>${ newsSingle.title }</h6>
							</article>
							<article class="browser">
								<h4 class="text-danger"><b>大綱</b></h4>
								<h6>${ newsSingle.outline }</h6>
							</article>
							<article class="browser">
								<h4 class="text-danger"><b>內文</b></h4>
								<p>${ newsSingle.article }</p>
							</article>
						</article>
						<div align="center" style="margin:50px;">
					
						</div>
					</div>
					
				</div>
				
			</div>
		</div>
		<div align=center style="margin-bottom:50px">
			<a href="#" onclick="history.back()" class="btn btn-secondary btn-lg">						
				<i class="fas fa-arrow-alt-circle-left"></i>&ensp;回列表</a>	
		</div>
	</div>

</body>
</html>