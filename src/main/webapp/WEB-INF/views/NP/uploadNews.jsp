<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/cssmenu/bootstrap_index.css">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="https://kit.fontawesome.com/ed0adb3a32.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.9/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.9/js/plugins/piexif.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.9/js/plugins/sortable.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.9/js/fileinput.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.9/themes/fas/theme.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.9/js/locales/LANG.js"></script> -->
<!-- <link rel="stylesheet" href="/fontawesome/css/all.min.css"> -->
<!-- <script type="text/javascript" src="/bootstrap-fileinput/themes/fas/theme.min.js"></script> -->

<title>上傳新聞欄位</title>
</head>
<body>
	<nav class="navbar fixed-top">
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>



	<div class="container" >

		<div style="margin-top: 150px;">
			<form:form method="POST" id="form1" modelAttribute="newsBean"
				enctype="multipart/form-data">
				<fieldset>
					<div class="form-group row">
						<label for="title" class="col-sm-2 col-form-label text-right">新聞標題：</label>
						<div class="col-sm-8">
							<form:input type="title" class="form-control" id="title"
								path="title" placeholder="請輸入標題" />
								
								<form:errors path="title" cssClass="error" />
						</div><span id="idspNews-title"></span>
						
					</div>
					<div class="form-group row">
						<label for="location" class="col-sm-2 col-form-label text-right">發生地點：</label>
						<div class="col-sm-8">
							<form:input type="text" class="form-control" id="location"
								name="location" size="50" path="location" placeholder="請輸入發生地點" />
							<form:errors path="location" cssClass="error" />
						</div><span id="idspNews-location"></span>
					</div>
					<div class="form-group row">
						<label for="newsType" class="col-sm-2 col-form-label text-right">新聞類型：</label>
						<div class="col-sm-4">
							<form:select path="newsType" class="form-control">
								<form:option value="none">分類項目</form:option>
								<form:option value="交通">交通</form:option>
								<form:option value="糾紛">糾紛</form:option>
								<form:option value="感情">感情</form:option>
								<form:option value="詐騙">詐騙</form:option>
								<form:option value="災情">災情</form:option>
								<form:option value="爆料">爆料</form:option>
							</form:select>
							<form:errors path="newsType" cssClass="error" />
						</div>
						<%-- 	<font color="red" size="-1">${errorMsg.errorCategoryNoEmpty}</font> --%>
					</div>

					<div class="form-group row">
						<label for="happenDate" class="col-sm-2 col-form-label text-right">發生日期：</label>
						<div class="col-sm-4">
							<form:input type="Date" id="happenDate" name="happenDate"
								class="form-control" size="50" path="happenDate" />
							<form:errors path="happenDate" cssClass="error" />
						</div>
					</div>
					<div class="form-group row">
						<label for="happenTime" class="col-sm-2 col-form-label text-right">發生時間：</label>
						<div class="col-sm-4">
							<form:input type="time" id="happenTime" name="happenTime"
								class="form-control" path="happenTime" />
							<form:errors path="happenTime" cssClass="error" />
						</div>
					</div>
					<div class="form-group row">
						<label for="outline" class="col-sm-2 col-form-label text-right">新聞大綱：</label>
						<div class="col-sm-8">
							<form:textarea type="text" id="outline" name="outline"   class="form-control"
								rows="3" maxlength="100" path="outline" placeholder="請輸入大綱" />								
							<form:errors path="outline" cssClass="error" />
						</div><span id="idspNews-outline"></span>
					</div>
					<div class="form-group row">
						<label for="article" class="col-sm-2 col-form-label text-right">新聞內文：</label>
						<div class="col-sm-8">
						<form:textarea type="text" id="article" name="article" cols="70"  class="form-control"
							rows="10" path="article" placeholder="請輸入新聞內文" />
						<form:errors path="article" cssClass="error" />
						</div><span id="idspNews-article"></span>
					</div>
					<div class="form-group row">
						<label for="price" class="col-sm-2 col-form-label text-right">販賣價格：</label>
						<div class="col-sm-4">
							<form:input type="text" id="price" name="price" size="50"
								class="form-control" path="price" placeholder="請輸入販賣價格" />
							<form:errors path="price" cssClass="error" />
						</div><span id="idspNews-price"></span>
					</div>
					
					
					<div class="form-group" style="background-color:white;">
					<input id="productImage" name="productImage" type="file" class="file" multiple  data-show-upload="false" data-show-caption="true" data-msg-placeholder="Select {files} for upload...">
					<form:errors path="productImage" cssClass="error" />

<!-- 						<label for="price" class="col-sm-2 col-form-label text-right">上傳照片：</label> -->
<!-- 						<div class="col-sm-8"> -->
<!-- 							<input type="file" id="productImage" name="productImage" multiple> -->
<!-- 							<input type="file" id="productImage" name="productImage"> -->
<!-- 							<input type="file" id="productImage" name="productImage"> -->
<!-- 						</div> -->
					</div>
					<div class="form-group row">
						<label for="price" class="col-sm-2 col-form-label text-right"></label>
						<div class="col-sm-8">
							<input type="submit" name="submit" id="submit" value="送出">
							<input type="reset" value="清除">
						</div>
					</div>
				</fieldset>

			</form:form>
		</div>
<!-- <input id="input-b1" name="input-b1" type="file" class="file" data-browse-on-zone-click="true"> -->

    </div>
    <script>
// 		$("#input-id").fileinput({
// 			theme: 'fas', //this line
// 			});
		//新聞標題需大於五個字
      	 $("#title").blur(function(){                      
          let NameObjValLen = $("#title").val().length;
          if ($("#title").val()=="") {
          		$("#idspNews-title").text("請輸入標題")
          } else if (NameObjValLen >= 5) {           
                 $("#idspNews-title").text("正確 !")            
          } else {
          		$("#idspNews-title").text("請輸入五個字以上")
          }        
      })
      //發生地點需大於一個字
      	 $("#location").blur(function(){                      
          let NameObjValLen = $("#location").val().length;
          if ($("#location").val()=="") {
          		$("#idspNews-location").text("請輸入地點")           
          } else {
          		$("#idspNews-location").text("正確 !")
          }        
      })
      //新聞大綱需大於一百字且小於一百字	
     	 $("#outline").blur(function(){                      
         let NameObjValLen = $("#outline").val().length;
         if ($("#outline").val()=="") {
         		$("#idspNews-outline").text("請輸入大綱")
         } else if (NameObjValLen >= 20) {           
                $("#idspNews-outline").text("正確 !")            
         } else {
         		$("#idspNews-outline").text("請輸入二十字以上")
         }        
     })   
		//新聞內文需大於一百字且小於一千字	
     	 $("#article").blur(function(){                      
         let NameObjValLen = $("#article").val().length;
         if ($("#article").val()=="") {
         		$("#idspNews-article").text("請輸入內文")
         } else if (NameObjValLen >= 100) {           
                $("#idspNews-article").text("正確 !")            
         } else {
         		$("#idspNews-article").text("請輸入一百字以上")
         }        
     })   
     
     	//需輸入金額且為數字
     	$("#price").blur(function(){                      
          let NameObjValLen = $("#price").val().length;
          if ($("#price").val()=="") {
          		$("#idspNews-price").text("請輸入金額")           
          } else {
          		$("#idspNews-price").text("正確 !")
          }        
      })
     
    </script>
</body>
</html>