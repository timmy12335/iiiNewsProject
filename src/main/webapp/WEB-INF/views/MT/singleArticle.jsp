<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>單一新聞表</title>
</head>
<body>
<nav>
<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
</nav>
	<div align="center" style="margin-top:150px;">
	<h2>查詢單一文章</h2>	
	</div>
	<hr>
	<div align="left">
		
			<p>PK： ${singleArticle.pkey}</p>
			<p>文章編號：${singleArticle.articleId}</p>
			<p>會員編號: &nbsp;${ singleArticle.memberId }</p>
			<p>更新時間: ${ singleArticle.updateDate }</p>
			<p>文章狀態: ${ singleArticle.articleStatus }</p>
			<p>標籤: ${ singleArticle.category }</p>
			<p>標題: ${ singleArticle.title }</p>
			<img width='300' height='200' 
	                    	src="<c:url value='/getMtCreate/${ singleArticle.articleId }'/>" >
			<p>內文:</p><p>${ singleArticle.article }</p>
			<a href="<c:url value="" />">-----查詢查詢-----</a>
			<a href="<c:url value="" />">回前頁</a>		
		
	</div>
</body>
</html>