<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8">
<title>上架廣告欄位</title>
<script src="https://www.google.com/recaptcha/api.js"></script>
<script >
window.onload = function(){
		var btn = document.getElementById("clickme1");
		var btn2 = document.getElementById("clickme2");
		btn.onclick = function(){
		A =  document.getElementById("Category")
		A.value ="生活"
		AA = document.getElementById("title")
		AA.value = "有沒有雙11前 電商先漲一波的八卦"
		article = document.getElementById("article")
		article.value = "這陣子上網找適合的筆電\n發現昨天價格還在47xxx\n今天再上去看變成51xxx\n一開始還以為看錯機型\n發現電商的價格還連動\n有沒有先漲再降大特賣的八卦"
		submitUserForm = document.getElementById("grecaptcha")
		submitUserForm.value = true;
		}
		
		btn2.onclick = function(){
		B =  document.getElementById("Category")
		B.value ="問卦"
		BB = document.getElementById("title")
		BB.value = "為什麼很多老人喜歡把發票印出來?"
		article = document.getElementById("article")
		article.value = "因為現在超商，都可以把發票存在會員裡面，發票開獎時還會自動對獎\n可是常常去超商的時候，還是會看到很多老人一定要店員把發票印出來\n有沒有為什麼老人這麼喜歡把發票印出來的八卦?"
		submitUserForm111 = document.getElementById("grecaptcha")
		submitUserForm111.value = false;
	}
}
	</script>
</head>
<body>
	<nav>
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<div id="page" class="container" align="center">
		<h2 class="BoxTitle">-----廣告欄位置上傳-----</h2>
		<div class="container-login100">>
			<form:form method="POST" modelAttribute="mtBean"
				enctype="multipart/form-data" onsubmit="return submitUserForm();">
				<fieldset>
					<div align="center" style="margin-top: 40px;">
						<h1>建立貼文</h1>
						<hr>
						<div class="st1">
							<label for="Category">類別:</label>
							<form:select path="Category">
								<form:option value="生活">生活</form:option>
								<form:option value="娛樂">娛樂</form:option>
								<form:option value="問卦">問卦</form:option>
								<form:option value="美食">美食</form:option>
								<form:option value="運動">運動</form:option>
								<form:option value="趣味">趣味</form:option>
								<form:option value="寵物">寵物</form:option>
							</form:select>
						</div>
						<div class="st1">
							<label for="title">標題:</label>
							<form:input type="text" id="title" name="title" path="title"
								size="45" placeholder="今晚我想來點..." autocomplete="on" />
						</div>
<!-- 						<div class="st1"> -->
<!-- 							<label for="videoLink">影片連結:</label> -->
<%-- 							<form:input type="text" id="videoLink" name="videoLink" path="videoLink" --%>
<%-- 								size="30" placeholder="https://www.youtube.com/..." --%>
<%-- 								autocomplete="off" /> --%>
<%-- 							<font color="red" size="1">${errorMsg.link}</font> --%>
<!-- 						</div> -->
						<div class="st1">
							<label for="Image">照片:</label>
							<form:input type="file" id="Image" name="Image" path="Image" />
						</div>
						<div class="st1">
							<label for="article">內容:</label>
							<form:textarea name="article" id="article" cols="45" rows="20"
								path="article" maxlength="250" placeholder="限輸入250字"></form:textarea>
						</div>
					
					<div id="grecaptcha" class="g-recaptcha"
						data-sitekey="6LfoZd4ZAAAAAI7CSpjpT5lOFf4mT1YxtkdTLUSp" style="padding:10px 70px "></div>
					<div id="g-recaptcha-error"style="padding:10px 70px "></div>

				
					</div>
					<div id="btn" align="center">
					<button class="login100-form-btn">送出</button>
<!-- 					<input class="sub" type="submit" name="submit" id="submit" value="送出" /> -->
					<input class="sub" type="reset" name="cancel" id="cancel" value="清除" />
				</div>
				
				<div>
						<input type='button' class=''  id='clickme1' value='Demo1' >
						<span>&nbsp;&nbsp;</span>
						<input type='button' class=''  id='clickme2' value='Demo2' >
						<span>&nbsp;&nbsp;</span>
				</div>
				</fieldset>
			</form:form>
		</div>
<!-- 		<br> <input type="button" value="one" onclick="onebuttontodata()"> -->
	</div>
	
	
	<script>
		function submitUserForm() {
			var response = grecaptcha.getResponse();
			if (response.length == 0) {
				document.getElementById('g-recaptcha-error').innerHTML = '<span style="color:red;">請點選我不是機器人</span>';
				return false;
			}
			return true;
		}
		function verifyCaptcha() {
			document.getElementById('g-recaptcha-error').innerHTML = '';
		}

	</script>
	
	
</body>
</html>