<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>已購買新聞</title>
<script>
	function printdiv(printpage) {
		var newstr = printpage.innerHTML;
		var oldstr = document.body.innerHTML;
		document.body.innerHTML = newstr;
		window.print();
		document.body.innerHTML = oldstr;
		return false;
	}
	window.onload = function() {
		var bt = document.getElementById("bt");
		var div_print = document.getElementById("div_print");
		bt.onclick = function() {
			printdiv(div_print);
		}
	}
</script>
</head>
<body>
	<nav>
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<div align="center" style="margin-top: 150px;">
		<h2>已購買新聞</h2>
	</div>
	<hr>
	<div align="center" id="div_print">

		<p>新聞編號： ${ newsSingle.newsId }</p>
		<p>上傳時間：${fn:substring(newsSingle.uploadTime,0,19)}</p>
		<p>新聞標題: &nbsp;${ newsSingle.title }</p>
		<p>新聞類型: ${ newsSingle.newsType }</p>
		<p>發生日期: ${ newsSingle.happenDate } ${ newsSingle.happenTime }</p>

		<p>發生地點: ${ newsSingle.location }</p>
		<img width='300' height='200'
			src="<c:url value='/getOrderedNewsPicture/${ newsSingle.newsId }'/>">
		<p>新聞內文:</p>
		<p>${ newsSingle.article }</p>
		<p>購買價格: ${ newsSingle.price }</p>
	</div>
	<div>
		<br><input type="button"
			onclick="history.back()" value="回前頁"></input>

	</div>
	<input name="print" type="button" id="bt" value="商品下載" /> 

</body>
</html>