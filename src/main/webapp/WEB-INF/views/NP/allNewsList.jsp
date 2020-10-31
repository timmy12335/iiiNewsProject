<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有新聞列表</title>
</head>
<body>
<nav>
<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
</nav>
<div align='center' style="margin-top:150px;">
<h3><b>新聞列表</b></h3>

<c:forEach var='news' items='${newsLists}'>
<table>
	<tr style="background-color:lightblue;"  height='36'>
		<th width='600' align='center'>新聞標題</th>
		<th width='100' align='center'>新聞編號:</th>
		<th width='60' align='center'>上傳時間</th>		
		<th width='100' align='center'>新聞類型</th>		
		<th width='100' align='center'>發生地點</th>
		<th width='200' align='center'>影像</th>
	</tr>
	<tr>
		<td align='center' > 
		<a href="<c:url value='/getSingleNews/${news.newsId}'/>" >${news.title}  </a> 
		
		</td>
		<td width='600' align='center'>${news.newsId}</td>
		<td align='center'>${news.uploadTime}</td>		
		<td align='center'>${ news.newsType}</td>
		
		<td align='center'>${news.location}</td>
		<td><img width='200' height='150' 
	                    	src="<c:url value='/getNewsPicture/${ news.newsId }'/>" ></td>
		</tr>
    <tr style="background-color:lightblue;"  height='36'>
		<th width='600' align='center'>新聞大綱</th>
		<th width='100' align='center'>發生日期</th>
		<th width='100' align='center'>發生時間</th>
		<th width='100' align='center'>販賣計時</th>
		<th width='60' align='center'>價格</th>	
		</tr>
		<tr>
		<td width='600' align='center'>${news.outline}</td>
		<td align='center'>${news.happenDate}</td>
		<td align='center'>${news.happenTime}</td>
		<td align='center'>${news.price}</td>
		<td align='center'>${news.limitTime}</td>
	</tr>		
	</table>
	<hr>
</c:forEach>
				


<input type="button" value="回目錄" onclick="location.href='index.jsp'">
<!--<a href="<c:url value='/' />">回前頁</a>   -->
</div>
</body>
</html>