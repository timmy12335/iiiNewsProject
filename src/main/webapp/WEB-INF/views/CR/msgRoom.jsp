<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>客服即時回應</title>
<!-- <style>
 body html{
  width:100%;
  height:80%;
  margin-top:100px;
  padding:0;
  background:url(http://www.oxxostudio.tw/firebase-webduino-im/bg2.jpg);
  background-size:cover;
} 

 #im{
  position:relative;
  margin:500px auto;
  width:100%;
  max-width:600px;
  height:80%;
  box-sizing:border-box;
  background:rgba(0,0,0,.4);
}

#input{
  position:absolute;
  z-index:2;
  height:90px;
  width:100%;
  left:0;
  bottom:0;
  margin:0;
  padding:15px;
  box-sizing:border-box;
  background:#222;
  color:#fff;
}

#input input, #input span{
  display:inline-block;
  margin:5px 0;
}

#input input{
  width:75%;
  border:none;
  padding:5px;
}

#input span{
  width:10%;
  min-width:50px;
}

#input div{
  width:80%;
  float:left;
}

#input button{
  float:right;
  height:90%;
  width:20%;
  margin:5px 0;
  border:none;
  padding:0;
  background:#369;
  font-size:16px;
  color:#fff;
}

#show{
  position:absolute;
  top:80%;
  left:0;
  z-index:1;
  width:100%;
  height:calc( 90px);
  overflow-y:scroll;
  padding:20px;
  box-sizing:border-box;
}

#show>div{
  position:relative;
  margin:100px 0 20px 0;
  clear:both;
  height:40px;
}

#show>div>div{
  display:inline-block;
}

#show .time{
  position:absolute;
  top:-2px;
  font-size:10px;
  color:#777;
}

#show .name{
  color:#fff;
  vertical-align:middle;
}

#show .content{
  background:rgba(255,255,255,.8);
  padding:10px;
  margin-top:800px;
  margin-left:10px;
  border-radius:5px;
  vertical-align:middle;
}
#show::-webkit-scrollbar {
  width:5px;
}
#show::-webkit-scrollbar-track {
  background:rgba(255,255,255,.1);
  border-radius: 5px;
}
#show::-webkit-scrollbar-thumb {
  background:rgba(255,255,255,.2);
  border-radius: 2px;
}
</style> -->
<style>
#up {
height:320px;
width:100%;
overflow:auto; 
}
</style>
<script type="text/javascript">
//記錄當前獲取到的id的最大值，防止獲取到重複的資訊
var maxId = 0;
function showmessage(){
var ajax = new XMLHttpRequest();
// 從伺服器獲取並處理資料
ajax.onreadystatechange = function(){
if(ajax.readyState==4) {
//alert(ajax.responseText); 
// 將獲取到的字串轉換成實體
eval('var data = ' ajax.responseText);
// 遍歷data陣列，把內部的資訊一個個的顯示到頁面上
var s = "";
for(var i = 0 ; i < data.length;i  ){
data[i];
s  = "(" data[i].add_time ") >>>";
s  = "<p style='color:" data[i].color ";'>";  
s  = data[i].sender  " 對 "   data[i].receiver  "  "  data[i].biaoqing "說："   data[i].msg;
s  = "</p>";
// 把已經獲得的最大的記錄id更新
maxId = data[i].id;
}
// 開始向頁面時追加資訊
var showmessage = document.getElementById("up");
showmessage.innerHTML  = s;
//showmessage.scrollTop 可以實現div底部最先展示
// divnode.scrollHeight而已獲得div的高度包括滾動條的高度
showmessage.scrollTop = showmessage.scrollHeight-showmessage.style.height;
}
}
ajax.open('get','./chatroom.php?maxId=' maxId);
ajax.send(null);  
}
// 更新資訊的執行時機
window.onload = function(){
//showmessage();  
// 製作輪詢,實現自動的頁面更新
setInterval("showmessage()",3000);
}

</script>
</head>
<body>
<nav>
<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
</nav>
<div id="main">
<h3>訊息顯示區</h3>
<div id="up">
</div>
<hr />
<h3>發言欄</h3>
<div id="bottom">
<form action="./chatroom_insert.php">
<div id="chat_up">
<span>顏色</span>
<input type="color" name="color"/>
<span>表情</span>
<select name="biaoqing">
<option value="微笑地">微笑地</option>
<option value="猥瑣地">猥瑣地</option>
<option value="和藹地">和藹地</option>
<option value="目不轉睛地">目不轉睛地</option>
<option value="傻傻地">傻傻地</option>
</select>
<span>聊天物件</span>
<select name="receiver">
<option value="">所有的人</option>
<option value="老郭">老郭</option>
<option value="小郭">小郭</option>
<option value="大郭">大郭</option>
</select>
</div>
<div id="chat_bottom">
<script>
function send(){
// 向伺服器差入相關的資料
var form = document.getElementsByTagName('form')[0];
var formdata = new FormData(form);
var xhr = new XMLHttpRequest();
xhr.onreadystatechange = function(){
if(xhr.readyState==4) {
//alert(xhr.resposneText);
document.getElementById("result").innerHTML = xhr.responseText;
setTimeout("hideresult()",2000);
}
}
xhr.open('post','./chatroom_insert.php');
xhr.send(formdata);
document.getElementById("msg").value="";
//return false;
}
// 2秒後實現提示資訊的消失
function hideresult(){
document.getElementById('result').innerHTML = "";  
}
</script>
<textarea id="msg" name="msg" style="width:380px;height:auto;"></textarea>
<input type="button" value="發言" onclick="send()" />
發言：<span id="result"></span>
</div>
</form>
</div>
</div>
</body>
</html>