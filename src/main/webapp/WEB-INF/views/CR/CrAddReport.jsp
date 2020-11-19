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
 <!-- plugins:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<style type="text/css">

span.error {
	color: red;
	display: inline-block;
	font-size: 5pt;
}

.fieldset-auto-width {
	display: inline-block;
}

.chatbot {

	background-image: url(${pageContext.request.contextPath}/image/CR4.png); 
 	background-size: contain; 
	background-repeat: no-repeat; 
 	height: 10px; 
 	width: 10px; 
 	position: fixed; 
	right: 10px; 
	bottom: 10px; 
	
}

.hidechatbot {
	background: "";
}

.chatroom{
position:fixed ;bottom:0;right: 0;_position:relative ;width:
	250px;height: auto;border: 2px solid green ;background:#eeeeee
	;padding: 10px;float:both;
}

</style>

<script>
	window.onload = function() {
		const ws_host_port = "ws://localhost:8080/";
		const contextPath = "iiiNews/";
		const endpoint = "echoserver00";
		const connString = ws_host_port + contextPath + endpoint;
		const status = document.getElementById('status');
		var btnConn = document.getElementById('btnConn');
		var btnSend = document.getElementById('btnSend');
		var btnClose = document.getElementById('btnClose');
		var message = document.getElementById('message');
		var chatbot = document.getElementById('chatbot');
		var serverResponseArea = document.getElementById('serverResponseArea');
		var socket = null;
		btnClose.disabled = true;
		btnSend.disabled = true;

		// 		btnSend.onclick = function() {
		// 			if (socket == null) {
		// 				status.innerHTML = "必須先連到主機才能送訊息";
		// 				return;
		// 			}

		// 			if (message.value.length == 0) {
		// 				status.innerHTML = "尚未輸入資料，無法送出";
		// 				return;
		// 			}
		// 			socket.send(message.value);
		// 			message.value = "";

		// 		}
		btnSend.onclick = function() {
		
			if (socket == null) {
				status.innerHTML = "必須先連到主機才能送訊息";
				return;
			}

			if (message.value.length == 0) {
				status.innerHTML = "尚未輸入資料，無法送出";
				return;
			}
			appendMsg("Client: " + message.value);
			socket.send(message.value);
			message.value = "";
		}

		chatbot.onclick = function() {
			socket = new WebSocket(connString);
			document.getElementById("show").style.display = "";
			document.getElementById("chatbot").className = "hidechatbot";
			socket.onopen = function(e) {
				status.innerHTML = "客服上線";
			};

			socket.onmessage = function(event) {
				appendMsg("Server: " + event.data);
			};
			btnClose.disabled = false;
			btnSend.disabled = false;
			socket.onclose = function(event) {
				if (event.wasClean) {
					status.innerHTML = "[close] 連線正常關閉, code=" + event.code
							+ ", reason= " + event.reason;
				} else {
					status.innerHTML = "[close] 連線不正常結束";
				}
				btnClose.disabled = true;
				btnSend.disabled = true;

			};

			socket.onerror = function(error) {
				alert("[error] 連線發生錯誤，原因：" + error.message);
			};
		}

		btnClose.onclick = function() {

			if (socket == null) {
				status.innerHTML = "必須先連到主機才能關閉連線";
				return;
			}
			if (socket.readyState === WebSocket.OPEN) {
				socket.onclose = function() {
				}; // disable onclose handler first

				socket.close();
				status.innerHTML = "已離線";

			}
			show.style.display = "none";
			document.getElementById("chatbot").className = "chatbot";
		
		}
	}
	function appendMsg(message) {
		serverResponseArea.value = serverResponseArea.value + message + "\n";
	}
	
