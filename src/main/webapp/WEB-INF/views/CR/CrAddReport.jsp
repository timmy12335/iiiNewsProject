<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>申請客服表單</title>
<style type="text/css">
span.error {
	color: red;
	display: inline-block;
	font-size: 5pt;
}

.fieldset-auto-width {
	display: inline-block;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
window.onload=function(){

	$("#image").change(function(){
		readURL(this);// this代表<input id="imgInput">
		let context = "<br>預覽中，送出後才儲存";
		$("#imgspan")[0].innerHTML = context;
		
	
 	});
	
	$("#reset").click(function(){
		let context = "";
		$("#imgspan")[0].innerHTML = context;
		 $("#preview_img").attr('src',"<c:url value='/image/CR2.jpg' />");
	});
	
	$("#cancel").click(function(){
		window.location.href="<c:url value='/'/>";
		
	});
	
	

	function readURL(input){
		if(input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function (e) {
		 	  $("#preview_img").attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	var yourImg = document.getElementById('preview_img');
	if(yourImg && yourImg.style) {
	    yourImg.style.height = ${oneItem.height}+'px';
	    yourImg.style.width = ${oneItem.width}+'px';
	}
}
	document.getElementById("crContent").onkeydown=function(){
	var length = document.getElementById("crContent").value.length;
	var word = 200-length;
	if(word <= 200){
	document.getElementById("num").innerHTML = "剩餘"+word+"字可輸入";
	}else{
	document.getElementById("num").innerHTML = "剩餘0字可輸入";
		}
	}
	
	
}

</script>
</head>
<body>
	<nav>
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<section style="margin-top: 100px">
		<div align="center">
			<h3 class="title">客服表單申請</h3>
		</div>
		<div align="center">
			<form:form method="post" modelAttribute="crBean" id="forms"
				enctype="multipart/form-data">
				<table class="table" border="1" style="width: 800px;">
					<tr>
						<td class="form-group">帳號:<span>請先註冊好帳號才使用</span></td>
						<td colspan='2'align="center"><form:input type="text" path="memberId"
								id="memberId" value="A001"></form:input></td>
					</tr>
					<tr>
						<td class="form-group">客服類別:</td>
						<td align="center"><form:select path="crClass" id="crClass"
								class="was-validated" style="width: 400px">
								<option>帳號相關</option>
								<option>交易相關</option>
								<option>商品相關</option>
								<option>申請合作</option>
								<option>提議</option>
								<option>其他</option>
							</form:select></td>
					</tr>
					<tr>
						<td class="form-group">客服主題:</td>
						<td align="center"><form:input class="form-control" type="text" style="width: 400px"
								placeholder="請輸入客服主題" path="crTitle" id="crTitle"></form:input>
								<form:errors path="crTitle" cssClass="error"/>
						</td>
					</tr>
					<tr>
						<td class="form-group">客服內容:</td>
						<td align="center" ><form:textarea class="form-control" 
								style="height: 100px;width: 400px;resize: none;" path="crContent" id="crContent" maxlength="200"></form:textarea>
							<div id='num'></div>
							<form:errors path="crContent" cssClass="error"/>
						</td>
					</tr>
					<tr>
						<td class="form-group">附件檔案:</td>
						<td align="center"><input type="file" name="image" id="image">
					</tr>
					<tr>
						<td colspan="3" align="center"><img
							style="width: 300px; height: 200px;" id="preview_img"
							src="<c:url value='/image/CR2.jpg' />" /></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="送出表單" /> <input type="reset" id='reset' value="重設" /> <input
							type="button" id='cancel' value="取消申請" /></td>
					</tr>
					<tr>
						<td colspan="2">
							<p>注意事項: 客服單填寫送出後，請隨時留意客服表單處理狀況，如要查詢客服進度與回覆內容，請從「客服紀錄查詢」查閱。</p>
							<p>為了迅速處理您的案件，請勿重複填單哦!客服單欄位請確實填寫，以便我們協助您，回覆時間因客服單內容而有所不同，還請您耐心等候!</p>
							<p>於客服回覆後，若是超過一個月仍未收到您的回應，系統將會自動結案。已解決、結案的回報單無法再做回應，若有任何疑問請重新填單，感謝您的配合!</p>
							<p>對於本回報系統使用時，若所發表的內容所含字句結合後具攻擊、不雅、猥褻之意，或涉及對本公司（及所屬員工）進行騷擾、誹謗、言論攻擊，或影響客服中心作業者。</p>
							<p>第一次給予勸導；第二次所使用的iiiNews 帳號停權三日；第三次所使用的 iiiNews
								帳號停權七日；第四次（含四次以上）所使用的 iiiNews 帳號則永久封鎖停權。</p>
						</td>
					</tr>
				</table>
			</form:form>
		</div>

	</section>
	<script>


</script>
</body>
</html>