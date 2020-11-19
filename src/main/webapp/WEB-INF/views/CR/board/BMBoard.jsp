<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台管理-公佈欄新增確認</title>
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
		<h3>公告欄管理</h3>
		<div class="row align-items-center">
			
	        <div class="col-md-4">
				<div class="form-group row">
					<label class="col-sm-4 col-form-label ">公佈欄搜尋：</label>
					<div class="col-sm-8">
						<input type="text" class="form-control form-control-sm" id="wordChoose" onkeyup="searchByWord()"/>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group row">
				
					<label class="col-sm-4 col-form-label">公告類別：</label>
					<div class="col-sm-8">
						<select id="isstay" onchange="searchByisStay()" class="form-control form-control-sm">
							<option value="1">重要</option>
							<option value="0">一般</option>
							<option value="-1">全部</option>
				         </select>
			         </div>
			    </div>
         	</div>
         	<div class="col-md-4">
         		<div class="form-group row">
					<label class="col-sm-4 col-form-label">發表日期：</label>
					<div class="col-sm-8">
						<input type="date" id="dateChoose" onchange="searchByDate()" class="form-control form-control-sm"/>
					</div>
				</div>
         	</div>
        </div>
        <a href=<c:url value='/addboard'/>><button class='btn btn-primary btn-icon-text' id='add'>新增公告內容</button></a>
		<div id='somedivS'></div>
		<div id='navigation'></div>
		<hr>
		<button onclick='history.back()' class="btn btn-primary">回前頁</button>
	</div>
	<jsp:include page="/fragment/BMfoot.jsp"></jsp:include>
	
	<script>
	
	function transisstay(isstay){
		if(isstay == 0){
			isstay = "離職";
		}else if(isstay == 1){
			isstay = "在職";
		}else{
			isstay = "未在線";
		}
		return isstay;
	}
	

	function displayPageEmps(responseData){
		var origincontent = "<table class='table table-primary'><thead><tr><th width='60px'>公告編號</th>";
		origincontent +=  "<th>主題</th>";
		origincontent +=  "<th width='80px'>發表者</th>";
		origincontent +=  "<th width='80px'>觀看人數</th>";
		origincontent +=  "<th width='80px'>發表日期</th>";
		origincontent +=  "<th>功能></th></tr></thead>";
			var emp = JSON.parse(responseData);		// 傳回一個陣列
			var bgColor = "";   // 每一項商品的背影 
			for(var i=0; i < emp.length; i++){
				content += "<tr height='80'>" + 
// 							"<td class='text-center'>" + (i+1) + "&nbsp;</td>" + 
				           	"<td class='text-center'>" + emp[i].boardpk + "&nbsp;</td>" + 
			               	"<td class='text-center'>[" +bdCatagory+"]"+ emp[i].bdTitle + "</td>" +
			               	"<td class='text-center'>" + emp[i].bdAuthor + "</td>" +
			               	"<td class='text-center'>" + emp[i].watchamt + "&nbsp;</td>" +
			               	"<td class='text-center'>" + emp[i].publishDate + "</td>" +
			               	"<button onclick='show("+(i)+")' type='button' class='btn btn-info'>修改<i class='ti-pencil-alt'></i></button><br>"+
			               	"<button onclick='deleteCrReport("+ emp[i].boardpk +")' type='button' class='btn btn-danger btn-icon-text'>刪除<i class='ti-trash btn-icon-append'></i></button>"+
			               	
// 			               	"<form action='"+"<c:url value='/addProductToCart' />"+"'method="+"'POST'>" +
// 							"<input type='hidden' name='quantity' value='1'>" + 
// 							"<input type='hidden' name='adPk' value='"+ad[i].adPk+"'>" + 
// 							"<input type='submit' class='cartBtn' value='加入購物車' /></form>" + 
							"</td></tr>" +
							"<tr height='80' style='display:none;' id=up"+(i)+">"+
							"<td class='text-center'><input type='text' size='3' name='empPk' id=emppk"+(i) +" value="+ emp[i].empPk + " disabled></td>" +
							"<td class='text-center'><input type='text' size='6' name='empName' id=empName"+(i)+" value=" + emp[i].empName + " ></td>" +
			               	"<td class='text-center'><input type='text' size='20' name='empId' id=empId"+(i)+" value=" + emp[i].empId + "></td>" +
			               	"<td class='text-center'><input type='text' size='20' name='email' id=empemail"+(i)+" value=" + emp[i].empemail + "></td>" +
			               	"<td></td><td></td><td></td>"+
			               	"<td class='text-center'><button onclick='send("+i+")' type='button' class='btn btn-info'>確認修改<i class='ti-pencil-alt'></i></button></td>"+
			               	"<td></td>"
			               	"</tr>";
				      
			}
			content += "</table>";
			document.getElementById("somedivS").innerHTML = content;
	}
	
	function searchByisStay(){
		let no = document.getElementById("isstay").value;
	
		var queryString = "?isstay=" + no;
		console.log(queryString);
		var xhr0 = new XMLHttpRequest();
		xhr0.open("GET", "<c:url value='/creemployee' />" + queryString , true);
		xhr0.send();
		
		xhr0.onreadystatechange = function() {
			if (xhr0.readyState == 4 && xhr0.status == 200) {
				var responseData = xhr0.responseText;
				displayPageEmps(responseData);
			}
		}
	}
	
	function searchByDate(){
		let no = document.getElementById("dateChoose").value;
		
		var queryStringDate = "?date=" + no;
		console.log(queryStringDate);
		var xhr0 = new XMLHttpRequest();
		xhr0.open("GET", "<c:url value='/getempByDate' />" + queryStringDate , true);
		xhr0.send();
		
		xhr0.onreadystatechange = function() {
			if (xhr0.readyState == 4 && xhr0.status == 200) {
				var responseData = xhr0.responseText;
				displayPageEmps(responseData);
			}
		}
	}
	
	function searchByWord(){
		let word = document.getElementById("wordChoose").value;
		
		var queryStringWord = "?word=" + word;
		console.log(queryStringWord);
		var xhr0 = new XMLHttpRequest();
		xhr0.open("GET", "<c:url value='/getEmpByWord' />" + queryStringWord , true);
		xhr0.send();
		
		xhr0.onreadystatechange = function() {
			if (xhr0.readyState == 4 && xhr0.status == 200) {
				var responseData = xhr0.responseText;
				displayPageEmps(responseData);
			}
		}
	}
	
	function deleteCrReport(emppk){
		var xhr2 = new XMLHttpRequest();
		
		var result=confirm("確定刪除此筆(單號:"+emppk+")?");
		if(result){
			xhr2.open("DELETE","<c:url value='/allemployee/'/>"+emppk,true);
			xhr2.setRequestHeader("Content-Type","application/json;charset=UTF-8");
			xhr2.send();
			xhr2.onreadystatechange=function(){
			if (xhr2.readyState == 4 && (xhr2.status == 200 || xhr2.status == 204) ) {
		      result = JSON.parse(xhr2.responseText);
		      if (result.fail) {		    	  
				 		divResult.innerHTML = "<font color='red' >"
							+ result.fail + "</font>";
			  		} else if (result.success) {
			  			loading();			
			}
		}	
	}
	}
	}
	
	function returnCrReport(emppk){
		var xhr2 = new XMLHttpRequest();
		var queryStringWord = "?pk=" + emppk;
		var result=confirm("回覆為在職(編號:"+emppk+")?");
		if(result){
			xhr2.open("Get","<c:url value='/returnemp'/>"+queryStringWord,true);
			xhr2.setRequestHeader("Content-Type","application/json;charset=UTF-8");
			xhr2.send();
			xhr2.onreadystatechange=function(){
			if (xhr2.readyState == 4 && (xhr2.status == 200 || xhr2.status == 204) ) {
		      result = JSON.parse(xhr2.responseText);
		      if (result.fail) {		    	  
				 		divResult.innerHTML = "<font color='red' >"
							+ result.fail + "</font>";
			  		} else if (result.success) {
			  			loading();			
			}
		}	
	}
	}
	}
	
	function send(emppk){
		var xhr2 = new XMLHttpRequest();
		var pk = document.getElementById("emppk"+emppk).value
		var empnameValue = document.getElementById("empName"+emppk).value;
		var empIdValue = document.getElementById("empId"+emppk).value;
		var empemailValue = document.getElementById("empemail"+emppk).value;
		var result=confirm("確定修改此筆客服表單(單號:"+pk+")?");
		if(result){
			xhr2.open("POST","<c:url value='/allemployee/'/>"+pk,true);
			xhr2.setRequestHeader("Content-Type","application/json;charset=UTF-8");
			var jsonReport = {
					"empPk": pk, 					
					"empId": empIdValue, 	
					"empName": empnameValue,
					"empemail":empemailValue
		   		}
			xhr2.send(JSON.stringify(jsonReport));
			xhr2.onreadystatechange=function(){
			if (xhr2.readyState == 4 && (xhr2.status == 200 || xhr2.status == 204) ) {
		      result = JSON.parse(xhr2.responseText);
		      console.log(result);
		      if (result.fail) {		    	  
					console.log("fail");
			  		} else if (result.success) {
// 							window.location.href="<c:url value='/allemployee'/>";						
						loading();
			  		}
		}	
	}
	}
	}
	
	function show(index){
		if(document.getElementById("up"+index).style.display =='none') {
			document.getElementById("up"+index).style.display='';
			}else{
				document.getElementById("up"+index).style.display='none';
			} 
		
	}
	</script>
	<script>
	window.onload=loading();
	function loading(){
	var origincontent = "<table class='table table-primary'><thead><tr><th width='60px'>公告編號</th>";
	origincontent +=  "<th>主題</th>";
	origincontent +=  "<th width='80px'>發表者</th>";
	origincontent +=  "<th width='80px'>觀看人數</th>";
	origincontent +=  "<th width='80px'>發表日期</th>";
	origincontent +=  "<th>功能></th></tr></thead>";
	origincontent +=  "<tr><td colspan='9'><b>請選擇欲搜尋的類別</b></td></tr></table>";
	document.getElementById("somedivS").innerHTML = origincontent;

	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/getboard' />" , true);
//		xhr.open("GET", "<c:url value='/getAdByAjax.json' />", true);
	xhr.send();

	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var responseData = xhr.responseText;
			displayPageEmps(responseData);
		}
	}
	}

</script>
</body>
</html>