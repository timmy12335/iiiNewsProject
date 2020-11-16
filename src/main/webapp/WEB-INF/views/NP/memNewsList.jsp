<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員新聞列表</title>
</head>
<body>
	<nav>
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<div align='center' style="margin-top: 150px;">
		<h3>
			<b>會員${MBBean.memberId}未上架新聞列表</b>
		</h3>
		<c:choose>
			<c:when test="${empty memNewsList}">
				<tr height='36'>
					<td colspan='8' align='center'><font color='red'>無上傳新聞資料</font></td>
				</tr>
			</c:when>
			<c:otherwise>
			<form method="POST"  id="form1" action="<c:url value='/updateLimitTime' />" >
				<c:forEach var='news' items='${memNewsList}' varStatus='loop' >
				
					<table>
						<tr style="background-color: lightblue;" height='36'>
							<th width='500' align='center'>新聞標題</th>
							<th width='60' align='center'>新聞編號</th>
							<th width='60' align='center'>上傳時間</th>
							<th width='100' align='center'>新聞類型</th>
							<th width='100' align='center'>發生日期</th>
							<th width='100' align='center'>發生時間</th>
							<th width='100' align='center'>發生地點</th>
						</tr>
						<tr>
							<td align='center'><a
								href="<c:url value='/getSingleNewsForUpdate/${news.newsId}'/>">${news.title}
							</a></td>
							<td align='center'>${news.newsId}</td>
							<td align='center'>${news.uploadTime}</td>
							<td align='center'>${ news.newsType}</td>
							<td align='center'>${news.happenDate}</td>
							<td align='center'>${news.happenTime}</td>
							<td align='center'>${news.location}</td>
						</tr>
						<tr style="background-color: lightblue;" height='36'>
							<th width='500' align='center'>新聞內文</th>
							<th width='100' align='center'>價格</th> 
							<th width='50' align='center'>販賣計時</th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
						<tr>
							<td align='left'>${news.article}</td>
							<td align='center'>${news.price}</td>
							<td align='center'>
								<input type="text" id="limitTime${loop.index}"  readonly />
								<input type="hidden" id="newsId${loop.index}" value="${news.newsId}"/>
							</td>
							<td align='center'><a href="<c:url value='/getUpdateSingleNews/${news.newsId}' />">修改本則新聞</a></td>
							<td align='center'><a href="<c:url value='/delSingleNews/${news.newsId}' />">刪除</a></td>
							<td align='center'><input type="button" value="輸入計時時間" onclick="inputLimitTime(${loop.index})"></td>
							<td align='center'><input type="submit" name="submit" id="submit" value="確認送出"></td>
							
						</tr>
					</table>					
					<hr>					
				</c:forEach>
				</form>
			</c:otherwise>
		</c:choose>

		<br>
		<input type="button" value="回目錄" onclick="location.href='/iiiNews'">

	</div>
	<script>
	function inputLimitTime(g) {
		let time = prompt("請輸入限時時間", "");
		if(time){			
			$("#limitTime"+[g]).attr("value",time);
			$("#limitTime"+[g]).attr("name","limitTime");
			$("#newsId"+[g]).attr("name","newsId");
			console.log(time);
		}else{
			alert("請輸入正確時間") 
		}
	}
	</script>
</body>
</html>