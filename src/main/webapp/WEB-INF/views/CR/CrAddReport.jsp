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
</head>
<body>
<div align="center">
       <h3 class="title" >客服表單申請</h3>
       </div>
       <div align="center">
        <form:form method="post" modelAttribute="crBean" 
        id="forms" enctype="multipart/form-data">       
            <table class="table" border="1" >
            <tr><td>
		<form:input type="text" path="memberId"></form:input>
		</td>
		</tr>
                <tr>
                    <td>客服類別:</td>
                    <td><form:select path="crClass" >
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
                    <form:input type="text" path="crTitle"></form:input>
                    </td>
                </tr>
                	<tr>
                    <td>客服內容:</td>
                    <td>
                    <form:input type="text" cols="30" rows="5" path="crContent"></form:input>
                	</tr>
                       
           <tr><td colspan="2" align="center">
            <input type="submit" value="送出表單" /> <input type="button" value="重設"  onclick="confirmreset()"/>
            <input type="button" value="取消申請"  onclick="confirmreturn()"/></td></tr>
       
 </table>
       </form:form> 
</div>

</body>
</html>