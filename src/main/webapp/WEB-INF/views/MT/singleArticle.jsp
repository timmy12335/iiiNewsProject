<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>單一新聞表</title>

<style>
td{
align:left;
padding: 3px;
width:150px;
word-break: break-all;
margin:5px;
}
</style>
</head>
<body>
<nav>
<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
</nav>
	<div align="center" style="margin-top:150px;">
	<h2>查詢單一文章</h2>	
	</div>
	<hr>
<!-- 	<form action="/singleArticle" method="post"  > -->
	
	<div align="center">
		<table border="1">
			<tr><td><div>PK： ${singleArticle.pkey}</div></td></tr>
			<tr><td><div>文章編號：${singleArticle.articleId}</div></td></tr>
			<tr><td><div>會員編號: &nbsp;${ singleArticle.memberId }</div></td></tr>
			<tr><td><div>新增時間: ${ singleArticle.updateDate }</div></td></tr>
			<tr><td><div>文章狀態: ${ singleArticle.articleStatus }</div></td></tr>
			<tr><td><div>[${ singleArticle.category }] ${ singleArticle.title }</div></td></tr>
<%-- 			<tr><td><div>標題: ${ singleArticle.title }</div></td></tr> --%>
			<tr><td><div><img width='500' height='300' 
	                    	src="<c:url value='/getMtCreate/${ singleArticle.articleId }'/>" >
	        </div></td></tr>            	
			<tr><td><div>內文:<br>${ singleArticle.article }</div></td></tr>
<%-- 			<tr><td><div style="width:500px;height:300px">內文:<br>${ singleArticle.article }</div></td></tr> --%>
		</table>
		<br>
		<a href="<c:url value="" />">-----TOP-----</a>
		<a href="<c:url value="/getAllMtAdd" />">回前頁</a><br><br><br>	
	</div>
<!-- 	</form> -->
</body>
</html>