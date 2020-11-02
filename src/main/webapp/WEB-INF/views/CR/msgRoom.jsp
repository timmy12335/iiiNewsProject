<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function doSubmit(){
		var sendmsg = document.getElementById("info").value;
		
	
	</script>
</head>
<body>
    <textarea rows="5" cols="" placeholder="請輸入內容" name="info" id="info"></textarea>
    <br>
    <input type="button" onclick="doSubmit()" value="送出">
    <br>
    <label id="res"></label>
</body>
</html>