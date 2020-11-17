<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>聊天視窗</title>
<style>
.chatbot{
 	background-image:url(${pageContext.request.contextPath}/image/CR4.png);
	background-size:contain;
	background-repeat: no-repeat;
  	height: 10px;
  	width: 10px;
  	position: fixed;
  	right:10px;
  	bottom:50px;
	}
.hidechatbot{
background:"";

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
		
		btnConn.onclick = function() {
			socket = new WebSocket(connString);
			document.getElementById("show").style.display="";
			document.getElementById("chatbot").className="hidechatbot";
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
				socket.onclose = function() {}; // disable onclose handler first
				
				socket.close();
				status.innerHTML = "已離線";
			}
			document.getElementById("show").style.display="none";
			document.getElementById("chatbot").className="chatbot";
			btnClose.disabled = true;
			btnSend.disabled = true;
		}
	}
	function appendMsg(message) {
		serverResponseArea.value = serverResponseArea.value + message + "\n";
	}
</script>
</head>
<body>
<nav>
<jsp:include page="/fragment/navbar.jsp"></jsp:include>
</nav>
<section style="margin-top:100px"></section>
<div style="width:200px; height:400px;" class="chatbot" id="chatbot" align="center">
	<button id='btnConn'>開啟客服聊天</button>
	&nbsp;
<div style="display:none" id="show">
	<button id='btnClose'>關閉客服聊天</button>
	<hr>
	訊息：
	<input type='text' id='message'>&nbsp;
	<button id='btnSend'>送出訊息</button>
	<hr>
	<span id='status'></span>
	<textarea cols='60' rows='20' id='serverResponseArea'>
</textarea>
</div>	
</div>
</body>
</html>