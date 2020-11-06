<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>申請客服表單</title>
<script src="https://cdn.ckeditor.com/4.15.0/standard/ckeditor.js"></script>

</head>
<body>
<nav>
<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
</nav>
<section style="margin-top:100px">
<div align="center">
       <h3 class="title" >客服表單申請</h3>
       </div>
       <div align="center">
        <form:form method="post" modelAttribute="crBean" 
        id="forms" enctype="multipart/form-data">       
            <table class="table" border="1" >
            <tr><td>
		<form:input type="text" path="memberId" value="1"></form:input>
		</td>
		</tr>
                <tr>
                    <td>客服類別:</td>
                    <td>
                    <form:select path="crClass" >
                    	<option>帳號相關</option>
                    	<option>交易相關</option>                    	
                    	<option>商品相關</option>
                    	<option>申請合作</option>
                    	<option>提議</option>
                    	<option>其他</option>
                    </form:select>                   										
                    </td>
                </tr>
                <tr>
                    <td>客服主題:</td>
                    <td>
                    <form:input type="text" placeholder="請輸入客服主題" path="crTitle"></form:input>
                    </td>
                </tr>
                	<tr>
                    <td>客服內容:</td>
                    <td>
                    <form:input type="textarea" cols="30" rows="5" path="crContent"></form:input>
                	</tr>
                       
           <tr><td colspan="2" align="center">
            <input type="submit" value="送出表單" /> 
            <input type="reset" value="重設" />
            <input type="button" value="取消申請"  onclick="confirmreturn()"/></td></tr>
       
 </table>
       </form:form> 
</div>
<div class="fb-customerchat"
 page_id="110363554196945"
 minimized="false">
</div>
</section>


</body>
</html>