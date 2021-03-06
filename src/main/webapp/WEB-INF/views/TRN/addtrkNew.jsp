<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<style type="text/css">
fieldset {
	
	width: 400px;
	margin: auto;
}
 input {
 padding:5px 15px; 
 background:#ccc; 
 border:0 none;
 cursor:pointer;
 -webkit-border-radius: 5px;
 border-radius: 5px; }
 
#wrap {
padding:20px;
  border-radius: 10px;
 background: #C4E1E1;	 
  
margin: 20px auto;
width: 724px;

}
#top { 

height: 26px;
}
#content {
padding: 0 40px 0 40px;
}
#bottom {            
height: 20px;
}
</style>
<title>trkNews</title>
</head>
<body>
    <nav class="navbar fixed-top">
		<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
	</nav>

	<section>
		<div class="container">
			<h1 style="text-align: center">建立追蹤新聞</h1>
		</div>
	</section>
	<hr style="height: 1px; border: none; color: #333; background-color: #333;">

	<section  class="container">
	<div style="background:#9c8f96" id="wrap">
	      
	         <div id="content">
		<!--       三個地方要完全一樣 -->
<!-- 		<table id="">	 -->
		<form:form method='POST' modelAttribute="trkNewsBean" class='form-horizontal'
			enctype="multipart/form-data" >
			<fieldset >
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='title'>
						標題 </label>
					<div class="col-lg-10">
						 <form:input id="title" path="title" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2"  for='author'>
						建立人 </label>
					<div class="col-lg-10">
						<form:input id="founder" path="founder" type='text'
							class='form:input-large' />
					</div>
				</div>
                
                <div class="form-group">
					<label class="control-label col-lg-2 col-lg-2"  for='author'>
						標籤 </label>
					<div class="col-lg-10">
						<form:input id="tag" path="tag" type='text'
							class='form:input-large' />
					</div>
				</div>
                
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="category">
						類型 </label>
					<div class='col-lg-10'>
						<form:select path="type">
							<form:option value="-1" label="請挑選" >請挑選 </form:option>
							<form:option value="社會">社會</form:option>
							<form:option value="國際">國際</form:option>
							<form:option value="政治">政治 </form:option>
							<form:option value="科技">科技</form:option>
							<form:option value="生活">生活</form:option>
							<form:option value="娛樂">娛樂</form:option>
							<form:option value="地方">地方</form:option>
							<%-- <form:options items="${typeList}" /> --%>
						</form:select>
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="price">
						發生地點 </label>
					<div class='col-lg-10'>
						<form:input id="ocplace" path="ocplace" type='text'
							class='form:input-large' />
					</div>
				</div>
				
				<div class="form-group" style="display:none">
					<label class='control-label col-lg-2 col-lg-2' for="price">
						點閱次數</label>
					<div class='col-lg-10'>
						<form:input id="clicnum" path="clicnum" type='text'
							class='form:input-large' />
					</div>
				</div>
				
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="bookNo">
						發生時間 </label>
					<div class='col-lg-10'>
						<form:input  data-format="yyyy-MM-dd" id="octime" path="octime" type='text' style="width:140px"
							class='form:input-large' />
					</div>
				</div>

                 <div class="form-group" style="display:none">
					<label class='control-label col-lg-2 col-lg-2' for="bookNo">
						建立時間 </label>
					<div class='col-lg-10'>
						<form:input  data-format="yyyy-MM-dd" id="fondtime" path="fondtime" type='text' style="width:118px"
							class='form:input-large' />
					</div>
				</div>

                <div class="form-group" style="display:none">
					<label class='control-label col-lg-2 col-lg-2' for="bookNo">
						狀態</label>
					<div class='col-lg-10'>
						<form:input   id="status" path="status" type='text' style="width:118px"
							value="1" class='form:input-large' />
					</div>
				</div>

                <div class="form-group" style="display:none">
					<label class='control-label col-lg-2 col-lg-2' for="price">
						追蹤人數</label>
					<div class='col-lg-10'>
						<form:input id="trcnum" path="trcnum" type='text'
							value="1" class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="price">
						內容 </label>
					<div class='col-lg-10'>
						<form:textarea style="resize:none;width:300px;height:200px;background:#ccc" id="descript" path="descript" type='text'
							class='form:input-large' />
					</div>
				</div>
				
				<div class="form-group">
       				<label class='control-label col-lg-2 col-lg-2' for="newsImage">
        				<%-- <spring:message code='spring.addProduct.form.image.label'/> --%>
        				    <!--   為了多語言 先標註各功能在對應不同語系的字元 -->
       				上傳圖片</label>
					<div class='col-lg-10'>        				
        				<form:input id="newsImage" path="newsImage" type='file' onchange="readURL(this)" 
        				targetID="preview_progressbarTW_img" class='form:input-large' accept="image/gif, image/jpeg, image/png" />
    				    <img class='i6' style="display:;" id="preview_progressbarTW_img" src="#" />
    				</div>
				</div> 
				
			
				
				<div class="form-group">
					<div class='col-lg-offset-2 col-lg-10'>
						<input id="btnAdd" type='submit' class='btn btn-primary'
							value="送出" />
					</div>
				</div>
			</fieldset>
		</form:form>
<!-- 	  </table>	 -->
         </div>
       
       </div>
	</section>

	<script>
	function readURL(input){
// 		    var i1 = document.getElementsByClassName("i6");
// 		     // i1.style.display = 'block'
// 		    	  i1.style.background = 'gray'
//		     console.log(i1)
		  if(input.files && input.files[0]){

		    var imageTagID = input.getAttribute("targetID");

		    var reader = new FileReader();

		    reader.onload = function (e) {

		       var img = document.getElementById(imageTagID);

		       img.setAttribute("src", e.target.result)

		    }

		    reader.readAsDataURL(input.files[0]);

		  }

		}
	
	</script>
</body>
</html>
