<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增影片</title>
<link rel="stylesheet" href="/project/css/default.css">
<style>
body {
	background-attachment: fixed;
	/*background-color: #EBFFEB;*/
	background-repeat: no-repeat;
	background-position: 20px 50px;
}

.st1 {
	text-align: left;
	width: 200px;
	margin: 20px;
}

.sub {
	background-color: #dcdcdc;
}

textarea {
	resize: none;
}
</style>
</head>
<body>
<%-- 	<jsp:include page="/test/topside.html" /> --%>
	<div id="content">
		<div id="sidebar">
			<ul>
				<li><a href="IndexTest.jsp" accesskey="1" title="">首頁</a></li>
				<li><a href="uploadFormTest.jsp" accesskey="2" title="">新增上傳</a></li>
				<li><a href="../ExclusiveNews/GetNews.html" accesskey="3"
					title="">查詢</a></li>
				<li><a href="/practice/RetrieveAllNews" accesskey="4" title="">全部內容</a></li>
				<li><a href="#" accesskey="5" title="">Contact Us</a></li>
			</ul>
		</div>
		<div id="page" class="container">
			<form:form method="post"  modelAttribute="singleArticle" enctype="multipart/form-data" >
			////////////////////////////////////////////////////////////////////////////////
<!-- 			<fieldset> -->
<!-- 									<div> -->
<!-- 										<label for="title">標題</label> -->
<!-- 										<div> -->
<%-- 											<form:input type="option" id="category" path="category" /> --%>
<%-- 												<form:errors path="category" cssClass="error"/> --%>
<!-- 										</div> -->
<!-- 												<label class="col-md-1 col-form-label text-md-right" -->
<!-- 											for="title"> 標題</label> -->
<!-- 										<div class="col-md-3"> -->
<%-- 											<form:input id="title" path="title" type='text' /> --%>
<%-- 													<form:errors path="title" /> --%>
<!-- 										</div> -->
<!-- 									</div> -->

								
<!-- 										<div class="form-group row"> -->
<!-- 										<label class="col-md-2 col-form-label text-md-right" -->
<!-- 											for="productrelation">商品敘述 </label> -->
<!-- 										<div class="col-md-4"> -->
<%-- 											<form:input id="productrelation" path="productrelation" --%>
<%-- 												type='text' class="form-control input-md" /> --%>
<%-- 													<form:errors path="productrelation" cssClass="error"/> --%>
<!-- 										</div> -->
<!-- 										<label class="col-md-1 col-form-label text-md-right" -->
<!-- 											for='shoppingProductTotal'> 數量</label> -->
<!-- 										<div class="col-md-3"> -->
<%-- 											<form:input id="shoppingProductTotal" --%>
<%-- 												path="shoppingProductTotal" type='text' --%>
<%-- 												class="form-control input-md" /> --%>
<%-- 												<form:errors path="shoppingProductTotal" cssClass="error"/> --%>
<!-- 										</div> -->
<!-- 									</div> -->



<!-- 									<div class="form-group row"> -->
<!-- 										<label class="col-md-2 col-form-label text-md-right" -->
<!-- 											for="shoppingProductPrice"> 價格 </label> -->
<!-- 										<div class="col-md-3"> -->
<%-- 											<form:input id="shoppingProductPrice" --%>
<%-- 												path="shoppingProductPrice" type='text' --%>
<%-- 												class="form-control input-md" /> --%>
<%-- 												<form:errors path="shoppingProductPrice" cssClass="error"/> --%>
<!-- 										</div> -->
<!-- 										<label class="col-md-2 col-form-label text-md-right" -->
<!-- 											for="shoppingProductDiscount"> 折扣</label> -->
<!-- 										<div class="col-md-3"> -->
<%-- 											<form:input id="shoppingProductDiscount" --%>
<%-- 												path="shoppingProductDiscount" type='text' --%>
<%-- 												class="form-control input-md" /> --%>
<%-- 												<form:errors path="shoppingProductDiscount" cssClass="error"/> --%>
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="form-group row"> -->
<!-- 										<label for="your_pass" class="col-md-2 col-form-label text-md-right" -->
<!-- 											for='productImage'><i></i> 照片上傳 </label> -->
<!-- 										<div class="col-md-4"> -->
<%-- 											<form:input path="productImage" type='file' /> --%>
<%-- 											<form:errors path="productImage" cssClass="error"/> --%>
<!-- 										</div> -->
<!-- 										<div class="form-group "> -->
<!-- 												<img  id="productImage1" > -->
<!-- 											</div> -->
										
						
<!--                                    </div> -->
<!-- 									<div class='col-lg-offset-2 col-lg-12'> -->
<!-- 										<input id="btnAdd" type='submit' -->
<!-- 											class="btn btn-secondary btn-lg btn-block" value="送出" /> -->
<!-- 										<input type='button' class='btn btn-primary float-right'  id='clickmeS' value='一鍵Demo' > -->
<!-- 									</div> -->
									

								</fieldset>
			
			
			////////////////////////////////////////////////////////////////////////////////
			
			
			
				<div align="center">
					<h2>新增影片</h2>
					<hr>
					<div class="st1">
						<label for="category" class="t1">類別:</label> <select name="category">
							<option value="100">生活</option>
							<option value="200">趣味</option>
							<option value="300">美食</option>
							<option value="400">寵物</option>
							<option value="500">惡搞</option>
						</select>
					</div>
					<div class="st1">
						<label class="t1" for="title">標題:</label> <input type="text"
							id="title" name="title" size="30" autofocus
							placeholder="今晚我想來點..." autocomplete="on" value="title"> <font
							color="red" size="1">${errorMsg.title}</font>
					</div>
					<div class="st1">
						<label class="t1" for="link1">影片連結:</label> <input type="text"
							id="link1" name="link1" size="30"
							placeholder="https://www.youtube.com/..." autocomplete="off">
						<font color="red" size="1">${errorMsg.link}</font>
					</div>
					<div class="st1">
						<label class="t1" for="">照片:</label> <input type="file" id="img1"
							name="img1" multiple>
					</div>
					<div class="st1">
						<label class="t1" for="text1">內容:</label>
						<textarea name="text1" id="cols1" cols="30" rows="10"
							maxlength="250" placeholder="限輸入250字"></textarea>
					</div>
					<div id="btnArea" align="center">
						<input class="sub" type="submit" name="submit" id="submit"
							value="送出" /> <input class="sub" type="reset" name="cancel"
							id="cancel" value="清除" />
					</div>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>