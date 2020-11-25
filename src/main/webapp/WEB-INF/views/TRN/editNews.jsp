<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
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
	var tag = document.getElementById("tag");
	var descript = document.getElementById("descript");
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
		   console.log("Bean="+xhr.responseText);
		   console.log("tag="+trkNewsBean.tag);
 		   NewsId2.value = trkNewsBean.NewsId;
		   idLabel.innerHTML = trkNewsBean.NewsId2;
		   title.value = trkNewsBean.title;
		   ocplace.value = trkNewsBean.ocplace;
		   octime.value = trkNewsBean.octime;
		   founder.value = trkNewsBean.founder;
		   type.value = trkNewsBean.type;
		   tag.value = trkNewsBean.tag;
		   descript.value = trkNewsBean.descript;
	    }
     }
	console.log(NewsId2)
	
	var updateData = document.getElementById("updateData");
	var deleteData = document.getElementById("deleteData");
	
	 deleteData.addEventListener('click', (e)=> {
		 var result = confirm("確定刪除此筆記錄(帳號:" + NewsId2 + ")?");
		 if (result) {
			 var xhr2 = new XMLHttpRequest();
			 xhr2.open("DELETE", "<c:url value='/editNews3/' />" + NewsId2, true);
		   	 xhr2.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
		   	 xhr2.send();
		   	 xhr2.onreadystatechange = function() {
		   	// 伺服器請求完成
		   	if (xhr2.readyState == 4 && (xhr2.status == 200 || xhr2.status == 204) ) {
		   		result = JSON.parse(xhr2.responseText);
		   		if (result.fail) {
		   			divResult.innerHTML = "<font color='red'>"
						+ result.fail + "</font>";
		   		}else if (result.success) {
		   			window.location.href ="http://localhost:8080/iiiNews/trkNews";
		   		}
		   	}
		   	}
		 }
	 })
  
	  updateData.onclick = function() {
		  hasError = false;
		// 讀取欄位資料	
		  var titleValue = document.getElementById("title").value;
			var ocplaceValue = document.getElementById("ocplace").value;
			var founderValue = document.getElementById("founder").value;
			var typeValue = document.getElementById("type").value;
			var div0 = document.getElementById('result0c');
			var div1 = document.getElementById('result1c');
			var div2 = document.getElementById('result2c');
			var div3 = document.getElementById('result3c');
// 			if (!idValue){
// 				setErrorFor(div0, "請輸入帳號");
// 	   		} 	else {
// 	      		div0.innerHTML = "";
// 	   		}
// 			if (!nameValue){
// 				setErrorFor(div1, "請輸入姓名");
// 			} else {
// 				div1.innerHTML = "";
// 			}
// 			if (!balanceValue){
// 				setErrorFor(div2, "請輸入餘額");
// 			} else {
// 		   		var objRegex = /^\d+$|(^-?\d\d*\.\d\d*$)|(^-?\.\d\d*$)/;  
// 				if(!objRegex.test(balanceValue))    {  
// 					setErrorFor(div2, "餘額欄必須是數值");
// 	       		} else { 
// 	           		div2.innerHTML = "";
// 	       		}
//	        }
// 			if (!birthdayValue){
// 				setErrorFor(div3, "請輸入生日");  
// 	   		} else if(!dateValidation(birthdayValue)) {
// 				setErrorFor(div3, "生日格式錯誤，正確格式為yyyy-MM-dd");
// 	   		} else {
// 	       		div3.innerHTML = "";
// 	   		}
// 	   		if (hasError){
// 	       		return false;
// 	   		}
			var xhr1 = new XMLHttpRequest();
			xhr1.open("PUT", "<c:url value='/editNews4/' />" + NewsId2, true);
			var jsontrkNewsBean = { 
					"trackId": NewsId2, 					  //"trackId" :  左邊必須跟Bean裡面的key的名子一模一樣   NewsId2,  右邊必須跟網頁上蘭為名稱相同 
					"title": titleValue, 	                  //"title"   :                            titleValue,
					"ocplace": ocplaceValue,                  //"ocplace" :                             ocplaceValue,
					"founder": founderValue,                  //"founder" :                            founderValue,
					"type": typeValue                         //"type"    :                              typeValue
			}
			xhr1.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
			xhr1.send(JSON.stringify(jsontrkNewsBean));
			
			xhr1.onreadystatechange = function() {
				// 伺服器請求完成
				if (xhr1.readyState == 4 && (xhr1.status == 200 || xhr1.status == 201) ) {
					result = JSON.parse(xhr1.responseText);
// 					if (result.fail) {
// 				 		divResult.innerHTML = "<font color='red' >"
// 							+ result.fail + "</font>";
// 			  		} else if (result.success) {
// 						divResult.innerHTML = "<font color='GREEN'>"
// 							+ result.success + "</font>";
// 						div0.innerHTML = "";	
// 						div1.innerHTML = "";
// 						div2.innerHTML = "";
// 						div3.innerHTML = "";
// 			 		} else {
// 			 			if (result.idError) {
// 		          			div0.innerHTML = "<font color='green' size='-2'>"
// 			     				+ result.idError + "</font>";
// 						} else {
// 		          			div0.innerHTML = "";
// 						}
// 			 			if (result.nameError) {
// 			      			div1.innerHTML = "<font color='green' size='-2'>"
// 								+ result.nameError + "</font>";
// 						} else {
// 			      			div1.innerHTML = "";
// 			   			}
// 			 			if (result.balanceError) {
// 		          			div2.innerHTML = "<font color='green' size='-2'>"
// 								+ result.balanceError + "</font>";
// 						} else {
// 		          			div2.innerHTML = "";
// 		    			}
// 						if (result.birthdayError) {
// 			    			div3.innerHTML = "<font color='green' size='-2'>"
// 								+ result.birthdayError + "</font>";
// 						} else {
// 		          			div3.innerHTML = "";
// 						}
// 			 		}
				}
			}
	  }
};
</script>
<meta charset="UTF-8">
<title>TrkNews</title>
</head>
<body>
	 <nav class="navbar fixed-top">
		<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
	 </nav>
	
	
	
	
	<div align='center'>
		<h2>修改會員資料</h2>
		<div id='resultMsg' style="height: 18px; font-weight: bold;"></div>
		<hr>
		<fieldset style='display: inline-block; width: 820px;'>
			<legend>請修改下列資料</legend>
			<input type="hidden" name="NewsId" id='NewsId'><br>
			<table>
				<tr height='60' style="display:none">
					
					<td width='400'>&nbsp;建立人: <label id='NewsIda'></label><br>
					</td>
					
			</tr>
			<tr height='5'>
				<div class="input-group mb-3" style="width:550px">
				  <div class="input-group-prepend">
                      <span  class="input-group-text" id="basic-addon1">標題</span>        <!--<td width='400'>&nbsp;標題:  -->
				  </div>
				<input   disabled="disabled" name="title"	id='title' type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1"><br>    <!--  <input type="text" name="title"	id='title'><br> -->
                </div>                                                                         <!--  </td> -->
			</tr>
			<tr height='5'>
				<div class="input-group mb-3" style="width:250px">
				  <div class="input-group-prepend">
                      <span  class="input-group-text" id="basic-addon1">發生地點:</span>        <!--<td width='400'>&nbsp;標題:  -->
				  </div>
					<input  name="ocplace" id='ocplace' type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1"><br>
				  </div> 
			 </tr>
				<tr height='' style="display:none">
					
					<td width='400'>&nbsp;發生時間: <input type="text" name="octime"
						id='octime' size='24'>
					</td>
					
				</tr>
				<tr height='5' style="display:none">
					
					<td width='400'>&nbsp;建立人: <input type="text" name="founder"
						id='founder' size='24'>
					</td>
					
				</tr>
			<tr height='5'>
				<div class="input-group mb-3" style="width:250px">
				  <div class="input-group-prepend">
                      <span  class="input-group-text" id="basic-addon1">類型:</span>        <!--<td width='400'>&nbsp;標題:  -->
				  </div>
					<input  name="type" id='type' type="text" class="form-control" placeholder="類型" aria-label="類型" aria-describedby="basic-addon1"><br>
				  </div> 
			</tr> 
			<tr height='5'>
				<div class="input-group mb-3" style="width:250px">
				  <div class="input-group-prepend">
                      <span  class="input-group-text" id="basic-addon1">標籤:</span>        <!--<td width='400'>&nbsp;標題:  -->
				  </div>
					<input  name="tag" id='tag' type="text" class="form-control" placeholder="搜尋標籤" aria-label="搜尋標籤" aria-describedby="basic-addon1"><br>
				  </div> 
			</tr> 
				<tr>
						<textarea name="descript" id='descript' style="resize:none;width:300px;height:200px;" id="descript" path="descript" type='text'
							class='form:input-large' > </textarea>
				
				</tr>

				<tr height='50'>
					<td colspan='3' align='center'>
					    <button id='updateData' type="button" class="btn btn-primary btn-lg">更新</button>
                        <button id='deleteData' type="button" class="btn btn-secondary btn-lg">刪除</button>
					</td>
				</tr>
			</table>
		</fieldset>
		<hr>
		<p>
			<a href="<c:url value='/trkNews'  />"><button type="button" class="btn btn-secondary btn-lg btn-block">回前頁</button></a>
		<hr>
	</div>

</body>
</html>