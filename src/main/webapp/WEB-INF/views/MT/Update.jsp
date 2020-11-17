<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8">
<title>更新內文</title>
<script src="https://www.google.com/recaptcha/api.js"></script>
<script >
window.onload = function(){
		var btn = document.getElementById("update1");
		var btn2 = document.getElementById("update2");
		btn.onclick = function(){
		A =  document.getElementById("Category")
		A.value ="生活"
		AA = document.getElementById("title")
		AA.value = "買4萬筆電，只來贈品背包"
		article = document.getElementById("article")
		article.value = "好啦標題殺人了，\n已經跟店家溝通過並退費了，\n不過還沒收到退款。\n\n我在今天早上收到了之前買的筆電，\n不過一拿到包裹，\n那個重量和大小，\n就知道裡面絕對沒有筆電，\n我心想這大概只有贈品的背包滑鼠吧。"
		}
		
		btn2.onclick = function(){
		B =  document.getElementById("Category")
		B.value ="問卦"
		BB = document.getElementById("title")
		BB.value = "為什麼有些咖啡店熱得比冰的貴?"
		article = document.getElementById("article")
		article.value = "如題\n想請問一下\n為什麼有些咖啡店\n熱的會比冰的貴\n會問這個\n主要是因為有些咖啡店熱和冰沒有差\n有人知道嗎?"
		}
}
	</script>
</head>
<body>
	<nav>
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<div id="page" class="container" align="center">
		
		<div>
			<form:form method="POST" modelAttribute="mtAddBean"
				enctype="multipart/form-data" onsubmit="return submitUserForm();">
				<fieldset>
					<div align="center" style="margin-top: 50px;">
						<h2>更新內文</h2>
						<div>		
							<form:input type="hidden" id="articleId" name="articleId"  path="articleId" value="${ mtAddBean.articleId }"  />
							<form:input type="hidden" id="imgName" name="imgName"  path="imgName" value="${ mtAddBean.imgName }"  />
							<form:input type="hidden" id="memberId" name="memberId"  path="memberId" value="${ mtAddBean.memberId }"  />
							<form:input type="hidden" id="status" name="status"  path="status" value="${ mtAddBean.status }"  />			
							<form:input type="hidden" id="updateDate" name="updateDate"  path="updateDate" value="${ mtAddBean.updateDate }"  />
						</div>	
						<strong><h4>文章編號:${mtAddBean.articleId}</h4></strong>
						<hr>
						<div class="st1">
							<label for="Category">類別:</label>
							<form:select path="Category" value="${mtAddBean.category}">
								<form:option value="未分類">未分類</form:option>
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
							<form:input type="text" id="title" name="title" path="title" size="30" value="${mtAddBean.title}" />
							<div><form:errors path="title" style="font-size:12px;color:red" /></div>
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
							<form:input type="file" id="Image" name="Image" path="Image" value="${mtAddBean.imgLink}"/>
						</div>
						<div class="st1">
							<label for="article">內容:</label>
							<form:textarea name="article" id="article" cols="30" rows="10"
								path="article" maxlength="250" value="${mtAddBean.article}"></form:textarea>
							<div><form:errors path="article" style="font-size:12px;color:red" /></div>
						</div>

					<br><br>				

<!-- 				<div class="login100-form-social flex-c-m"> -->
<!-- 						<input type='button' class='btn btn-primary'  id='clickme1' value='Demo1' > -->
<!-- 						<span>&nbsp;&nbsp;</span> -->
<!-- 						<input type='button' class='btn btn-primary'  id='clickme2' value='Demo2' > -->
<!-- 						<span>&nbsp;&nbsp;</span> -->
<!-- 					</div> -->
					</div>
<!-- 					<div id="btn" align="center"> -->
<!-- 					<button >送出</button> -->
<!-- 					<button >取消</button> -->
					<input class="sub" type="submit" name="submit" id="submit" value="送出" />
					<input type="button" onclick="history.back()" value="回前頁，取消編輯" />
<%-- 					<br> <a href="<c:url value='/getAllMtAdd' />">回前頁</a> <br> --%>
<!-- 				</div> -->

					<div>
						<input type='button' class=''  id='update1' value='Update1' >
						<span>&nbsp;&nbsp;</span>
						<input type='button' class=''  id='update2' value='Update2' >
						<span>&nbsp;&nbsp;</span>
					</div>
				</fieldset>
			</form:form>
		</div>
	</div>
</body>
</html>