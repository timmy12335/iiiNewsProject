<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>上傳新聞欄位</title>
</head>
<body>
	<nav>
		<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
	</nav>
<div align='center' style="margin-top:100px;">
<form:form method="POST"  id="form1" modelAttribute="newsBean" enctype="multipart/form-data">
<fieldset>
<div>
	<label for="newsType">新聞類型：</label>
	<form:select path="newsType">
		<form:option value="none">分類項目</form:option>
		<form:option value="traffic">交通</form:option>
		<form:option value="argument">糾紛</form:option>
		<form:option value="relationship">感情</form:option>
		<form:option value="fraud">詐騙</form:option>
		<form:option value="disaster">災情</form:option>
		<form:option value="reveal">爆料</form:option>
	</form:select>
<%-- 	<font color="red" size="-1">${errorMsg.errorCategoryNoEmpty}</font> --%>
</div>
<div>
	<label for="title">新聞標題：</label>
	<form:input type="text" id="title" name="title" size="50" path="title" placeholder="請輸入標題"  />
</div>
<div>
	<label for="location">發生地點：</label>
	<form:input type="text" id="location" name="location" size="50" path="location" placeholder="請輸入發生地點"  />
</div>
<div>
	<label for="happenTime">發生時間：</label>
	<form:input type="text" id="happenTime" name="happenTime" size="50" path="happenTime" placeholder="請輸入發生時間"  />
</div>
<div>
	<label for="outline">新聞大綱：</label>
	<form:input type="text" id="outline" name="outline" size="50" path="outline" placeholder="請輸入大綱" />
</div>
<div>
	<label for="article">新聞內文：</label>
	<form:textarea type="text" id="article" name="article" cols="70" rows="10" path="article" placeholder="請輸入新聞內文" />
</div>
<div>
	<label for="price">販賣價格：</label>
	<form:input type="text" id="price" name="price" size="50" path="price" placeholder="請輸入販賣價格"  />
</div>
<div>
	<label for="limitTime">限時時間：</label>
	<form:input type="text" id="limitTime" name="limitTime" size="50" path="limitTime" placeholder="請輸入限時時間"  />
</div>
<div>
<label>上傳照片：</label>
file1:<input type="file" id="productImage" name="productImage" multiple ><br>
file2:<input type="file" id="productImage" name="productImage"><br>
file3:<input type="file" id="productImage" name="productImage"><br>
</div>
<div >
       <input type="submit" name="submit" id="submit" value="送出">
       <input type="reset" value="清除">
  </div>
</fieldset>
  
</form:form>
</div>
<%-- <form:form method="POST" modelAttribute="imageBean" id="form2" enctype="multipart/form-data"> --%>
<!-- <fieldset> -->
<!-- <div> -->
<!-- <label>上傳照片：</label> -->
<!-- file1:<input type="file" id="productImage" name="productImage" multiple ><br> -->
<!-- <!-- file2:<input type="file" id="productImage" name="productImage"><br> --> 
<!-- <!-- file3:<input type="file" id="productImage" name="productImage"><br> --> 
<!-- </div> -->
<!-- <div > -->
<!--  <input type="button" name="submit" value="送出" onclick="submitForms()"> -->
<!--  <input type="reset" value="清除"> -->
<!--   </div> -->
<!--   </fieldset> -->
<%-- </form:form> --%>
<!-- <script type="text/javascript"> -->

<!-- </script> -->

<!-- </div> -->
</body>
</html>