<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>使用者文章管理</title>
<script>
	window.onload = function() {

		var queryStringAllArt = "?statusNo=" + "&set=ALL";
		console.log(queryStringAllArt);
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/getArtStatusAjax.json' />" + queryStringAllArt, true);
		xhr.send();

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var responseData = xhr.responseText;
				displayPageAllArt(responseData);
			}
		}
	}
</script>
<style>
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 90%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:hover {background-color: #ECF5FF;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #0066CC;
  color: white;
}

td {
	padding: 3px;
	 text-align:center; 
	 valign:middle;'
}

.td1 {
	width: 150px;
	word-break: break-all;
	margin: 5px;
	font-weight: "bold";
}
</style>
</head>
<body>

	<jsp:include page="/fragment/BMnav.jsp"></jsp:include>

	<div align="center">
		<div align="center" style="margin-top: 30px;">
			<h2>所有文章</h2>
		</div>
		<hr>

		<div>
			<select id="cateChoose" onchange="searchBycateNo()">
				<option value="-1">文章總覽</option>
				<option value="1">在線文章</option>
				<option value="0">已下架文章</option>
			</select><hr>
		</div>

		<div id='somedivS'></div>
		<div id='navigation'></div>
		<hr>
		<a href="<c:url value="" />">-----TOP-----</a><br><br>
	</div>
	<jsp:include page="/fragment/BMfoot.jsp"></jsp:include>

	<script>
// 	window.onload=function(){
		function cateNameTrans(status) {
			if (status == 1) {
				cateName = "在線文章";
			} else if (status == 0) {
				cateName = "已下架文章";
			}
			return cateName;
		}

		function displayPageAllArt(responseData) {
			var content = "<table id='customers'>";
				content += "<tr><th style='vertical-align: inherit;'>PK</th><th style='vertical-align: inherit;'>文章編號</th>";
				content += "<th>發文者</th><th>上傳日期</th><th>文章狀態</th><th>類型</th><th>標題</th><th>圖片</th><th>內文</th><th>維護</th></tr>";
			var mtAll = JSON.parse(responseData); // 傳回一個陣列
			console.log(mtAll);
			
			if (mtAll == "") {
				content += "<tr><td colspan='10' align='center'><b>無搜尋結果</b></td></tr></table>";
			} else {
				for (var i = 0; i < mtAll.length; i++) {
					
					content +="<tr><td>&nbsp;" + mtAll[i].pkey + "&nbsp;</td>"
							+"<td>" + mtAll[i].articleId + "</td>"
							+"<td>" + mtAll[i].memberId + "</td><td width='10px' height='20px'>" + mtAll[i].updateDate + "</td>";
							if (mtAll[i].status == 1) {
								content += "<td><label class='badge badge-success'>可瀏覽</label></td>";
							} else {
								content += "<td><label class='badge badge-danger'>已下架</label></td>";
							}
// 							+"<c:if test='" + mtAll[i].status + "== 1'><td><label class='badge badge-success'>可瀏覽</label></td></c:if>"
// 							+"<c:if test='" + mtAll[i].status + "== 0'><td><label class='badge badge-danger'>已下架</label></td></c:if>"
							content += "<td>" + mtAll[i].category + "</td><td class='td1'>" + mtAll[i].title + "</td><td class='td1'>"
							+"<div id='Demo' class='demo'><img style='width:160px;height:90px' src='<c:url value='/getMtCreate/" + mtAll[i].articleId + "' />' />"
							+"</div></td><td class='td1'>" + mtAll[i].article + "</td><td><div align='center'>";
// 							+"</div>" + mtAll[i].imgName + "</td><td class='td1'>" + mtAll[i].article + "</td><td><div align='center'>";
// 							+"<a class='delSingle' href='${pageContext.request.contextPath}/delSingleArticle/" + mtAll[i].articleId + "'>";
							if (mtAll[i].status == 1) {
								content += "<a class='delSingle' onclick='delSingle()' href='<c:url value='/delSingleArticle/" + mtAll[i].articleId + "'/> '>刪除</a></tr>";
							} else {
								content += "<a>刪除</a></div></td></tr>";
							}
// 							+"<c:if test='" + mtAll[i].status + "== 0' ><a href='' ></a></c:if>刪除</a></div></td></tr>"
// 					console.log("mtAll[i].status:"+mtAll[i].status)
					
				}
			}
			content += "</table>";
			document.getElementById("somedivS").innerHTML = content;
			console.log("====content===="+content);
		}

		function searchBycateNo() {
			let no = document.getElementById("cateChoose").value;
			console.log(no);
			var queryString = "?statusNo=" + no + "&set=ALL";
			console.log(queryString);
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "<c:url value='/getArtStatusAjax.json' />" + queryString, true);
			xhr.send();

			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var responseData = xhr.responseText;
					displayPageAllArt(responseData);
				}
			}
		}
		
		
		function delSingle() {
			confirm('刪除此紀錄? ');
		}
		
// }
	</script>
</body>
</html>