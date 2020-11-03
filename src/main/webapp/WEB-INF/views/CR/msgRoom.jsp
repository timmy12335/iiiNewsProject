<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 body, html{
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
</style>
<script type="text/javascript">

	</script>
</head>
<body>
<nav>
<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
</nav>
<section style="margin-top: 100px">
<div id="im">
  <div id="input">
    <div>
      <span>姓名：</span><input id="name"><br/>
      <span>內容：</span><input id="content">
    </div>
    <button id="btn">送出訊息</button>
  </div>
  <div id="show"></div>
</div>
</section>
</body>
</html>