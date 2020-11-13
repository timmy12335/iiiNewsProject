<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
	<h2>文章留言</h2>	
	</div>
	<hr>
<!-- 	<form action="/singleArticle" method="post"  > -->
	<form:form method="POST" modelAttribute="mtArtComBean" >
	<div align="center">
		<table border="1">
			<tr><td><div>PK： ${CreateComment.pkey}</div></td></tr>
			<tr><td><div>文章編號：${CreateComment.articleId}</div></td></tr>
			<tr><td><div>會員編號: &nbsp;${CreateComment.memberId }</div></td></tr>
			<tr><td><div>新增時間: ${CreateComment.updateDate }</div></td></tr>
			<tr><td><div>文章狀態: ${CreateComment.articleStatus }</div></td></tr>
			<tr><td><div>[${CreateComment.category }] ${CreateComment.title }</div></td></tr>
<%-- 			<tr><td><div>標題: ${ singleArticle.title }</div></td></tr> --%>
			<tr><td><div><img width='500' height='300' 
	                    	src="<c:url value='/getMtCreate/${CreateComment.articleId }'/>" >
	        </div></td></tr>            	
			<tr><td><div>內文:<br>${CreateComment.article }</div></td></tr>
			
			<tr><td><label for="comment">測試測試:</label><div class="st1">
					<textarea name="comment" id="comment" cols="58" rows="5" maxlength="250" placeholder="限輸入250字"></textarea>
					<input class="sub" type="submit" name="submit" id="submit" value="送出" />
			</div></td></tr>
<%-- 			<tr><td><div style="width:500px;height:300px">內文:<br>${ singleArticle.article }</div></td></tr> --%>
		</table>
		
		<br>
<%-- 		<input type="button" onclick="location.href=<c:url value='' />" value="-----TOP-----" /> --%>
		<div id="btn" align="center">
<!-- 					<button>送出</button> -->
<!-- 			<input class="sub" type="submit" name="submit" id="submit" value="送出" /> -->
		</div>
		<input type="button" onclick="history.back()" value="回前頁" />
<%-- 		<a href="<c:url value="/getAllMtAdd" />">回前頁</a><br><br><br>	 --%>
	</div>
	</form:form>
</body>
</html>