</script>
</head>
<body style="background-color:#FFECEC">
	<nav>
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<section style='margin-top:100px;align:center;'>
		
		<div align="center">
		
		<h4>歡迎${MBBean.name}${CpMemberBean.cpname}使用</h4>
		<h4 class="title">客服表單申請</h4>
		
		<div class='card-body' style='width:800px; margin-top:10px;background:#ECECFF;box-shadow:10px 10px #D0D0D0;border-radius:30px;'>
			<form:form method="post" modelAttribute="crBean" id="forms" class="form-sample"
		enctype="multipart/form-data">
		<fieldset style="background:light-pink;">
						<c:choose>
						<c:when test="${not empty MBBean}">
						<form:input type="text" path="memberId"
								id="memberId" value="${MBBean.memberId}" hidden='true'></form:input>
						</c:when>
						<c:otherwise>
						<form:input type="text" path="companyId"
								id="companyId" value="${CpMemberBean.cpmemberId}" hidden='true'></form:input>
						</c:otherwise>
						</c:choose>
											<div class="form-group">
						<label>客服主題:</label>
						<form:input class="form-control" type="text"
								placeholder="請輸入客服主題" path="crTitle" id="crTitle"></form:input>
								<form:errors path="crTitle" cssClass="error"/>
					</div>
					<div class="form-group">
						<label class="form-group">客服類別:</label>
						<form:select path="crClass" id="crClass"
								class="form-control" style="border:none;">
								<option>帳號相關</option>
								<option>交易相關</option>
								<option>商品相關</option>
								<option>申請合作</option>
								<option>提議</option>
								<option>其他</option>
						</form:select>
					</div>

					<div class="form-group">
						<label>客服內容:</label>
						<form:textarea class="form-control" 
								style="resize: none;height:300px" path="crContent" id="crContent" maxlength="200"></form:textarea>
							<div id='num'></div>
							<form:errors path="crContent" cssClass="error"/>
					</div>
					
					<div class="form-group">
						<label>附件檔案:</label>
						<input type="file" name="image" id="image" class='form-contorl'>
					</div>
					<div class="form-group">
					<img
							style="width: 300px; height: auto;" id="preview_img"
							src="" />
					</div >
					<div class="form-group">
						<input type="submit"
							value="送出表單" />
							 <input type="reset" id='reset' value="重設" /> 
							 <input
							type="button" id='cancel' value="取消申請" /></td>
					</div>
					<div style="text-align:left;valign:top">
							<p>注意事項: 客服單填寫送出後，請隨時留意客服表單處理狀況，如要查詢客服進度與回覆內容，請從「客服紀錄查詢」查閱。</p>
							<p>為了迅速處理您的案件，請勿重複填單哦!客服單欄位請確實填寫，以便我們協助您，回覆時間因客服單內容而有所不同，還請您耐心等候!</p>
							<p>於客服回覆後，若是超過一個月仍未收到您的回應，系統將會自動結案。已解決、結案的回報單無法再做回應，若有任何疑問請重新填單，感謝您的配合!</p>
							<p>對於本回報系統使用時，若所發表的內容所含字句結合後具攻擊、不雅、猥褻之意，或涉及對本公司（及所屬員工）進行騷擾、誹謗、言論攻擊，或影響客服中心作業者。</p>
							<p>第一次給予勸導；第二次所使用的iiiNews 帳號停權三日；第三次所使用的 iiiNews
								帳號停權七日；第四次（含四次以上）所使用的 iiiNews 帳號則永久封鎖停權。</p>
					
				</div>
				</fieldset>
			</form:form>

		</div>
		</div>
<div style="display: none" id="show" class="chatroom">
	<textarea cols='25' rows='10' id='serverResponseArea' readonly style="resize: none;align:left;"> 
	</textarea>
		<span id='status'></span> 
 		<button id='btnClose'>關閉訊息</button> 
		<hr> 訊息： <input type='text' id='message'>&nbsp;
 		<button id='btnSend'>送出訊息</button>
</div>
	<div style="width: 200px; height: 400px;" class="chatbot" id="chatbot" 
 		align="center"></div> 
	</section>
	
	
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">


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


	document.getElementById("crContent").onkeydown=function(){
	var length = document.getElementById("crContent").value.length;
	var word = 200-length;
	if(word <= 200){
	document.getElementById("num").innerHTML = "剩餘"+word+"字可輸入";
	}else{
	document.getElementById("num").innerHTML = "剩餘0字可輸入";
		}
	}
	


</script>
</body>
</html>