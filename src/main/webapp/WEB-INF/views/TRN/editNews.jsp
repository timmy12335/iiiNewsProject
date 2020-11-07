<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script>
var NewsId2 = ${NewsId};
var hasError = false;




window.onload = function() {
	var divResult = document.getElementById('resultMsg');
	var NewsId = document.getElementById("NewsId"); 
	var idLabel = document.getElementById("NewsIda");
	var title = document.getElementById("title");
	var ocplace = document.getElementById("ocplace");
	var octime = document.getElementById("octime");
	var founder = document.getElementById("founder");
	var type = document.getElementById("type");
	var xhr = new XMLHttpRequest();

	xhr.open("GET", "<c:url value='/editNews2/" + NewsId2 +" ' />", true);
	xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
	xhr.send();	
	var message = "";
	xhr.onreadystatechange = function() {
	 // 伺服器請求完成
	    if (xhr.readyState == 4 && xhr.status == 200) {
 		   var trkNewsBean = JSON.parse(xhr.responseText);
		   console.log(xhr.responseText);
 		   NewsId2.value = trkNewsBean.NewsId;
		   idLabel.innerHTML = trkNewsBean.NewsId2;
		   title.value = trkNewsBean.title;
		   ocplace.value = trkNewsBean.ocplace;
		   octime.value = trkNewsBean.octime;
		   founder.value = trkNewsBean.founder;
		   type.value = trkNewsBean.type;
	    }
     }
}



</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	1091105
	<div align='center'>
		<h2>修改會員資料</h2>
		<div id='resultMsg' style="height: 18px; font-weight: bold;"></div>
		<hr>
		<fieldset style='display: inline-block; width: 820px;'>
			<legend>請修改下列資料</legend>
			<input type="hidden" name="NewsId" id='NewsId'><br>
			<table border='1'>
				<tr height='60'>
					<td width='200'>&nbsp;</td>
					<td width='400'>&nbsp;帳號: <label id='NewsIda'></label><br>
					</td>
					<td width='200'>
						<div id='result0c' style="height: 10px;"></div> <br>
						<div id='result0s' style="height: 10px;"></div>
					</td>
				</tr>
				<tr height='60'>
					<td width='200'>&nbsp;</td>
					<td width='400'>&nbsp;標題: <input type="text" name="title"
						id='title'><br>
					</td>
					<td width='200' style="vertical-align: top">
						<div id='result1c' style="height: 10px;"></div> <br>
						<div id='result1s' style="height: 10px;"></div>
					</td>
				</tr>
				<tr height='60'>
					<td width='200'>&nbsp;</td>
					<td width='400'>&nbsp; 發生地點: <input type="text" name="ocplace"
						id='ocplace'><br>
					</td>
					<td width='200' style="vertical-align: top">
						<div id='result2c' style="height: 10px;"></div> <br>
						<div id='result2s' style="height: 10px;"></div>
					</td>
				</tr>
				<tr height='60'>
					<td width='200'>&nbsp;</td>
					<td width='400'>&nbsp;發生時間: <input type="text" name="octime"
						id='octime' size='24'>
					</td>
					<td width='200'>
						<div id='result3c' style="height: 10px;"></div> <br>
						<div id='result3s' style="height: 10px;"></div>
					</td>
				</tr>
				<tr height='60'>
					<td width='200'>&nbsp;</td>
					<td width='400'>&nbsp;建立人: <input type="text" name="founder"
						id='founder' size='24'>
					</td>
					<td width='200'>
						<div id='result3c' style="height: 10px;"></div> <br>
						<div id='result3s' style="height: 10px;"></div>
					</td>
				</tr>
				<tr height='60'>
					<td width='200'>&nbsp;</td>
					<td width='400'>&nbsp;類型: <input type="text" name="type"
						id='type' size='24'>
					</td>
					<td width='200'>
						<div id='result3c' style="height: 10px;"></div> <br>
						<div id='result3s' style="height: 10px;"></div>
					</td>
				</tr>
				<tr height='50'>
					<td colspan='3' align='center'>
						<button id='updateData'>更新</button>
						<button id='deleteData'>刪除</button>
					</td>
				</tr>
			</table>
		</fieldset>
		<hr>
		<p>
			<a href="<c:url value='/'  />">回前頁</a>
		<hr>
	</div>

</body>
</html>