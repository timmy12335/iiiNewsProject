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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/base/vendor.bundle.base.css">
<!-- endinject -->
<!-- plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@300;400&display=swap" rel="stylesheet">
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
.statuscolor{
color:#969696;
font-size:12px;
}
.chatroom {
	position: fixed;
	bottom: 10px;
	right: 0;
	_position: absoluate;
	width: 370px;
	height: auto;
	border: 2px solid green;
	background: #ECECFF;
	border-radius:15px 15px;
	padding: 10px;
	float: both;
}

#serverResponseArea{
	border:2px green solid;
}

.fontsize{
	font-size:14pt;
	font-family: 'Noto Sans TC', sans-serif;

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
			appendMsg("${MBBean.name}${CpMemberBean.cpname}:  " + message.value);
			socket.send(message.value);
			message.value = "";
		}
		
		message.onkeydown=function(){
			if (event.keyCode==13){
				btnSend.onclick();
			}
		}
		
		chatbot.onclick = function() {
			socket = new WebSocket(connString);
			document.getElementById("show").style.display = "";
			document.getElementById("chatbot").className = "hidechatbot";
			socket.onopen = function(e) {
				status.innerHTML = "客服上線";
			};

			socket.onmessage = function(event) {
				appendMsg("新聞金錢客服豹: " + event.data);
			};
			btnClose.disabled = false;
			btnSend.disabled = false;
			socket.onclose = function(event) {
				if (event.wasClean) {
					status.innerHTML = "[close] 連線正常關閉, code=" + event.code
							+ ", reason= " + event.reason;
				} else {
					status.innerHTML = "[close] 客服連線中斷";
				}
				btnClose.disabled = true;
				btnSend.disabled = true;

			};

			socket.onerror = function(error) {
				alert("[error] 客服連線發生錯誤，原因：" + error.message);
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
		$('#serverResponseArea').scrollTop($('#serverResponseArea')[0].scrollHeight)
		serverResponseArea.value = serverResponseArea.value + message + "\n";
	}
	
</script>
</head>
<body>
	<nav>
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<section style='margin-top: 100px; align: center;'>

		<div align="center">

			<h3>歡迎<b>${MBBean.name}${CpMemberBean.cpname}</b>使用</h3>
			<br>
			<h3 class="title">客服表單申請</h3>

			<div class='card-body'
				style='width: 800px; margin-top: 10px; background: #ECECFF; box-shadow: 10px 10px #D0D0D0; border-radius: 30px;'>
				<form:form method="post" modelAttribute="crBean" id="forms"
					class="form-sample fontsize" enctype="multipart/form-data">
					<fieldset style="background: light-pink;">
						<c:choose>
							<c:when test="${not empty MBBean}">
								<form:input type="text" path="memberId" id="memberId"
									value="${MBBean.memberId}" hidden='true'></form:input>
							</c:when>
							<c:otherwise>
								<form:input type="text" path="companyId" id="companyId" class="fontsize"
									value="${CpMemberBean.cpmemberId}" hidden='true'></form:input>
							</c:otherwise>
						</c:choose>
						<div class="form-group">
							<label class="fontsize">客服主題:</label>
							<form:input class="form-control fontsize" type="text"
								placeholder="請輸入客服主題" path="crTitle" id="crTitle"></form:input>
							<form:errors path="crTitle" cssClass="error" />
						</div>
						<div class="form-group">
							<label class="form-group">客服類別:</label>
							<form:select path="crClass" id="crClass" class="form-control fontsize"
								style="border:none;">
								<option>帳號相關</option>
								<option>交易相關</option>
								<option>商品相關</option>
								<option>申請合作</option>
								<option>提議</option>
								<option>其他</option>
							</form:select>
						</div>

						<div class="form-group">
							<label class="fontsize">客服內容:</label>
							<form:textarea class="form-control fontsize" placeholder="請輸入至少10字以上的內容...."
								style="resize: none;height:300px;" path="crContent"
								id="crContent" maxlength="200"></form:textarea>
							<div id='num'><font color="#E0E0E0" size="1" face="DFKai-sb" ></font></div>
							<form:errors path="crContent" cssClass="error" />
						</div>

						<div class="form-group">
							<label class="fontsize">附件檔案:</label> 
							<input type="file" name="image" id="image"
								class='form-contorl'>
						</div>
						<div class="form-group">
							<img style="width: 300px; height: auto;" id="preview_img" src="" />
						</div>
						<div class="form-group">
							<input type="submit"
								class="btn btn-outline-secondary btn-icon-text" value="送出表單" />
							<input type="reset" id='reset'
								class="btn btn-outline-secondary btn-icon-text" value="重設" /> <input
								type="button" id='cancel'
								class="btn btn-outline-secondary btn-icon-text" value="取消申請" />
								<input
								type="button" id='inputDemo1'
								class="btn btn-outline-secondary btn-icon-text" value="Demo1" />
						</div>
						<hr>
						<div style="text-align: left; valign: top">
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
			<textarea cols='40' rows='10' id='serverResponseArea' readonly
				style="resize: none; align: left;"></textarea>
			
			<button id='btnClose' class="btn btn-danger btn-icon-text btn-sm">關閉客服對話</button>
			<hr>
			訊息： <input type='text' id='message'>&nbsp;
			<button id='btnSend' class="btn btn-secondary btn-icon-text btn-sm">送出</button>
		<div id='status' class="statuscolor"></div>
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
		 $("#preview_img").attr('src',"");
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
	
	
	document.getElementById("inputDemo1").onclick=function(){
		var crTitle = document.getElementById("crTitle");
		var crClass = document.getElementById("crClass");
		var crContent = document.getElementById("crContent");
		crTitle.value = "對於新聞有疑問";
		crClass.value="商品相關";
		crContent.value="購買新聞資訊後，發現給予的新聞內容和實際想像中不同，想請問能退貨退錢嗎?\n另外想請問下架倒數前一秒進行購買時，網路突然中斷，\n還能及時購買到嗎?";
		document.getElementById("crContent").onkeydown();
	}

</script>
</body>
</html>