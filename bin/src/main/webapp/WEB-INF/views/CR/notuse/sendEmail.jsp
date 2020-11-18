<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
     "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Email with Spring MVC</title>
<script
	src='http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js'></script>
</head>
<body>
<nav>
<jsp:include page="/fragment/navbar.jsp"></jsp:include>
</nav>
<center style="margin-top:100px">
<form action="/message" method="post">
		<table>
    
    <tr>
        <td>用户名</td>
        <td><input type="text" name="name"></td>
    </tr>
    <tr>
        <td>标题</td>
        <td><input type="text" name="title"></td>
    </tr>
    <tr>
        <td>内容</td>
        <td><textarea name="content" id="" cols="30" rows="10"></textarea></td>
    </tr>
    <tr>
        <td colspan="2">  <input type="submit" value="提交"></td>
    </tr>
    
</table>
</form>

	</center>
</body>
</html>