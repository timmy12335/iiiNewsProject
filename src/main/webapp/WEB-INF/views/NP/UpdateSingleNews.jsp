<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改單則新聞</title>

</head>
<body>
	<nav>
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<div align="center" style="margin-top: 150px;"> 
		<h2>修改單則新聞</h2>
	</div>
	<hr>
	<form:form method="POST"  id="form1" modelAttribute="newsSingle" enctype="multipart/form-data" >
	<fieldset>
	<div align="left">
		<p>新聞編號: &nbsp;${ newsSingle.newsId }</p>
		<p>上傳時間：${newsSingle.uploadTime}</p>
		<div>		
		<form:input type="hidden" id="newsProduct_pk" name="newsProduct_pk"  path="newsProduct_pk" value="${ newsSingle.newsProduct_pk }"  />
		<form:input type="hidden" id="memberId" name="memberId"  path="memberId" value="${ newsSingle.memberId }"  />
		<form:input type="hidden" id="pic_One" name="pic_One"  path="pic_One" value="${ newsSingle.pic_One }"  />
		<form:input type="hidden" id="pic_Two" name="pic_Two"  path="pic_Two" value="${ newsSingle.pic_Two }"  />
		<form:input type="hidden" id="pic_Three" name="pic_Three"  path="pic_Three" value="${ newsSingle.pic_Three }"  />			
		<form:input type="hidden" id="status" name="status"  path="status" value="${ newsSingle.status }"  />
		</div>	
		<div>		
		<form:input type="hidden" id="newsId" name="newsId"  path="newsId" value="${ newsSingle.newsId }"  />		
		</div>		
		<div>
		<form:input type="hidden" id="uploadTime" name="uploadTime" path="uploadTime" value="${ newsSingle.uploadTime }"  />		
		</div>
		<div>
		<label for="title">新聞標題：</label>
		<form:input type="text" id="title" name="title" size="50" path="title" value="${ newsSingle.title }"  />		
		</div>
		<label for="newsType">新聞類型：</label>
		<form:select path="newsType">
			<form:option value="none">分類項目</form:option>
			<form:option value="交通">交通</form:option>
			<form:option value="糾紛">糾紛</form:option>
			<form:option value="感情">感情</form:option>
			<form:option value="詐騙">詐騙</form:option>
			<form:option value="災情">災情</form:option>
			<form:option value="爆料">爆料</form:option>
		</form:select>
		<div>
			<label for="location">發生地點：</label>
			<form:input type="text" id="location" name="location" size="50" path="location" value="${ newsSingle.location}"  />
		</div>
		<div>
			<label for="happenDate">發生日期：</label>
			<form:input type="Date" id="happenDate" name="happenDate" size="50" path="happenDate"  />
		</div>
		<div>
			<label for="happenTime">發生時間：</label>
			<form:input type="time" id="happenTime" name="happenTime" size="50" path="happenTime"  />
		</div>	
		<label>上傳照片：</label>	
		file1:<input type="file" id="productImage" name="productImage" multiple ><br>
		file2:<input type="file" id="productImage" name="productImage" multiple ><br>
		file3:<input type="file" id="productImage" name="productImage" multiple ><br>
		
		<img width='300' height='200' id="productImage1"
			src="<c:url value='/getNewsPicture/${ newsSingle.newsId }'/>">
		<div>
			<label for="outline">新聞大綱：</label>
			<form:input type="text" id="outline" name="outline" size="50" path="outline" value="${ newsSingle.outline }" />
		</div>
		<div>
			<label for="article">新聞內文：</label>
			<form:textarea type="text" id="article" name="article" cols="70" rows="10" path="article" value="${ newsSingle.article }" />
		</div>	
		<div>
			<label for="price">販賣價格：</label>
			<form:input type="text" id="price" name="price" size="50" path="price" value="${ newsSingle.price }"  />
		</div>	

		
<!-- 		<input type="text" id="limitTime"  name="limitTime" size="20"  placeholder="請輸入限時時間" /> -->
		
		<input type="submit" name="submit" id="submit" value="確認送出"><br>
<%-- 		<a href="<c:url value="/getMemNewsList/A0002" />">回前頁</a> --%>
		<input type ="button" onclick="history.back()" value="回前頁"></input>
	</div>
	</fieldset>
	</form:form>

</body>
</html>